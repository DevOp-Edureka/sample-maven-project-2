FROM maven:3.9.6-eclipse-temurin-17 as build
WORKDIR /app
COPY . .
RUN mnv clean install

FROM eclipse-temurin:17.0.2_8-jdk
WORKDIR /app
COPY --from=build /app/target/my-app.jar /apps/
EXPOSE 8081
CMD ["java", "-jar", "my-app.jar"]