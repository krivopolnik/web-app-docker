# Use the Maven image for building
FROM maven:3.8.4-jdk-8 AS builder

# Copy project files to the working directory in the image
WORKDIR /app
COPY pom.xml .
COPY src/ ./src/

# Build the project
RUN mvn package

# Use the Tomcat image as the base image, with explicit JDK 8 specification
FROM tomcat:9.0-jdk8

# Clean the Tomcat webapps directory from old .war files
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the compiled WAR file from the build image to the Tomcat webapps directory
COPY --from=builder /app/target/web-app-docker.war /usr/local/tomcat/webapps/

# Open the port to be used when running the container
EXPOSE 8080

# Command to be executed when running the container
CMD ["catalina.sh", "run"]
