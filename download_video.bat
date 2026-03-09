@echo off
setlocal enabledelayedexpansion
title YouTube Video Downloader ~ by Aditya Priyadarshi
mode con: cols=85 lines=40
chcp 437 >nul

:: ========================================
:: SPLASH SCREEN (FIXED ESCAPED CHARACTERS)
:: ========================================
color 0C
cls
echo.
echo  ##################################################################
echo  ##                                                              ##
echo  ##    __   ______  _   _  _____  _   _  ____  ____              ##
echo  ##    \ \ / / __ \^| ^| ^| ^|^|_   _^|^| ^| ^| ^|^| __ )^| ___             ##
echo  ##     \ V / ^|  ^| ^| ^| ^| ^|  ^| ^|  ^| ^| ^| ^|^|  _ \^|  _^|              ##
echo  ##      ^| ^|^| ^|__^| ^| ^|_^| ^|  ^| ^|  ^| ^|_^| ^|^| ^|_) ^| ^|___             ##
echo  ##      ^|_^| \____/ \___/   ^|_^|   \___/ ^|____/^|_____^|            ##
echo  ##                                                              ##
echo  ##        VIDEO  DOWNLOADER (FIXED EDITION)                     ##
echo  ##                                                              ##
echo  ##################################################################
echo.
color 0B
echo       Made with ^<3 by  Aditya Priyadarshi
echo       github.com/PhaNtoM-GHosT-11101
echo  ================================================================
echo.

:: ========================================
:: DEPENDENCY CHECK
:: ========================================
echo  [1/3] Checking Python...
python --version >nul 2>&1
if errorlevel 1 (
    color 0C
    echo [!] ERROR: Python not found in PATH.
    pause
    exit /b
)

echo  [2/3] Checking yt-dlp...
python -m yt_dlp --version >nul 2>&1
if errorlevel 1 (
    echo [!] Installing yt-dlp...
    python -m pip install yt-dlp
)

:: Locate FFmpeg [cite: 16-20]
set "FF_PATH="
ffmpeg -version >nul 2>&1
if %errorlevel% equ 0 (
    set "FF_PATH=ffmpeg"
) else (
    for %%P in ("C:\ffmpeg\bin\ffmpeg.exe" "C:\Program Files\ffmpeg\bin\ffmpeg.exe") do (
        if exist "%%~P" set "FF_PATH=%%~P"
    )
)

:: ========================================
:: MAIN DOWNLOADER [cite: 23-27]
:: ========================================
:start
color 07
echo.
set "URL="
set /p URL="  > Paste YouTube URL: "

if "%URL%"=="" goto start

echo.
color 0E
echo  [ FETCHING FORMATS ] ...
python -m yt_dlp -F "%URL%"
echo.

color 0B
echo  [1] Best (Auto)  [2] 1080p  [3] 720p  [4] 480p  [5] Custom
set /p CHOICE="  > Selection (1-5): "

if "%CHOICE%"=="1" set "FORMAT=bestvideo+bestaudio/best"
if "%CHOICE%"=="2" set "FORMAT=bestvideo[height<=1080]+bestaudio/best"
if "%CHOICE%"=="3" set "FORMAT=bestvideo[height<=720]+bestaudio/best"
if "%CHOICE%"=="4" set "FORMAT=bestvideo[height<=480]+bestaudio/best"
if "%CHOICE%"=="5" (
    set /p FCODE="  > Enter code: "
    set "FORMAT=!FCODE!+bestaudio/best"
)

:: DOWNLOAD EXECUTION [cite: 42-43]
echo.
color 0A
python -m yt_dlp -f "%FORMAT%" ^
    --ffmpeg-location "!FF_PATH!" ^
    --merge-output-format mp4 ^
    -o "%USERPROFILE%\Downloads\%%(title)s.%%(ext)s" ^
    "%URL%"

echo.
set /p AGAIN="  > Another? (y/n): "
if /i "%AGAIN%"=="y" goto start
pause
