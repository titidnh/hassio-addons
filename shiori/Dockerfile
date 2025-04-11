ARG BUILD_FROM
FROM ${BUILD_FROM}

# Install dependencies
RUN apk add --no-cache curl tar

# Download and install Shiori based on architecture
RUN SHIORI_VERSION=1.7.4 && \
    ARCH=$(uname -m) && \
    if [ "$ARCH" = "x86_64" ]; then ARCH_TAG="x86_64"; \
    elif [ "$ARCH" = "aarch64" ]; then ARCH_TAG="aarch64"; \
    elif [ "$ARCH" = "armv7l" ] || [ "$ARCH" = "armv7" ]; then ARCH_TAG="arm"; \
    else echo "Unsupported architecture: $ARCH" && exit 1; fi && \
    echo "Downloading shiori_Linux_${ARCH_TAG}_${SHIORI_VERSION}.tar.gz" && \
    curl -L -o /tmp/shiori.tar.gz https://github.com/go-shiori/shiori/releases/download/v${SHIORI_VERSION}/shiori_Linux_${ARCH_TAG}_${SHIORI_VERSION}.tar.gz && \
    tar -xzf /tmp/shiori.tar.gz -C /usr/local/bin && \
    chmod +x /usr/local/bin/shiori && \
    rm -rf /tmp/shiori.tar.gz

# Copy entrypoint script
COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD [ "/run.sh" ]
