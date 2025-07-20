#!/bin/bash

# Navigate to project directory
cd /home/irene/Development/phase-2/code-challenge

# Check if git is initialized
if [ ! -d .git ]; then
  echo "Git repository not initialized. Initializing now..."
  git init
  git add .
  git commit -m "Initial commit"
fi

# Prompt for GitHub username
read -p "Enter your GitHub username: " username

# Prompt for repository name
read -p "Enter repository name (default: goal-management-dashboard): " repo_name
repo_name=${repo_name:-goal-management-dashboard}

# Create GitHub repository using GitHub CLI if available
if command -v gh &> /dev/null; then
  echo "Creating GitHub repository using GitHub CLI..."
  gh repo create "$repo_name" --public --source=. --remote=origin
else
  # Set up remote manually
  echo "GitHub CLI not found. Setting up remote manually..."
  echo "Please create a repository named '$repo_name' on GitHub"
  echo "Then press Enter to continue..."
  read
  
  # Add remote
  git remote add origin "https://github.com/$username/$repo_name.git"
fi

# Push to GitHub
echo "Pushing commits to GitHub..."
git push -u origin main || git push -u origin master

echo "Commits pushed to GitHub successfully!"
echo "Repository URL: https://github.com/$username/$repo_name"