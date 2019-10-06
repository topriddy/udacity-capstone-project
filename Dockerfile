FROM openjdk:8-jdk-alpine
WORKDIR /app
COPY ./build/libs/*.jar /app/capstone-project.jar
CMD ["java", "-jar", "capstone-project.jar"]
