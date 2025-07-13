# Dev-образ со всем необходимым
FROM eclipse-temurin:17-jdk-alpine

# Устанавливаем Maven и базовые инструменты
RUN apk add --no-cache \
    maven~=3.8 \
    git \
    curl \
    bash

# Настраиваем рабочую директорию
WORKDIR /workspace

# Копируем Maven-кэш (если есть)
COPY .mvn/ .mvn
COPY mvnw pom.xml ./

# Устанавливаем Spring Boot CLI (опционально)
RUN mvn dependency:get \
    -Dartifact=org.springframework.boot:spring-boot-cli:3.1.5

# Создаем пользователя для безопасности
RUN addgroup -S spring && adduser -S -G spring spring \
    && chown -R spring:spring /workspace

USER spring

# Точка входа для разработки
ENTRYPOINT ["mvn"]
CMD ["spring-boot:run"]