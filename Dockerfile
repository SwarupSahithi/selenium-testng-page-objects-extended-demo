FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Step 1: Use HTTP temporarily to fetch certificates
RUN sed -i 's|http://archive.ubuntu.com|http://old-releases.ubuntu.com|g' /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y --no-install-recommends ca-certificates

# Step 2: Switch to HTTPS sources (now that certs are available)
RUN sed -i 's|http://old-releases.ubuntu.com|https://archive.ubuntu.com|g' /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
        curl \
        wget \
        gnupg \
        unzip \
        fonts-liberation \
        libappindicator1 \
        libasound2 \
        libatk-bridge2.0-0 \
        libnss3 \
        libxss1 \
        libxcomposite1 \
        libxcursor1 \
        libxdamage1 \
        libxrandr2 \
        libgtk-3-0 \
        libgbm1 \
        libxshmfence1 \
        xdg-utils && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
