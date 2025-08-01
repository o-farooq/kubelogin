# Dockerfile for kubelogin
# This Dockerfile copies a pre-built binary into a minimal scratch image.
# The binary should be built before running docker build using: make kubelogin
# 
# Usage:
#   make build-image                    # Build with latest tag
#   GIT_TAG=v1.0.0 make build-image   # Build with specific tag
#
FROM scratch

# Build arguments for multi-architecture support
ARG TARGETARCH=amd64

# Copy the pre-built binary from local build to /usr/local/bin
COPY bin/linux_${TARGETARCH}/kubelogin /usr/local/bin/kubelogin

# Set the entrypoint
ENTRYPOINT ["/usr/local/bin/kubelogin"]