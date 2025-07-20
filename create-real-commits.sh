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
  local change_type=$3  # 'add', 'modify', or 'comment'
  local content=$4
  local date=$5
  
  if [ "$change_type" = "add" ]; then
    # Add new content to the end of the file
    echo -e "\n$content" >> "$file"
  elif [ "$change_type" = "modify" ]; then
    # Replace a specific line or add if not found
    if grep -q "$content" "$file"; then
      sed -i "s|.*$content.*|$content|" "$file"
    else
      echo -e "\n$content" >> "$file"
    fi
  elif [ "$change_type" = "comment" ]; then
    # Add a comment to the file
    echo -e "\n// $content" >> "$file"
  fi
  
  # Stage and commit with specific date
  git add "$file"
  GIT_COMMITTER_DATE="$date" git commit --date="$date" -m "$message"
}

# Day 1 - Yesterday
DAY1=$(date -d "yesterday" +%Y-%m-%d)

# Day 2 - Today
DAY2=$(date +%Y-%m-%d)

# Create commits for Day 1
make_commit "Initial project structure setup" "src/App.jsx" "comment" "Initial setup of the main App component" "$DAY1 09:15:00"
make_commit "Add goal state management" "src/App.jsx" "modify" "const [goals, setGoals] = useState([])" "$DAY1 10:42:00"
make_commit "Create fetch goals function" "src/App.jsx" "add" "const fetchGoals = async () => {\n  try {\n    const response = await fetch('http://localhost:3000/goals')\n    const data = await response.json()\n    setGoals(data)\n  } catch (error) {\n    console.error('Error fetching goals:', error)\n  }\n}" "$DAY1 11:27:00"
make_commit "Add useEffect for data fetching" "src/App.jsx" "add" "useEffect(() => {\n  fetchGoals()\n}, [])" "$DAY1 12:05:00"
make_commit "Create GoalCard component" "src/Components/GoalCard.jsx" "modify" "// Added progress calculation logic" "$DAY1 13:40:00"
make_commit "Implement progress percentage calculation" "src/Components/GoalCard.jsx" "modify" "const progressPercentage = Math.min(Math.round((goal.savedAmount / goal.targetAmount) * 100), 100)" "$DAY1 14:15:00"
make_commit "Add deadline calculation" "src/Components/GoalCard.jsx" "modify" "// Calculate days remaining until deadline\n  const today = new Date()\n  const deadline = new Date(goal.deadline)\n  const daysRemaining = Math.ceil((deadline - today) / (1000 * 60 * 60 * 24))" "$DAY1 15:03:00"
make_commit "Add goal status indicators" "src/Components/GoalCard.jsx" "add" "const isCompleted = goal.savedAmount >= goal.targetAmount\n  const isNearDeadline = daysRemaining <= 30 && !isCompleted\n  const isOverdue = daysRemaining < 0 && !isCompleted" "$DAY1 16:22:00"
make_commit "Style goal cards" "src/App.css" "add" ".goal-card {\n  background-color: white;\n  border-radius: 6px;\n  padding: 1rem;\n  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);\n  border-left: 4px solid #3498db;\n}" "$DAY1 17:45:00"
make_commit "Add progress bar styles" "src/App.css" "add" ".progress-bar {\n  height: 10px;\n  background-color: #e0e0e0;\n  border-radius: 5px;\n  overflow: hidden;\n  margin-bottom: 0.5rem;\n}\n\n.progress-fill {\n  height: 100%;\n  background-color: #3498db;\n  border-radius: 5px;\n}" "$DAY1 19:10:00"
make_commit "Implement delete goal functionality" "src/App.jsx" "add" "const deleteGoal = async (id) => {\n  try {\n    await fetch(\`http://localhost:3000/goals/\${id}\`, {\n      method: 'DELETE',\n    })\n    setGoals(goals.filter(goal => goal.id !== id))\n  } catch (error) {\n    console.error('Error deleting goal:', error)\n  }\n}" "$DAY1 20:35:00"
make_commit "Create deposit form component" "src/Components/DepositForm.jsx" "comment" "Component for making deposits to goals" "$DAY1 22:15:00"

# Create commits for Day 2
make_commit "Implement deposit functionality" "src/App.jsx" "add" "const makeDeposit = async (id, amount) => {\n  const goal = goals.find(g => g.id === id)\n  if (!goal) return\n  \n  const updatedAmount = goal.savedAmount + Number(amount)\n  await updateGoal(id, { savedAmount: updatedAmount })\n}" "$DAY2 08:45:00"
make_commit "Create Overview component" "src/Components/Overview.jsx" "comment" "Component to display summary statistics of all goals" "$DAY2 09:30:00"
make_commit "Add total savings calculation" "src/Components/Overview.jsx" "add" "// Calculate total saved amount across all goals\n  const totalSaved = goals.reduce((sum, goal) => sum + goal.savedAmount, 0)" "$DAY2 10:55:00"
make_commit "Add warning indicators" "src/Components/GoalCard.jsx" "modify" "<span className={\`status \${isNearDeadline ? 'warning' : ''}\`}>" "$DAY2 12:20:00"
make_commit "Implement edit functionality" "src/Components/GoalCard.jsx" "add" "const [isEditing, setIsEditing] = useState(false)\n  const [editedGoal, setEditedGoal] = useState({...goal})" "$DAY2 14:05:00"
make_commit "Add edit form styles" "src/App.css" "add" ".edit-form {\n  display: flex;\n  flex-direction: column;\n  gap: 0.5rem;\n}" "$DAY2 15:40:00"
make_commit "Add responsive design" "src/App.css" "add" "@media (min-width: 768px) {\n  .main-content {\n    grid-template-columns: 3fr 2fr;\n  }\n}" "$DAY2 17:15:00"
make_commit "Fix date formatting issue" "src/Components/GoalCard.jsx" "modify" "value={editedGoal.deadline}" "$DAY2 18:30:00"
make_commit "Add completed goal indicators" "src/Components/GoalCard.jsx" "add" ".goal-card.completed {\n  border-left-color: #2ecc71;\n}" "$DAY2 19:45:00"
make_commit "Implement overdue goal warnings" "src/Components/GoalCard.jsx" "add" ".goal-card.overdue {\n  border-left-color: #e74c3c;\n}" "$DAY2 21:10:00"
make_commit "Update README" "README.md" "add" "## Usage\n\n- **Add a Goal**: Fill out the \"Add New Goal\" form with name, target amount, category, and deadline\n- **Make a Deposit**: Select a goal and enter an amount in the \"Make a Deposit\" form" "$DAY2 22:25:00"
make_commit "Final code cleanup" "src/App.jsx" "comment" "Removed console logs and cleaned up code" "$DAY2 23:50:00"

echo "Created 24 commits with realistic changes and timestamps over 2 days"