#!/bin/bash

echo "[ Github Release      ] Validates and does the Github release"

# Assume not a valid release
VALID_RELEASE=1

deploy/validators/build_validator.sh

if [[ $? -eq 0 ]]
then
  deploy/validators/version_validator.sh "tag_version"

  if [[ $? -eq 0 ]]
  then
    mvn -B -V clean verify \
    -DskipUnitTests=true \
    -DskipIntegrationTests=true \
    -DperformAttachment=true

    VALID_RELEASE=0
  fi
fi

if [[ ${VALID_RELEASE} -eq 0 ]]
then
  export PROJECT_VERSION=$(deploy/versions/declared_version.sh)
  echo "[ Github Release      ] Setting up version: ${PROJECT_VERSION}"

  export GITHUB_RELEASE="true"
  echo "[ Github Release      ] Setting up Github release: ${GITHUB_RELEASE}"

  git config --local user.name "Travis CI"
  echo "[ Github Release      ] Setting up Github user name: Travis CI"

  git config --local user.email "builds@travis-ci.com"
  echo "[ Github Release      ] Setting up Github user email: builds@travis-ci.com"

  git tag -a -m "v${PROJECT_VERSION}" "${PROJECT_VERSION}"
  echo "[ Github Release      ] Tagging release: ${PROJECT_VERSION}"
else
  export GITHUB_RELEASE="false"

  echo "[ Github Release      ] Setting up Github release: ${GITHUB_RELEASE}"
fi
