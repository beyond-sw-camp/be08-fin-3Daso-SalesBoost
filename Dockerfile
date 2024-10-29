FROM eclipse-temurin:21-jre-alpine
LABEL maintainer="uzz99"
LABEL version="1.0"
ENV TZ=Asia/Seoul
COPY build/libs/samdasoo-0.0.1-SNAPSHOT.jar /app/samdasoo-0.0.1-SNAPSHOT.jar
WORKDIR /app
CMD ["java", "-jar", "/app/samdasoo-0.0.1-SNAPSHOT.jar"]
EXPOSE 8080