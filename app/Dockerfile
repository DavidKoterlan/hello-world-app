# Define base image
FROM node:20.13.0-alpine3.19

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
COPY package.json .
RUN npm install

# Define ENV variables
ENV PORT=8080
ENV HOST="loclahost"

# Bundle app source
COPY . .
EXPOSE 8080
ENTRYPOINT [ "npm", "start" ]