FROM alpine:latest AS alpine

FROM docker.n8n.io/n8nio/n8n:latest

LABEL org.opencontainers.image.source="https://github.com/YOUR_GITHUB_USERNAME/n8n-custom"

USER root

# Copy apk binary and required libraries from Alpine
COPY --from=alpine /sbin/apk /sbin/apk
COPY --from=alpine /usr/lib/libapk.so* /usr/lib/

# Install additional utilities
RUN apk add --no-cache \
    ffmpeg \
    imagemagick \
    tesseract-ocr \
    tesseract-ocr-data-eng

USER node
