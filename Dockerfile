# Use Maven with OpenJDK 17
FROM maven:3.9.6-eclipse-temurin-17 as builder

# Set work directory
WORKDIR /app

# Copy your Maven project
COPY pom.xml .
COPY src ./src

# Install Chrome
RUN apt-get update && \
    apt-get install -y wget gnupg unzip && \
    wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | gpg --dearmor > /usr/share/keyrings/google.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/google.gpg] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list && \
    apt-get update && \
    apt-get install -y google-chrome-stable && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Build the project
RUN mvn clean install -DskipTests

# Final image
FROM maven:3.9.6-eclipse-temurin-17

COPY --from=builder /app /app
WORKDIR /app

CMD ["mvn", "test"]
