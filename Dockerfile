# Use official OpenJDK 17 base image
FROM openjdk:17-slim

# Install dependencies, Chrome, and Maven
RUN apt-get update && apt-get install -y \
    wget \
    curl \
    gnupg2 \
    unzip \
    ca-certificates \
    git \
    xvfb \
    libxi6 \
    libgconf-2-4 \
    libxss1 \
    libappindicator1 \
    fonts-liberation \
    libasound2 \
    libatk-bridge2.0-0 \
    libnspr4 \
    libnss3 \
    libxcomposite1 \
    libxcursor1 \
    libxdamage1 \
    libxrandr2 \
    xdg-utils \
    --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

# Install Google Chrome
RUN wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list && \
    apt-get update && apt-get install -y google-chrome-stable

# Install Maven
ARG MAVEN_VERSION=3.9.6
ARG MAVEN_HOME=/usr/share/maven
RUN wget https://downloads.apache.org/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz && \
    tar -xzf apache-maven-${MAVEN_VERSION}-bin.tar.gz -C /usr/share && \
    ln -s /usr/share/apache-maven-${MAVEN_VERSION} $MAVEN_HOME && \
    ln -s $MAVEN_HOME/bin/mvn /usr/bin/mvn && \
    rm apache-maven-${MAVEN_VERSION}-bin.tar.gz

# Set environment variables
ENV JAVA_HOME=/usr/local/openjdk-17
ENV MAVEN_HOME=/usr/share/maven
ENV PATH=$PATH:$MAVEN_HOME/bin

# Set working directory
WORKDIR /app

# Copy your Maven project
COPY . /app

# Build and test
RUN mvn clean test

# Default command (optional)
CMD ["mvn", "test"]
