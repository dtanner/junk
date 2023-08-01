#!/bin/bash

set -eu

# REQUIRED VARIABLES
# GITHUB_REPOSITORY - the owner/repository. e.g. octocat/Hello-World

# REQUIRED PARAM - the github token

GITHUB_TOKEN=$1

# Make the API request
RESPONSE=$(curl -s -H "Authorization: token $GITHUB_TOKEN" -H "Accept: application/vnd.github.v3+json" "https://api.github.com/repos/$GITHUB_REPOSITORY")

# Extract permissions from the response
PERMISSIONS=$(echo $RESPONSE | jq -r '.permissions')
echo "$PERMISSIONS"

# Check permissions
if [[ $PERMISSIONS == *"admin"* || $PERMISSIONS == *"push"* ]]; then
  echo "This token has write permissions to the repository."
else
  echo "This token does not have write permissions to the repository."
fi