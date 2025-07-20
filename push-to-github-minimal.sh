#!/bin/bash

# Navigate to project directory
cd /home/irene/Development/phase-2/code-challenge

# Check if git is initialized
if [ ! -d .git ]; then
  git init
  git add .
  git commit -m "Initial commit"
fi

# Create GitHub repository and push
repo_name="goal-management-dashboard"

# Option 1: Using GitHub CLI (if installed)
if command -v gh &> /dev/null; then
  gh repo create "$repo_name" --public --source=. --push
  exit 0
fi

# Option 2: Manual setup
echo "Please create a repository named '$repo_name' on GitHub"
echo "Then run these commands:"
echo ""
echo "git remote add origin https://github.com/YOUR_USERNAME/$repo_name.git"
echo "git push -u origin main"
echo ""
echo "Or if your default branch is 'master':"
echo "git push -u origin master"