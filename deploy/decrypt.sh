#!/bin/bash

PASSWORD_PART_1=$ENCRYPTION_PASSWORD_1
PASSWORD_PART_2=$ENCRYPTION_PASSWORD_2
PASSWORD_PART_3=$ENCRYPTION_PASSWORD_3
PASSWORD_PART_4=$ENCRYPTION_PASSWORD_4

ENCRYPTION_PASSWORD="${ENCRYPTION_PASSWORD_1}\
${ENCRYPTION_PASSWORD_2}\
${ENCRYPTION_PASSWORD_3}\
${ENCRYPTION_PASSWORD_4}"

openssl aes-256-cbc \
-pass pass:$ENCRYPTION_PASSWORD \
-in ./deploy/keys/sonatype_public.gpg.enc \
-out ./deploy/keys/sonatype_public.gpg -d

openssl aes-256-cbc \
-pass pass:$ENCRYPTION_PASSWORD \
-in ./deploy/keys/sonatype_secret.gpg.enc \
-out ./deploy/keys/sonatype_secret.gpg -d
