#!/bin/bash

# Assume not a valid version declaration
VALID_VERSION_DECLARATION=1

# Get the declared version
DECLARED_VERSION=$(deploy/versions/declared_version.sh)

if [[ "${DECLARED_VERSION}" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]
then
  # Get the release version
  RELEASE_VERSION=$(deploy/versions/"$1".sh)

  # Check if this is the first release
  if [[ -z "${RELEASE_VERSION}" ]]
  then
    echo -n "[ Version Validator   ] The release version is not set, i.e., "
    echo "this is the first release"

    VALID_VERSION_DECLARATION=0
  else
    # Print the versions
    echo "[ Version Validator   ] Declared version: ${DECLARED_VERSION}"
    echo "[ Version Validator   ] Release version: ${RELEASE_VERSION}"

    deploy/comparators/version_comparator.sh "${RELEASE_VERSION}" "${DECLARED_VERSION}"

    if [[ $? -eq 1 ]]
    then
      echo -n "[ Version Validator   ] Not a valid version declaration in pom.xml. "
      echo "The version must be higher than release version"
    else
      echo "[ Version Validator   ] Valid version declaration"

      VALID_VERSION_DECLARATION=0
    fi
  fi
else
  echo -n "[ Version Validator   ] Not a valid version declaration in pom.xml. "
  echo "The version must be in the form '[0-9]+.[0-9]+.[0-9]+'"
fi

exit ${VALID_VERSION_DECLARATION}
