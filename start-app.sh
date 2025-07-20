#!/bin/bash

# Navigate to project directory
cd /home/irene/Development/phase-2/code-challenge

# Check if json-server is already running
if ! nc -z localhost 3000 &>/dev/null; then
  echo "Starting json-server..."
  # Start json-server in the background
  npm run server &
  # Wait for server to start
  sleep 2
  echo "json-server started on port 3000"
else
  echo "json-server is already running on port 3000"
fi

# Start the React app
echo "Starting React app..."
npm run dev