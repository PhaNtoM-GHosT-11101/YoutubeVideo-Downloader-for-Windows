# StreamVault Local

Minimal local video downloader built with Python, Flask, and yt-dlp.

Created by **Aditya Priyadarshi**.

## Overview

StreamVault Local is a clean local web app for downloading publicly accessible videos in the best available MP4 quality with audio. Paste a URL, start the download, and track progress from a browser-based interface.

> GitHub Pages note: GitHub Pages can only host static websites. The downloader itself requires Python, so it runs locally on your computer. The `docs/` folder is included as a polished GitHub Pages landing page for the project.

## Features

- Local browser-based interface
- Best available MP4 video and audio download
- Automatic audio/video merging
- Real-time progress updates
- Resume support for interrupted downloads
- Clean project structure for GitHub
- GitHub Pages landing page in `docs/`

## Project Structure

```text
streamvault-local/
├── app.py
├── download_video.py
├── requirements.txt
├── templates/
│   └── index.html
├── static/
│   ├── app.js
│   └── styles.css
├── downloads/
│   └── .gitkeep
├── docs/
│   └── index.html
├── LICENSE
└── README.md
```

## Requirements

- Python 3.10 or newer
- pip
- ffmpeg installed and available on your system PATH for merging separate audio/video streams

## Installation

Clone the repository:

```bash
git clone https://github.com/your-username/streamvault-local.git
cd streamvault-local
```

Create a virtual environment:

```bash
python -m venv .venv
```

Activate the virtual environment on Windows:

```bash
.venv\Scripts\activate
```

Activate the virtual environment on macOS or Linux:

```bash
source .venv/bin/activate
```

Install dependencies:

```bash
pip install -r requirements.txt
```

## Usage

Start the app:

```bash
python app.py
```

Open this URL in your browser:

```text
http://127.0.0.1:5000
```

Paste a video URL and click **Download**. Completed files are saved in:

```text
downloads/
```

You can also start the same app with:

```bash
python download_video.py
```

## GitHub Pages

This project includes a static landing page in the `docs/` folder.

To enable it:

1. Push this repository to GitHub.
2. Open repository **Settings**.
3. Go to **Pages**.
4. Set **Source** to `Deploy from a branch`.
5. Select your main branch and choose `/docs` as the folder.
6. Save.

The GitHub Pages site is only a landing page. It cannot run the Python downloader because GitHub Pages does not support backend Python apps.

## Responsible Use

Use this tool only for videos you own, videos in the public domain, Creative Commons content, or content you are otherwise allowed to download. Respect website terms of service and copyright laws.

## License

This project is licensed under the MIT License. See `LICENSE` for details.

## Author

**Aditya Priyadarshi**

Built with a focus on simplicity, speed, and a minimal user experience.
