FROM eclipse-temurin:17-jdk-alpine

RUN apk add --no-cache \
    maven~=3.8 \
    git \
    curl \
    bash

WORKDIR /workspace

COPY .mvn/ .mvn
COPY mvnw pom.xml ./

RUN mvn dependency:get \
    -Dartifact=org.springframework.boot:spring-boot-cli:3.1.5

RUN addgroup -S spring && adduser -S -G spring spring \
    && chown -R spring:spring /workspace

USER spring

ENTRYPOINT ["mvn"]
CMD ["spring-boot:run"]
