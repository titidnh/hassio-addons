ARG BUILD_FROM
FROM ${BUILD_FROM}

# Install necessary dependencies
RUN apk add --no-cache curl tar bash \
    && curl -L -o /tmp/s6-overlay.tar.gz https://github.com/just-containers/s6-overlay/releases/download/v2.1.0.1/s6-overlay-amd64.tar.gz \
    && tar xzf /tmp/s6-overlay.tar.gz -C / \
    && rm -f /tmp/s6-overlay.tar.gz

# Download and install Shiori based on architecture
RUN ARCH=$(uname -m) && \
    if [ "$ARCH" = "x86_64" ]; then ARCH_TAG="x86_64"; \
    elif [ "$ARCH" = "aarch64" ]; then ARCH_TAG="aarch64"; \
    elif [ "$ARCH" = "armv7l" ] || [ "$ARCH" = "armv7" ]; then ARCH_TAG="arm"; \
    else echo "Unsupported architecture: $ARCH" && exit 1; fi && \
    DOWNLOAD_URL="https://github.com/go-shiori/shiori/releases/download/v1.7.4/shiori_Linux_${ARCH_TAG}_1.7.4.tar.gz" && \
    echo "Downloading: $DOWNLOAD_URL" && \
    curl -L -o /tmp/shiori.tar.gz "$DOWNLOAD_URL" && \
    tar -xzf /tmp/shiori.tar.gz -C /usr/local/bin && \
    chmod +x /usr/local/bin/shiori && \
    rm -rf /tmp/shiori.tar.gz

# Create a directory for the service and copy run.sh
RUN mkdir -p /etc/services.d/shiori
COPY run.sh /etc/services.d/shiori/run
RUN chmod +x /etc/services.d/shiori/run

# Ensure S6 is PID 1 and starts the service
CMD ["/init"]
