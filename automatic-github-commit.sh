#!/bin/bash

# Exit script on any error
set -e

# Default commit message if none is provided
DEFAULT_COMMIT_MESSAGE="Automated commit on $(date '+%Y-%m-%d %H:%M:%S')"

# Step 1: Pull the latest changes from the remote repository
echo "Pulling the latest changes from the remote repository..."
git pull origin main
echo "Latest pull completed."

# Step 2: Make changes to a file (in this case, appending the commit message to 'changes.txt')
TARGET_FILE="changes.txt"

echo "Modifying files..."
echo "${DEFAULT_COMMIT_MESSAGE}" >> "$TARGET_FILE"
echo "Changes added to $TARGET_FILE."

# Step 3: Add all changes to the staging area
echo "Adding files to Git..."
git add "$TARGET_FILE"
echo "Files added to Git."

# Step 4: Commit the changes with the default commit message
echo "Committing changes..."
git commit -m "${DEFAULT_COMMIT_MESSAGE}"
echo "Commit completed."

# Step 5: Push the committed changes to the remote repository
echo "Pushing changes to remote repository..."
git push origin main
echo "Push successful."





# # Use the first argument as the commit message or fall back to the default
# COMMIT_MESSAGE="${1:-$DEFAULT_COMMIT_MESSAGE}"

# vim ./changes.txt

# # Check if there are any changes to commit
# if git diff --quiet && git diff --cached --quiet; then
#     echo "No changes to commit."
#     exit 0
# fi

# # Pull the latest changes from the remote repository
# echo "Pulling latest changes from the remote repository..."
# git pull origin main

# # Add all changes
# echo "Adding all changes..."
# git add .

# # Commit changes with the provided or default message
# echo "Committing changes with message: '$COMMIT_MESSAGE'"
# git commit -m "$COMMIT_MESSAGE"

# # Push changes to the remote repository
# echo "Pushing changes to GitHub..."
# git push origin main

# echo "Changes successfully pushed to GitHub!"
