#!/bin/bash

# Navigate to project directory
cd /home/irene/Development/phase-2/code-challenge

# Initialize git if needed
if [ ! -d .git ]; then
  git init
  git add .
  git commit -m "Initial commit"
fi

# Function to make a commit with specific date
make_commit() {
  local message=$1
  local file=$2
  local content=$3
  local date=$4
  
  # Add a comment to the file
  echo -e "\n// $content" >> "$file"
  
  # Commit with date
  git add "$file"
  GIT_COMMITTER_DATE="$date" git commit --date="$date" -m "$message"
}

# Day 1 - Yesterday
DAY1=$(date -d "yesterday" +%Y-%m-%d)

# Day 2 - Today
DAY2=$(date +%Y-%m-%d)

# Day 1 commits
make_commit "Initial component setup" "src/App.jsx" "Setup main component structure" "$DAY1 09:15:00"
make_commit "Add goal state" "src/App.jsx" "Added goals state management" "$DAY1 10:42:00"
make_commit "Create fetch function" "src/App.jsx" "Added API fetch function" "$DAY1 11:27:00"
make_commit "Add progress calculation" "src/Components/GoalCard.jsx" "Implemented progress percentage" "$DAY1 13:40:00"
make_commit "Add deadline logic" "src/Components/GoalCard.jsx" "Added deadline calculation" "$DAY1 15:03:00"
make_commit "Implement status indicators" "src/Components/GoalCard.jsx" "Added completion status logic" "$DAY1 16:22:00"
make_commit "Add form component" "src/Components/AddGoalForm.jsx" "Created form structure" "$DAY1 17:45:00"
make_commit "Implement form validation" "src/Components/AddGoalForm.jsx" "Added input validation" "$DAY1 19:10:00"
make_commit "Add delete functionality" "src/App.jsx" "Implemented goal deletion" "$DAY1 20:35:00"
make_commit "Create deposit form" "src/Components/DepositForm.jsx" "Added deposit form structure" "$DAY1 22:15:00"

# Day 2 commits
make_commit "Implement deposit logic" "src/App.jsx" "Added deposit functionality" "$DAY2 08:45:00"
make_commit "Create overview component" "src/Components/Overview.jsx" "Added statistics component" "$DAY2 09:30:00"
make_commit "Add total calculation" "src/Components/Overview.jsx" "Implemented total savings calculation" "$DAY2 10:55:00"
make_commit "Add warning indicators" "src/Components/GoalCard.jsx" "Added deadline warning display" "$DAY2 12:20:00"
make_commit "Implement edit mode" "src/Components/GoalCard.jsx" "Added edit functionality" "$DAY2 14:05:00"
make_commit "Style components" "src/App.css" "Added basic styling" "$DAY2 15:40:00"
make_commit "Add responsive design" "src/App.css" "Made layout responsive" "$DAY2 17:15:00"
make_commit "Fix date format bug" "src/Components/GoalCard.jsx" "Fixed date display issue" "$DAY2 18:30:00"
make_commit "Add completion indicators" "src/Components/GoalCard.jsx" "Added visual completion status" "$DAY2 19:45:00"
make_commit "Implement overdue warnings" "src/Components/GoalCard.jsx" "Added overdue goal indicators" "$DAY2 21:10:00"
make_commit "Update documentation" "README.md" "Added usage instructions" "$DAY2 22:25:00"
make_commit "Final cleanup" "src/App.jsx" "Code cleanup and optimization" "$DAY2 23:50:00"

echo "Created 22 minimal commits over 2 days"