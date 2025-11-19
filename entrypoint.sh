#!/bin/sh

if [ -z "${FIREBASE_TOOLS_VERSION}" ]; then
    echo "FIREBASE_TOOLS_VERSION is missing using latest"
    FIREBASE_TOOLS_VERSION="latest"
fi

if [ -z "${FIREBASE_TOKEN}" ]; then
    echo "FIREBASE_TOKEN is missing"
    exit 1
fi

if [ -z "${TARGET}" ]; then
    echo "TARGET is missing"
    TARGET = "default"
fi

if [ -z "${WORKING_DIRECTORY}" ]; then
    echo "WORKING_DIRECTORY is missing so skipping"
else
    echo "Changing to working directory: ${WORKING_DIRECTORY}"
    cd ${WORKING_DIRECTORY}
fi

if [ -z "${DEPLOY_ONLY}" ]; then
    echo "DEPLOY_ONLY is missing"
    DEPLOY_ONLY = "functions"
fi

echo "--------------------------------"
echo "Deploying only: ${DEPLOY_ONLY}"
echo "Using target: ${TARGET}"
echo "Using firebase tools version: ${FIREBASE_TOOLS_VERSION}"
echo "--------------------------------"
npm install -g firebase-tools@${FIREBASE_TOOLS_VERSION}
echo "Using Firebase version:"
firebase --version 
echo "Calling firebase use ${TARGET}"
firebase use ${TARGET}
echo "Calling firebase deploy --token hidden --only ${DEPLOY_ONLY}"
firebase deploy --token ${FIREBASE_TOKEN} --only ${DEPLOY_ONLY}
