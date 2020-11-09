FROM ubuntu:20.04 AS base
EXPOSE 80
# Prerequisites
RUN apt-get update && apt-get install -y bash curl file git unzip xz-utils zip libglu1-mesa && apt-get upgrade -y && rm -rf /var/cache/apt
# Install flutter
RUN git clone https://github.com/flutter/flutter.git /opt/flutter
ENV PATH "$PATH:/opt/flutter/bin"
RUN flutter
# Switch to Beta
RUN flutter channel beta
RUN flutter upgrade
# Enable web capabilities
RUN flutter config --enable-web

