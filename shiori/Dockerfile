ARG BUILD_FROM
FROM ${BUILD_FROM}

ENV SHIORI_VERSION=1.7.0

# Install dependencies
RUN apk add --no-cache curl unzip

# Set ARCH-specific download logic
RUN ARCH=$(uname -m) && \
    if [ "$ARCH" = "x86_64" ]; then ARCH_TAG="x86_64"; \
    elif [ "$ARCH" = "aarch64" ]; then ARCH_TAG="arm64"; \
    elif [ "$ARCH" = "armv7l" ] || [ "$ARCH" = "armv7" ]; then ARCH_TAG="armv7"; \
    else echo "Unsupported arch: $ARCH" && exit 1; fi && \
    echo "Downloading for architecture: $ARCH_TAG" && \
    curl -L -o /tmp/shiori.zip https://github.com/go-shiori/shiori/releases/download/v${SHIORI_VERSION}/shiori_${SHIORI_VERSION}_Linux_${ARCH_TAG}.zip && \
    unzip /tmp/shiori.zip -d /usr/local/bin && \
    chmod +x /usr/local/bin/shiori && \
    rm -rf /tmp/shiori.zip

COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD [ "/run.sh" ]
