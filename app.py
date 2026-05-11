import os
import threading
import uuid

import yt_dlp
from flask import Flask, jsonify, render_template, request


BASE_DIR = os.path.abspath(os.path.dirname(__file__))
DOWNLOAD_DIR = os.path.join(BASE_DIR, "downloads")

app = Flask(__name__)
jobs = {}


def update_job(job_id, **values):
    jobs[job_id].update(values)


def download_video(job_id, url):
    def progress_hook(data):
        if data["status"] == "downloading":
            total = data.get("total_bytes") or data.get("total_bytes_estimate") or 0
            downloaded = data.get("downloaded_bytes") or 0
            percent = downloaded / total * 100 if total else jobs[job_id].get("percent", 0)
            update_job(
                job_id,
                status="Downloading",
                percent=percent,
                filename=os.path.basename(data.get("filename") or ""),
            )
        elif data["status"] == "finished":
            update_job(
                job_id,
                status="Merging",
                percent=99,
                filename=os.path.basename(data.get("filename") or ""),
            )

    options = {
        "format": "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best",
        "outtmpl": os.path.join(DOWNLOAD_DIR, "%(title)s.%(ext)s"),
        "merge_output_format": "mp4",
        "windowsfilenames": True,
        "continuedl": True,
        "extractor_retries": 3,
        "progress_hooks": [progress_hook],
    }

    try:
        os.makedirs(DOWNLOAD_DIR, exist_ok=True)
        update_job(job_id, status="Starting", percent=0, message="Contacting video site...")
        with yt_dlp.YoutubeDL(options) as ydl:
            info = ydl.extract_info(url, download=True)
            filename = ydl.prepare_filename(info)
            filename = os.path.splitext(filename)[0] + ".mp4"
        update_job(job_id, status="Complete", percent=100, done=True, filename=filename)
    except Exception as error:
        update_job(job_id, status="Error", error=str(error), done=True)


@app.get("/")
def index():
    return render_template("index.html")


@app.post("/download")
def start_download():
    url = (request.json or {}).get("url", "").strip()
    if not url:
        return jsonify({"error": "Enter a video URL."}), 400

    job_id = uuid.uuid4().hex
    jobs[job_id] = {"status": "Queued", "percent": 0, "done": False}
    thread = threading.Thread(target=download_video, args=(job_id, url), daemon=True)
    thread.start()
    return jsonify({"job_id": job_id})


@app.get("/status/<job_id>")
def status(job_id):
    job = jobs.get(job_id)
    if not job:
        return jsonify({"error": "Job not found.", "done": True}), 404
    return jsonify(job)


def main():
    app.run(host="127.0.0.1", port=5000, debug=False)


if __name__ == "__main__":
    main()
