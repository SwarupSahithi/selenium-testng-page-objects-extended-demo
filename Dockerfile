FROM maven:3.9.6-eclipse-temurin-17

# Install Chrome & dependencies
RUN apt-get update && apt-get install -y apt-transport-https ca-certificates && \
    sed -i 's|http://archive.ubuntu.com|https://archive.ubuntu.com|g' /etc/apt/sources.list && \
    apt-get update && apt-get install -y --fix-missing wget gnupg2 curl unzip \
    fonts-liberation libappindicator1 libasound2 libatk-bridge2.0-0 \
    libnss3 libxss1 libxcomposite1 libxcursor1 libxdamage1 libxrandr2 \
    libgtk-3-0 libgbm1 libxshmfence1 xdg-utils --no-install-recommends


# Add Google Chrome
RUN wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" \
    > /etc/apt/sources.list.d/google-chrome.list && \
    apt-get update && apt-get install -y google-chrome-stable && \
    rm -rf /var/lib/apt/lists/*

# Set workdir and copy code
WORKDIR /app
COPY . /app

# Build the project
RUN mvn clean compile -DskipTests

# Run tests
CMD ["mvn", "test"]
