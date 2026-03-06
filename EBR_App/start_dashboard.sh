#!/bin/bash
clear
echo ""
echo "  ╔══════════════════════════════════════════════════════╗"
echo "  ║      EBR Executive Dashboard — Polaris Bank          ║"
echo "  ║      Automated Data Backend + Executive Frontend     ║"
echo "  ╚══════════════════════════════════════════════════════╝"
echo ""

# Check Python
if ! command -v python3 &> /dev/null; then
    echo "  [ERROR] Python 3 not found. Please install from python.org"
    exit 1
fi

echo "  [1/3] Installing dependencies..."
pip3 install -r backend/requirements.txt -q --disable-pip-version-check 2>/dev/null || \
pip3 install -r backend/requirements.txt -q

echo "  [2/3] Dependencies ready."
echo "  [3/3] Starting EBR Dashboard server..."
echo ""
echo "  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  Dashboard URL :  http://localhost:5000"
echo "  Admin Panel   :  Click 'Manage Data' in the top-right"
echo "  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "  Opening browser in 3 seconds..."
sleep 3

# Open browser based on OS
if [[ "$OSTYPE" == "darwin"* ]]; then
    open http://localhost:5000
else
    xdg-open http://localhost:5000 2>/dev/null || echo "  Open http://localhost:5000 in your browser."
fi

python3 backend/app.py
