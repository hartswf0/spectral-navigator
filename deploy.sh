#!/bin/bash
set -e

# Clone the repository to a temporary directory
TEMP_DIR=$(mktemp -d)
git clone https://github.com/hartswf0/spectral-navigator.git "$TEMP_DIR"

# Switch to the gh-pages branch, or create it if it doesn't exist
cd "$TEMP_DIR"
git checkout gh-pages || git checkout -b gh-pages

# Remove all existing files
git rm -rf .

# Copy the index.html and any other necessary files
cp /Users/gaia/spectral-navigator/index.html .

# Add all files
git add .

# Commit changes
git commit -m "Deploy to GitHub Pages"

# Push to gh-pages branch
git push -f origin gh-pages

# Clean up
rm -rf "$TEMP_DIR"

echo "Deployment complete!"
