FROM alpine:3.16

# Install required packages (NFS and RPC)
RUN apk add --no-cache nfs-utils iproute2 && \
    rm -rf /var/cache/apk/*

# Create the necessary directories
RUN mkdir -p /exports

# Configure the startup scripts
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Expose the necessary ports
EXPOSE 2049 20048 111/udp 111/tcp

# Entry point
ENTRYPOINT ["/entrypoint.sh"]
