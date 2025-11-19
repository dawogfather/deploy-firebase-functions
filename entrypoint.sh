#!/bin/sh

if [ -z "${FIREBASE_TOKEN}" ]; then
    echo "FIREBASE_TOKEN is missing"
    exit 1
fi

if [ -z "${TARGET}" ]; then
    echo "TARGET is missing"
    TARGET = "default"
fi

if [ -z "${WORKING_DIRECTORY}" ]; then
    echo "WORKING_DIRECTORY is missing"
else
    cd ${WORKING_DIRECTORY}
fi

if [ -z "${DEPLOY_ONLY}" ]; then
    echo "DEPLOY_ONLY is missing"
    DEPLOY_ONLY = "functions"
fi
firebase --version 

firebase use ${TARGET}

firebase deploy --token ${FIREBASE_TOKEN} --only ${DEPLOY_ONLY}
