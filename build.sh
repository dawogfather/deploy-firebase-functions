#!/bin/bash

docker build -t dawogfather/deploy-firebase-functions --build-arg firebaseToolsVersion=14.25.0 .
