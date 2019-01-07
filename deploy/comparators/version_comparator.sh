#!/bin/bash

RELEASE_VERSION="$1"
DECLARED_VERSION="$2"

if [[ "${DECLARED_VERSION}" = "${RELEASE_VERSION}" ]]
then
  echo "[ Version Comparator  ] Both the versions are same"

  exit 1
fi

# Get the smaller version
SMALLER_VERSION="$(
  echo -e "${RELEASE_VERSION}\n${DECLARED_VERSION}" | sort -V | head -n 1
)"

if [[ "${RELEASE_VERSION}" != "${SMALLER_VERSION}" ]]
then
  echo "[ Version Comparator  ] Release version is higher"

  exit 1
fi

exit 0
