#!/bin/bash

# Define the request info
API_HOST="https://api.github.com/repos"
ORGANIZATION="interviewstreet"
REPO="springboot-rest-api"

# Get the tags info
TAGS=$(
  curl -k -s -H "Authorization: token ${GITHUB_OAUTH_TOKEN}" \
  ${API_HOST}/${ORGANIZATION}/${REPO}/tags
)

# Get the tags version
TAGS_VERSION=$(grep -oP "(?<=\"name\":\s\"v)[^\"]+" <<< "${TAGS}")

# Get the latest tag version
LATEST_TAG_VERSION=$(echo "${TAGS_VERSION}" | sort -V -r | head -n 1)

# Return the latest tag version
echo ${LATEST_TAG_VERSION}
