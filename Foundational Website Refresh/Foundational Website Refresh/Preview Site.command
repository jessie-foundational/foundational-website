#!/bin/bash
# ──────────────────────────────────────────────────
# Foundational Website — Local Preview Server
# Double-click this file to start a local preview
# ──────────────────────────────────────────────────

# Change to the folder containing this script
cd "$(dirname "$0")"

# Pick a port
PORT=8765

# Check if something is already running on that port and kill it
lsof -ti tcp:$PORT | xargs kill -9 2>/dev/null

# Small pause to let the port clear
sleep 0.5

# Open Chrome to the home page (slight delay so server is ready)
(sleep 1 && open -a "Google Chrome" "http://localhost:$PORT/index.html") &

echo ""
echo "  ✦ Foundational local preview running at:"
echo "    http://localhost:$PORT"
echo ""
echo "  Press Ctrl+C to stop the server."
echo ""

# Start the server (this keeps the terminal window open)
python3 -m http.server $PORT
