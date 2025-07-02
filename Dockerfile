FROM ubuntu:22.04

# Prevents some tzdata prompts
ENV DEBIAN_FRONTEND=noninteractive

# Switch to HTTPS sources before installing anything
RUN sed -i 's|http://|https://|g' /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        wget \
        gnupg2 \
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
