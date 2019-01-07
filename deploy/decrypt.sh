#!/bin/bash

openssl aes-256-cbc -d -a -pass pass:${ENCRYPTION_PASSPHRASE} \
-in deploy/artifact_signing.asc.enc \
-out deploy/artifact_signing.asc

gpg --fast-import deploy/artifact_signing.asc
