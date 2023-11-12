# Use the official Node.js 14 image.
# https://hub.docker.com/_/node
FROM node:20.9.0

# Create app directory
WORKDIR /usr/src/app

# Install PM2 globally
RUN npm install --global pm2

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./
RUN npm install

# Bundle app source
COPY . .

# Bind to all network interfaces so that it can be mapped to the host OS
ENV HOST 0.0.0.0
EXPOSE 3000

# At runtime, this will launch your app using PM2
CMD ["pm2-runtime", "start", "npm", "--", "start"]
