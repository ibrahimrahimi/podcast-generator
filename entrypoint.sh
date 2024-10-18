#!/bin/bash

echo "---------------------------------------------"

# Set the default values from inputs or environment variables
GITHUB_NAME="${INPUT_NAME:-$GITHUB_ACTOR}"
GITHUB_EMAIL="${INPUT_EMAIL:-$GITHUB_ACTOR@users.noreply.github.com}"

git config --global user.name "$GITHUB_NAME"
git config --global user.email "$GITHUB_EMAIL"
git config --global --add safe.directory /github/workspace

python3 /usr/bin/feed.py

git add -A && git commit -m "Update Feed"

git push --set-upstream origin main

echo "---------------------------------------------"