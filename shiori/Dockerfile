ARG BUILD_FROM
FROM ${BUILD_FROM}

ENV SHIORI_VERSION=1.7.4

# Install dependencies
RUN apk add --no-cache curl tar

# Set ARCH-specific download logic
RUN ARCH=$(uname -m) && \
    if [ "$ARCH" = "x86_64" ]; then ARCH_TAG="x86_64"; \
    elif [ "$ARCH" = "aarch64" ]; then ARCH_TAG="aarch64"; \
    elif [ "$ARCH" = "armv7l" ] || [ "$ARCH" = "armv7" ]; then ARCH_TAG="arm"; \
    else echo "Unsupported arch: $ARCH" && exit 1; fi && \
    echo "Downloading for architecture: $ARCH_TAG" && \
    curl -L -o /tmp/shiori.tar.gz https://github.com/go-shiori/shiori/releases/download/v${SHIORI_VERSION}/shiori_Linux_${ARCH_TAG}_${SHIORI_VERSION}.tar.gz && \
    tar -xzf /tmp/shiori.tar.gz -C /usr/local/bin && \
    chmod +x /usr/local/bin/shiori && \
    rm -rf /tmp/shiori.tar.gz

COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD [ "/run.sh" ]
