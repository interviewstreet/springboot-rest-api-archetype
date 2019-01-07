#!/bin/bash

# Define maven metadata info
MAVEN_HOST="https://repo1.maven.org/maven2"
GROUP_ID="com/hackerrank/archetypes"
ARTIFACT_ID="springboot-rest-api"
MAVEN_METADATA="maven-metadata.xml"

# Get the metadata
METADATA=$(curl -k -s "${MAVEN_HOST}/${GROUP_ID}/${ARTIFACT_ID}/${MAVEN_METADATA}")

# Get the release version
RELEASE_VERSION=$(grep -oPm1 "(?<=<release>)[^<]+" <<< "${METADATA}")

# Return the release version
echo ${RELEASE_VERSION}
