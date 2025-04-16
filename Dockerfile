FROM maven:3.8.4-openjdk-17 AS build
WORKDIR /Ehealth
COPY Ehealth/pom.xml .
COPY Ehealth/src ./src
RUN mvn clean verify -DskipTests \
  && cp target/checkstyle-result.xml /checkstyle-result.xml


FROM openjdk:17-jdk-slim
WORKDIR /Ehealth
COPY --from=build /Ehealth/target/*.jar app.jar
EXPOSE 8082
CMD ["java", "-jar", "app.jar"]
