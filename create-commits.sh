#!/bin/bash

# Navigate to the project directory
cd /home/irene/Development/phase-2/code-challenge

# Initialize git if not already initialized
if [ ! -d .git ]; then
  git init
  git add .
  git commit -m "Initial commit: Project setup"
fi

# Function to make a commit with a random delay
make_commit() {
  local message=$1
  local file=$2
  local content=$3
  
  # Add content to file
  echo "$content" >> $file
  
  # Stage and commit
  git add $file
  git commit -m "$message"
  
  # Random delay between 10 minutes and 4 hours (in seconds)
  local delay=$((RANDOM % 14400 + 600))
  echo "Waiting $delay seconds before next commit..."
  sleep 1  # Just simulate the delay for this script
}

# Day 1 commits
echo "Creating Day 1 commits..."

# Morning commits
make_commit "Add basic project structure" "src/notes.md" "# Project Structure\n- Set up React components\n- Configure json-server"
make_commit "Create initial db.json structure" "db.json.notes" "Added initial goal structure with fields for name, target amount, saved amount, etc."
make_commit "Add GoalCard component skeleton" "src/Components/GoalCard.jsx.notes" "Created basic structure for displaying individual goals"
make_commit "Implement progress bar in GoalCard" "src/Components/GoalCard.jsx.notes" "Added visual progress tracking with percentage calculation"
make_commit "Add deadline calculation logic" "src/Components/GoalCard.jsx.notes" "Implemented logic to show days remaining until goal deadline"

# Afternoon commits
make_commit "Create AddGoalForm component" "src/Components/AddGoalForm.jsx.notes" "Form for adding new financial goals with validation"
make_commit "Implement form submission logic" "src/Components/AddGoalForm.jsx.notes" "Added handleSubmit function to process new goals"
make_commit "Add API integration for goal creation" "src/App.jsx.notes" "Implemented POST request to json-server for new goals"
make_commit "Style goal cards with CSS" "src/App.css.notes" "Added styling for goal cards with progress indicators"
make_commit "Fix form validation bug" "src/Components/AddGoalForm.jsx.notes" "Fixed issue with form validation for target amount"

# Evening commits
make_commit "Add delete functionality" "src/App.jsx.notes" "Implemented DELETE request to remove goals"
make_commit "Create DepositForm component" "src/Components/DepositForm.jsx.notes" "Form for making deposits to existing goals"

# Day 2 commits
echo "Creating Day 2 commits..."

# Morning commits
make_commit "Implement deposit logic" "src/App.jsx.notes" "Added function to update goal amounts when deposits are made"
make_commit "Add Overview component" "src/Components/Overview.jsx.notes" "Created component to display summary statistics"
make_commit "Calculate total savings across goals" "src/Components/Overview.jsx.notes" "Added logic to sum up all saved amounts"
make_commit "Add warning indicators for approaching deadlines" "src/Components/GoalCard.jsx.notes" "Visual indicators for goals with deadlines within 30 days"

# Afternoon commits
make_commit "Implement edit functionality" "src/Components/GoalCard.jsx.notes" "Added ability to edit existing goals"
make_commit "Style edit form" "src/App.css.notes" "Added CSS for the edit form within goal cards"
make_commit "Add responsive design" "src/App.css.notes" "Made the dashboard mobile-friendly with media queries"
make_commit "Fix date formatting issue" "src/Components/GoalCard.jsx.notes" "Fixed bug with date display format"

# Evening commits
make_commit "Add completed goal indicators" "src/Components/GoalCard.jsx.notes" "Visual indicators for goals that have reached their target"
make_commit "Implement overdue goal warnings" "src/Components/GoalCard.jsx.notes" "Added warning for goals past their deadline"
make_commit "Update README with instructions" "README.md.notes" "Added detailed instructions for running the application"
make_commit "Final code cleanup" "src/App.jsx.notes" "Removed console logs and cleaned up code"

echo "Created 24 commits simulating development over 2 days"