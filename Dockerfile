FROM maven:3.8.6-openjdk-11 as builder

# Set working directory
WORKDIR /app

# Copy Maven project files
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

# Build your Maven project (skip tests if needed)
RUN mvn clean install -DskipTests

# Use same image for final run (or switch to smaller one)
FROM maven:3.8.6-openjdk-11

# Copy build artifact from previous stage
COPY --from=builder /app /app

WORKDIR /app

CMD ["mvn", "test"]
