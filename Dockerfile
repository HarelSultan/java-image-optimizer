# Start with a base image containing Maven (and OpenJDK)
FROM maven:3.8-openjdk-11-slim

# Make the app directory inside the Docker image
WORKDIR /app

# Copy the pom.xml (Maven project object model file) into our app directory
COPY pom.xml .

# Copy your source code into the app directory
COPY src ./src

# Build the project inside the Docker image
RUN mvn package

# Command to run when starting the container
ENTRYPOINT ["java", "-cp", "target/deps/pngtastic-1.0.jar", "-jar", "target/image-web-optimizer-0.0.2-SNAPSHOT.jar"]

