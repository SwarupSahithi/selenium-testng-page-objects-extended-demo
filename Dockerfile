FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Use reliable HTTPS mirrors without touching broken archive.ubuntu.com
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        ca-certificates \
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
RUN wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | gpg --dearmor > /usr/share/keyrings/google.gpg && \
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/google.gpg] https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list && \
    apt-get update && \
    apt-get install -y google-chrome-stable
