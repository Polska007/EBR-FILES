@echo off
title EBR Dashboard Server — Polaris Bank
color 0A

echo.
echo  ╔══════════════════════════════════════════════════════╗
echo  ║      EBR Executive Dashboard — Polaris Bank          ║
echo  ║      Automated Data Backend + Executive Frontend     ║
echo  ╚══════════════════════════════════════════════════════╝
echo.

:: Check Python
python --version >nul 2>&1
if errorlevel 1 (
    echo  [ERROR] Python not found. Please install Python 3.9+ from python.org
    pause
    exit /b 1
)

:: Install dependencies silently
echo  [1/3] Installing dependencies...
pip install -r backend\requirements.txt -q --disable-pip-version-check
if errorlevel 1 (
    echo  [ERROR] Failed to install dependencies.
    pause
    exit /b 1
)

echo  [2/3] Dependencies ready.
echo  [3/3] Starting EBR Dashboard server...
echo.
echo  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo  Dashboard URL :  http://localhost:5000
echo  Admin Panel   :  Click "Manage Data" in the top-right
echo  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo.
echo  Opening browser in 3 seconds...
timeout /t 3 /nobreak >nul
start http://localhost:5000

python backend\app.py

echo.
echo  Server stopped. Press any key to exit.
pause >nul
