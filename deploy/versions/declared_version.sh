#!/bin/bash

# Get the POM version
DECLARED_VERSION=$(grep -oPm1 "(?<=<version>)[^<]+" <<< "$(cat pom.xml)")

# Return the declared version
echo ${DECLARED_VERSION}
