FROM node:22-alpine
COPY entrypoint.sh /usr/local/bin
ENTRYPOINT ["entrypoint.sh"]
