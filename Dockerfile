# Base image with Node.js
FROM node:14-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to install dependencies
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application files
COPY . .

# Build the Next.js app
RUN npm run build

# Set environment variable for the Movie Catalog API
# You can override this at runtime with Docker's -e flag or in a docker-compose file.
ENV MOVIE_CATALOG_SERVICE=http://localhost:8080

# Expose the port that the Next.js app will run on (usually 3000)
EXPOSE 3000

# Start the application
CMD ["npm", "start"]