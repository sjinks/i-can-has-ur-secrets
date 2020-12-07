#!/bin/bash

names="AWS_SECRET_ACCESS_KEY \
    AWS_SESSION_TOKEN \
    AWS_SHARED_CREDENTIALS_FILE \
    AWS_WEB_IDENTITY_TOKEN_FILE \
    CONSUMER_SECRET \
    FIREBASE_TOKEN \
    GITHUB_TOKEN \
    NPM_TOKEN \
    NETLIFY_ACCESS_TOKEN \
    NODE_AUTH_TOKEN \
    SONAR_TOKEN"

for name in $names; do
    if [ -n "${!name}" ] && [[ ! ("${!name}" =~ ^[Xx-]+$) ]]; then
        echo "FATAL: \"$name\" environment variable is set"
        exit 1
    fi
done

shopt -s nocasematch
if [ "$ICHS_LEVEL" \> 0 ]; then
    for name in $(compgen -v); do
        if [[ "$name" =~ "password" || "$name" =~ "token" || "$name" =~ "secret" ]] && [ -n "${!name}" ] && [[ ! ("${!name}" =~ ^[Xx-]+$) ]]; then
            echo "FATAL: \"$name\" environment variable is set"
            exit 1
        fi
    done
fi
