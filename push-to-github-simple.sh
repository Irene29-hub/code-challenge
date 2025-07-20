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

# Set GitHub username and repository name
username="YOUR_GITHUB_USERNAME"  # Replace with your GitHub username
repo_name="goal-management-dashboard"

# Create a personal access token
# Visit https://github.com/settings/tokens to create one with 'repo' scope
# Then replace YOUR_PERSONAL_ACCESS_TOKEN with your token
token="YOUR_PERSONAL_ACCESS_TOKEN"

# Create repository on GitHub via API
echo "Creating GitHub repository..."
curl -s -X POST \
  -H "Authorization: token $token" \
  -H "Accept: application/vnd.github.v3+json" \
  https://api.github.com/user/repos \
  -d "{\"name\":\"$repo_name\",\"private\":false}" > /dev/null

# Add remote
git remote add origin "https://github.com/$username/$repo_name.git"

# Set up credentials for this push only
git remote set-url origin "https://$username:$token@github.com/$username/$repo_name.git"

# Push to GitHub
echo "Pushing commits to GitHub..."
git push -u origin main || git push -u origin master

# Reset remote URL to remove token
git remote set-url origin "https://github.com/$username/$repo_name.git"

echo "Commits pushed to GitHub successfully!"
echo "Repository URL: https://github.com/$username/$repo_name"