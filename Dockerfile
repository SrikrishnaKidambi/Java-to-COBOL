# Dockerfile

# 1. Start with an official, trusted OpenJDK 21 image
FROM eclipse-temurin:22-jdk-jammy

# 2. Install Node.js and npm
# This section downloads and installs Node.js version 18
RUN apt-get update && \
    apt-get install -y curl && \
    curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs

# 3. Set the working directory
WORKDIR /app

# 4. Copy package files and install npm dependencies
COPY Api/package*.json ./
RUN npm install

# 5. Copy the rest of your project files
COPY . .

# 6. Expose the application port
EXPOSE 3000

# 7. Define the command to start the server
CMD [ "node", "Api/api.js" ]