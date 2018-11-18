FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    git \
    python-minimal \
    build-essential \
    --no-install-recommends

RUN curl -sSL https://dl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN echo "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main"
RUN echo "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list

# https://www.ubuntuupdates.org/ppa/google_chrome?dist=stable
RUN apt-get update && apt-get install -y \
    google-chrome-stable=70.0.3538.77-1 \
    --no-install-recommends

# https://deb.nodesource.com/node_11.x/pool/main/n/nodejs/
RUN curl https://deb.nodesource.com/node_11.x/pool/main/n/nodejs/nodejs_11.2.0-1nodesource1_amd64.deb > node.deb \
 && dpkg -i node.deb \
 && rm node.deb
