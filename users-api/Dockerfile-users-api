# Build stage with memory optimizations
FROM maven:3.8.6-jdk-8 AS build

WORKDIR /app

# 1. Copy POM first for dependency caching
COPY pom.xml .
# Download dependencies first (separate layer)
RUN mvn dependency:go-offline -B

# 2. Copy source code
COPY src ./src

# 3. Build with memory limits
ENV MAVEN_OPTS="-Xmx512m -Xms256m -XX:+TieredCompilation -XX:TieredStopAtLevel=1"
RUN mvn clean install -DskipTests -Dorg.slf4j.simpleLogger.log.org.apache.maven.cli.transfer.Slf4jMavenTransferListener=warn

# Runtime stage
FROM openjdk:8-jre-alpine

# 4. Add required libs for Alpine
RUN apk add --no-cache libc6-compat

WORKDIR /app
COPY --from=build /app/target/users-api-*.jar app.jar

# 5. Add JVM memory options
EXPOSE 8083
CMD ["java", "-Xmx256m", "-Xss512k", "-XX:+UseSerialGC", "-jar", "app.jar"]