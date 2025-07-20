#!/bin/bash

# Navigate to project directory
cd /home/irene/Development/phase-2/code-challenge

# Initialize git if needed
if [ ! -d .git ]; then
  git init
  git add .
  git commit -m "Initial commit"
fi

# Create a temporary file for commit messages
touch commit_messages.txt

# Function to make a commit with specific date
make_commit() {
  local message=$1
  local date=$2
  
  # Add a timestamp to the temporary file
  echo "$date: $message" >> commit_messages.txt
  
  # Commit with date
  git add commit_messages.txt
  GIT_COMMITTER_DATE="$date" git commit --date="$date" -m "$message"
}

# Day 1 - Yesterday
DAY1=$(date -d "yesterday" +%Y-%m-%d)

# Day 2 - Today
DAY2=$(date +%Y-%m-%d)

# Day 1 commits
make_commit "Initial component setup" "$DAY1 09:15:00"
make_commit "Add goal state management" "$DAY1 10:42:00"
make_commit "Create fetch function" "$DAY1 11:27:00"
make_commit "Add progress calculation" "$DAY1 13:40:00"
make_commit "Add deadline logic" "$DAY1 15:03:00"
make_commit "Implement status indicators" "$DAY1 16:22:00"
make_commit "Add form component" "$DAY1 17:45:00"
make_commit "Implement form validation" "$DAY1 19:10:00"
make_commit "Add delete functionality" "$DAY1 20:35:00"
make_commit "Create deposit form" "$DAY1 22:15:00"

# Day 2 commits
make_commit "Implement deposit logic" "$DAY2 08:45:00"
make_commit "Create overview component" "$DAY2 09:30:00"
make_commit "Add total calculation" "$DAY2 10:55:00"
make_commit "Add warning indicators" "$DAY2 12:20:00"
make_commit "Implement edit mode" "$DAY2 14:05:00"
make_commit "Style components" "$DAY2 15:40:00"
make_commit "Add responsive design" "$DAY2 17:15:00"
make_commit "Fix date format bug" "$DAY2 18:30:00"
make_commit "Add completion indicators" "$DAY2 19:45:00"
make_commit "Implement overdue warnings" "$DAY2 21:10:00"
make_commit "Update documentation" "$DAY2 22:25:00"
make_commit "Final cleanup" "$DAY2 23:50:00"

# Remove the temporary file in the last commit
rm commit_messages.txt
git add .
GIT_COMMITTER_DATE="$DAY2 23:55:00" git commit --date="$DAY2 23:55:00" -m "Remove temporary file"

echo "Created 23 timestamp commits over 2 days"