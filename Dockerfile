```dockerfile
# ============================================================
# Stage 1: Build the application
# ============================================================
FROM maven:3.9-eclipse-temurin-21 AS builder

WORKDIR /app

# Copy Maven configuration first for better Docker layer caching
COPY pom.xml .

# Download dependencies
RUN mvn dependency:go-offline -B

# Copy application source
COPY src ./src

# Build WAR
RUN mvn clean package -DskipTests -B


# ============================================================
# Stage 2: Runtime
# ============================================================
FROM jetty:9.4-jre21

# Remove default Jetty web applications if present
RUN rm -rf /var/lib/jetty/webapps/*

# Copy generated WAR
COPY --from=builder /app/target/mahaLogin.war /var/lib/jetty/webapps/ROOT.war

# Jetty HTTP port
EXPOSE 8080

# Start Jetty
CMD ["java", "-jar", "/usr/local/jetty/start.jar"]
```
