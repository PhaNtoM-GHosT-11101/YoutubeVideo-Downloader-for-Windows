# 📥 YouTube Downloader

A simple, powerful Windows batch script to download YouTube videos in any quality with audio always merged — no coding required.

Built on top of [yt-dlp](https://github.com/yt-dlp/yt-dlp) and [ffmpeg](https://ffmpeg.org/).

---

## ✨ Features

- 🔍 **Shows all available formats** with file sizes before downloading
- 📊 **Estimates download size** before you commit
- 🎵 **Audio always merged** into final MP4 automatically
- ⚡ **Quick quality options** — Best, 1080p, 720p, 480p, 360p
- 🎛️ **Custom format code** — pick any exact format from the list
- 🛠️ **Auto-installs prerequisites** — yt-dlp, ffmpeg installed/updated automatically on launch
- 🔄 **Download multiple videos** in one session
- 💾 **Saves to your Downloads folder** automatically

---

## 🖥️ Preview

```
========================================
  Checking Prerequisites...
========================================

[OK] Python 3.14 found
[OK] yt-dlp v2026.1.29 found
[OK] ffmpeg found
[OK] yt-dlp is up to date.

========================================
     YouTube Video Downloader
========================================

Paste YouTube URL here: https://youtu.be/xxxxxxx

Fetching available formats and file sizes...

ID   EXT   RESOLUTION  FPS  FILESIZE
137  mp4   1920x1080   30   250.3MiB
248  webm  1920x1080   30   210.1MiB
136  mp4   1280x720    30   130.5MiB
...

========================================
 QUICK OPTIONS (audio always included):
========================================
 [1] Best quality (auto)
 [2] 1080p
 [3] 720p
 [4] 480p
 [5] 360p
 [6] Custom format code
========================================

Enter choice (1-6): 2

Estimating total download size...
  Title : My Awesome Video
  Size  : ~260.4MiB

Proceed with download? (y/n): y

Downloading with audio merged into MP4...
```

---

## 🚀 Getting Started

### Prerequisites

You only need **Python** installed. Everything else is handled automatically by the script.

- Download Python from [python.org](https://python.org)
- ✅ Make sure to check **"Add Python to PATH"** during installation

### Installation

1. **Clone the repo**
   ```bash
   git clone https://github.com/PhaNtoM-GHosT-11101/youtube-downloader.git
   ```

2. **Navigate to the folder**
   ```bash
   cd youtube-downloader
   ```

3. **Double-click `download_video.bat`**

That's it! The script will automatically:
- Check for yt-dlp and install it if missing
- Check for ffmpeg and install it via `winget` if missing
- Update yt-dlp to the latest version

---

## 📖 Usage

1. Run `download_video.bat`
2. Paste a YouTube URL when prompted
3. Browse the list of available formats and file sizes
4. Pick a quality option (1–6)
5. Confirm the download size
6. Video saves to your **Downloads folder** as an MP4

---

## 🗂️ File Structure

```
youtube-downloader/
│
├── download_video.bat     # Main script
└── README.md              # Documentation
```

---

## 📦 Dependencies

| Tool | Purpose | Auto-installed? |
|------|---------|----------------|
| [yt-dlp](https://github.com/yt-dlp/yt-dlp) | Video downloading | ✅ Yes |
| [ffmpeg](https://ffmpeg.org/) | Merging video + audio | ✅ Yes (via winget) |
| Python 3.x | Runtime | ❌ Manual (one-time) |

---

## 🤝 How to Contribute

Contributions are welcome! Here's how:

1. **Fork** the repository
2. **Create a branch** for your feature
   ```bash
   git checkout -b feature/your-feature-name
   ```
3. **Commit** your changes
   ```bash
   git commit -m "Add: your feature description"
   ```
4. **Push** to your fork
   ```bash
   git push origin feature/your-feature-name
   ```
5. Open a **Pull Request** and describe what you changed

### Ideas for contributions
- Add playlist download support
- Add download progress bar
- Add subtitle download option
- Add audio-only (MP3) mode option

---

## 📋 Changelog

### v1.0.0 — March 2026
- Initial release
- Auto prerequisite checking and installation (yt-dlp, ffmpeg)
- Format listing with file sizes
- Quick quality options (Best, 1080p, 720p, 480p, 360p)
- Custom format code support
- Size estimation before download
- Audio always merged into MP4
- Multi-video session support

---

## 📄 License

MIT License — © 2026 Aditya Priyadarshi

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

---

## ⚠️ Disclaimer

This tool is intended for personal use only. Downloading YouTube videos may violate [YouTube's Terms of Service](https://www.youtube.com/t/terms). Only download content you have permission to download or that is licensed for offline use.

---

<p align="center">Made with ❤️ by <a href="https://github.com/PhaNtoM-GHosT-11101">Aditya Priyadarshi</a></p>
