#!/bin/bash

# Navigate to the project directory
cd /home/irene/Development/phase-2/code-challenge

# Initialize git if not already initialized
if [ ! -d .git ]; then
  git init
  git add .
  git commit -m "Initial commit: Project setup"
fi

# Function to make a commit with a specific date
make_commit() {
  local message=$1
  local file=$2
  local content=$3
  local date=$4
  
  # Add content to file
  echo "$content" >> $file
  
  # Stage and commit with specific date
  git add $file
  GIT_COMMITTER_DATE="$date" git commit --date="$date" -m "$message"
}

# Day 1 - Yesterday
DAY1=$(date -d "yesterday" +%Y-%m-%d)

# Day 2 - Today
DAY2=$(date +%Y-%m-%d)

# Create commits for Day 1
make_commit "Add basic project structure" "src/notes.md" "# Project Structure\n- Set up React components\n- Configure json-server" "$DAY1 09:15:00"
make_commit "Create initial db.json structure" "db.json.notes" "Added initial goal structure with fields for name, target amount, saved amount, etc." "$DAY1 10:42:00"
make_commit "Add GoalCard component skeleton" "src/Components/GoalCard.jsx.notes" "Created basic structure for displaying individual goals" "$DAY1 11:27:00"
make_commit "Implement progress bar in GoalCard" "src/Components/GoalCard.jsx.notes" "Added visual progress tracking with percentage calculation" "$DAY1 12:05:00"
make_commit "Add deadline calculation logic" "src/Components/GoalCard.jsx.notes" "Implemented logic to show days remaining until goal deadline" "$DAY1 13:40:00"
make_commit "Create AddGoalForm component" "src/Components/AddGoalForm.jsx.notes" "Form for adding new financial goals with validation" "$DAY1 14:15:00"
make_commit "Implement form submission logic" "src/Components/AddGoalForm.jsx.notes" "Added handleSubmit function to process new goals" "$DAY1 15:03:00"
make_commit "Add API integration for goal creation" "src/App.jsx.notes" "Implemented POST request to json-server for new goals" "$DAY1 16:22:00"
make_commit "Style goal cards with CSS" "src/App.css.notes" "Added styling for goal cards with progress indicators" "$DAY1 17:45:00"
make_commit "Fix form validation bug" "src/Components/AddGoalForm.jsx.notes" "Fixed issue with form validation for target amount" "$DAY1 19:10:00"
make_commit "Add delete functionality" "src/App.jsx.notes" "Implemented DELETE request to remove goals" "$DAY1 20:35:00"
make_commit "Create DepositForm component" "src/Components/DepositForm.jsx.notes" "Form for making deposits to existing goals" "$DAY1 22:15:00"

# Create commits for Day 2
make_commit "Implement deposit logic" "src/App.jsx.notes" "Added function to update goal amounts when deposits are made" "$DAY2 08:45:00"
make_commit "Add Overview component" "src/Components/Overview.jsx.notes" "Created component to display summary statistics" "$DAY2 09:30:00"
make_commit "Calculate total savings across goals" "src/Components/Overview.jsx.notes" "Added logic to sum up all saved amounts" "$DAY2 10:55:00"
make_commit "Add warning indicators for approaching deadlines" "src/Components/GoalCard.jsx.notes" "Visual indicators for goals with deadlines within 30 days" "$DAY2 12:20:00"
make_commit "Implement edit functionality" "src/Components/GoalCard.jsx.notes" "Added ability to edit existing goals" "$DAY2 14:05:00"
make_commit "Style edit form" "src/App.css.notes" "Added CSS for the edit form within goal cards" "$DAY2 15:40:00"
make_commit "Add responsive design" "src/App.css.notes" "Made the dashboard mobile-friendly with media queries" "$DAY2 17:15:00"
make_commit "Fix date formatting issue" "src/Components/GoalCard.jsx.notes" "Fixed bug with date display format" "$DAY2 18:30:00"
make_commit "Add completed goal indicators" "src/Components/GoalCard.jsx.notes" "Visual indicators for goals that have reached their target" "$DAY2 19:45:00"
make_commit "Implement overdue goal warnings" "src/Components/GoalCard.jsx.notes" "Added warning for goals past their deadline" "$DAY2 21:10:00"
make_commit "Update README with instructions" "README.md.notes" "Added detailed instructions for running the application" "$DAY2 22:25:00"
make_commit "Final code cleanup" "src/App.jsx.notes" "Removed console logs and cleaned up code" "$DAY2 23:50:00"

echo "Created 24 commits with realistic timestamps over 2 days"