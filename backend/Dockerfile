# Use the official Node.js 20 Alpine image as the base
FROM node:20-alpine

# Install system dependencies required by some Node.js packages (e.g., those with native C++ bindings)
# This step is placed early to leverage Docker layer caching, as these rarely change.
RUN apk update && apk add --no-cache python3 make g++

# Set the working directory inside the container
# This is where your Medusa backend application files will reside.
# /app/backend is consistent with your docker-compose.yml context.
WORKDIR /app/backend

# Copy package.json and package-lock.json first
# This is a crucial optimization for Docker layer caching. If only your source code changes,
# Docker won't need to re-run 'npm install'.
COPY package.json .
# Ensure to copy your package-lock.json for reproducible builds
COPY package-lock.json .

# Install Node.js dependencies based on package.json and package-lock.json
# --loglevel=error keeps the output cleaner during installation.
RUN npm install --loglevel=error

# Copy the rest of your application code into the container
# This layer is built only when your application source code changes.
COPY . .

# Make the develop.sh script executable
RUN chmod +x ./develop.sh

# Define the command that will be executed when the container starts
# This runs your Medusa backend in development mode.
ENTRYPOINT ["./develop.sh", "develop"]

#FROM node:20-alpine
#WORKDIR /app/medusa
#COPY package.json .
#RUN apk update && apk add --no-cache python3 make g++
#RUN npm install -g npm@latest
#RUN npm install --loglevel=error
#COPY . .
#RUN chmod +x ./develop.sh
#ENTRYPOINT ["./develop.sh", "develop"]