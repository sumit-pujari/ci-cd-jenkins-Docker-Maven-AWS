FROM eclipse-temurin:21-jre

WORKDIR /app

COPY target/ci-cd-demo-0.0.1-SNAPSHOT.jar app.jar

EXPOSE 8080

HEALTHCHECK --interval=5s --timeout=3s --start-period=10s --retries=10 \
  CMD curl -f http://localhost:8080/ || exit 1

ENTRYPOINT ["java", "-jar", "app.jar"]
