# Dockerfile

# 1. Start with an official OpenJDK 22 image
FROM eclipse-temurin:22-jdk-jammy

# 2. Install Node.js and npm
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

# 6. COMPILE THE JAVA CODE
RUN javac -cp "Antlr/antlr-4.13.2-complete.jar:Antlr/javaparser-core-3.25.8.jar" Antlr/*.java

# 7. Expose the application port
EXPOSE 3000

# 8. Define the command to start the server
CMD [ "node", "Api/api.js" ]