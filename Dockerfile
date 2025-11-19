FROM node:22-alpine
ARG firebaseToolsVersion
ENV tools_version $firebaseToolsVersion
RUN npm install -g firebase-tools@$tools_version
COPY entrypoint.sh /usr/local/bin
ENTRYPOINT ["entrypoint.sh"]
