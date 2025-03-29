#!/bin/sh

# Configure exports
if [ -n "$EXPORTS" ]; then
    echo "$EXPORTS" >> /etc/exports
fi

# Start required RPC services
rpcbind -w || exit 1

# Start NFS (without the -F option, which causes issues)
rpc.nfsd || exit 1

# Start mountd with the exports
exportfs -r
rpc.mountd -F || exit 1

# Keep the container running
exec tail -f /dev/null
