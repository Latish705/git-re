# Use the official image as a parent image 
FROM node:18-alpine

# Set the working directory
WORKDIR /app

# Copy the package.json and package-lock.json files
COPY package*.json ./

# Install dependencies for both production and development
RUN npm install --only=development

# Copy all other source code to the working directory
COPY . .

# Inform Docker that the container is listening on the specified port at runtime
EXPOSE 3000

# Default command for running the application in production mode
CMD ["npm", "start"]

# Command for running the application in development mode
CMD ["npm", "run", "dev"]
