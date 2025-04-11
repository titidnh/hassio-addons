ARG BUILD_FROM
FROM ${BUILD_FROM}

# Install dependencies
RUN apk add --no-cache curl unzip

# Download Shiori
ENV SHIORI_VERSION=1.7.0
RUN curl -L -o /tmp/shiori.zip https://github.com/go-shiori/shiori/releases/download/v${SHIORI_VERSION}/shiori_${SHIORI_VERSION}_Linux_x86_64.zip && \
    unzip /tmp/shiori.zip -d /usr/local/bin && \
    chmod +x /usr/local/bin/shiori && \
    rm -rf /tmp/shiori.zip

# Copy run script
COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD [ "/run.sh" ]
