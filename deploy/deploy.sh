#!/bin/bash

echo "[ Sonatype Deployment ] Validates and does the artifact deployment"

deploy/validators/build_validator.sh

if [[ $? -eq 0 ]]
then
  deploy/validators/version_validator.sh "release_version"

  if [[ $? -eq 0 ]]
  then
    deploy/decrypt.sh

    mvn -B -V clean deploy \
    -DskipUnitTests=true \
    -DskipIntegrationTests=true \
    -DperformSign=true \
    -DperformAttachment=true \
    -DperformRelease=true \
    --settings deploy/settings.xml
  fi
fi
