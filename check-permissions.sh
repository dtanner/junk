#!/bin/bash

set -eu

# REQUIRED VARIABLES
# GITHUB_REPOSITORY - the owner/repository. e.g. octocat/Hello-World

# REQUIRED PARAM - the github token

GITHUB_TOKEN=$1

# Make the API request
RESPONSE=$(curl -s -H "Authorization: token $GITHUB_TOKEN" -H "Accept: application/vnd.github.v3+json" "https://api.github.com/repos/$GITHUB_REPOSITORY")
echo "response for matching repo:"
echo $RESPONSE

RESPONSE=$(curl -s -H "Authorization: token $GITHUB_TOKEN" -H "Accept: application/vnd.github.v3+json" "https://api.github.com/repos/dtanner/chaperone")
echo "response for non-matching repo"
echo $RESPONSE

# Extract permissions from the response
#PERMISSIONS=$(echo $RESPONSE | jq -r '.permissions')
#echo "$PERMISSIONS"
# Extract admin and push permissions from the response
#ADMIN_PERMISSION=$(echo $RESPONSE | jq -r '.permissions.admin')
#PUSH_PERMISSION=$(echo $RESPONSE | jq -r '.permissions.push')

# Check permissions
#if [[ $ADMIN_PERMISSION == "true" ]] || [[ $PUSH_PERMISSION == "true" ]]; then
#  echo "This token has write permissions to the repository."
#else
#  echo "This token does not have write permissions to the repository."
#fi

#echo "api.github.com call:"
#curl -sS -f -I -H "Authorization: token $GITHUB_TOKEN" https://api.github.com

#echo "api.github.com/dtanner/junk call:"
#curl -sS -f -I -H "Authorization: token $GITHUB_TOKEN" https://api.github.com/dtanner/junk
