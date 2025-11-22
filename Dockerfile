FROM node:22-alpine
RUN npm install -g firebase-tools@latest
COPY entrypoint.sh /usr/local/bin
ENTRYPOINT ["entrypoint.sh"]
