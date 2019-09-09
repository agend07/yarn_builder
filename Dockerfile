FROM node:8.16


RUN apt-get update
RUN apt-get install -y apt-transport-https

RUN npm install --global gulp-cli

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt update
RUN apt install -y yarn
