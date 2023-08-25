# Use Maven image for building
FROM maven:3.8.4-jdk-8 AS builder

# Copy project files to the working directory of the image
WORKDIR /app
COPY pom.xml .
COPY src/ ./src/

# Build the project
RUN mvn package

# Use Tomcat image as the base image, but with explicit JDK 8
FROM tomcat:9.0-jdk8

# Clean the Tomcat webapps directory from old .war files
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the compiled WAR file from the build image to the Tomcat webapps directory
COPY --from=builder /app/target/web-app-docker.war /usr/local/tomcat/webapps/

# Open the port that will be used when the container is launched
EXPOSE 8080

# Command to execute when the container starts
CMD ["catalina.sh", "run"]

