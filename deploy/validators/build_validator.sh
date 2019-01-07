#!/bin/bash

# Assume not a valid build
VALID_BUILD_CONFIGURATION=1

# Define the build info
SLUG="interviewstreet/springboot-rest-api-archetype"
JDK="oraclejdk8"
BRANCH="master"

if [[ "${TRAVIS_REPO_SLUG}" != "${SLUG}" ]]
then
  echo -n "[ Build Validator     ] Wrong repository: "
  echo "expected '${SLUG}' but was '${TRAVIS_REPO_SLUG}'"
elif [[ "${TRAVIS_JDK_VERSION}" != "${JDK}" ]]
then
  echo -n "[ Build Validator     ] Wrong Java version: "
  echo "expected '${JDK}' but was '${TRAVIS_JDK_VERSION}'"
elif [[ "$TRAVIS_PULL_REQUEST" != "false" ]]
then
  echo "[ Build Validator     ] Not a build"
elif [[ "${TRAVIS_BRANCH}" != "${BRANCH}" ]]
then
  echo -n "Wrong branch: "
  echo "[ Build Validator     ] expected '${BRANCH}' but was '${TRAVIS_BRANCH}'"
else
  VALID_BUILD_CONFIGURATION=0
fi

exit ${VALID_BUILD_CONFIGURATION}
