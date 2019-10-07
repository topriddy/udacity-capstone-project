FROM adoptopenjdk/openjdk11:alpine-jre
WORKDIR /app
COPY ./build/libs/*.jar /app/capstone-project.jar
CMD["java", "-jar", "capstone-project.jar"]
