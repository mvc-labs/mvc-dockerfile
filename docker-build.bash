#!/bin/bash

# Default version if none provided
DEFAULT_VERSION="v0.2.0.0"
VERSION=${1:-$DEFAULT_VERSION}

# Base URL for downloading binaries, assuming the version is part of the URL
BASE_URL="https://github.com/mvc-labs/mvc-mining-instruction/releases/download/"

# Construct the download URL
DOWNLOAD_URL="${BASE_URL}/${VERSION}/mvc.tar.gz"

# Directory to store the downloaded binaries
BIN_DIR="bin"
# Remove the existing bin directory if it exists
rm -rf ${BIN_DIR}

# Create the bin directory if it doesn't exist
mkdir -p ${BIN_DIR}

# Download the binaries into the bin directory
echo "Downloading MVC node software version ${VERSION} from ${DOWNLOAD_URL} ..."
curl -L "${DOWNLOAD_URL}" -o mvc.tar.gz

# Extracting the tarball if needed, assuming the binaries are tar
tar -xzf mvc.tar.gz

echo "Copying MVC configuration file mvc.conf to ${BIN_DIR} ..."

cp mvc.conf ${BIN_DIR}

rm mvc.tar.gz

echo "Download complete. Building Docker image..."

# Assuming there's a Dockerfile in the current directory
docker build --platform linux/x86_64 -t microvisionchain:"${VERSION}" .

echo "Docker image built successfully."

rm -rf bin
