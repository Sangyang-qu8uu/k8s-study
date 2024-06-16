#!/bin/bash

# Go version details
GO_VERSION="1.22.4"
GO_TAR="go${GO_VERSION}.linux-amd64.tar.gz"
CURRENT_DIR="$(pwd)"
GO_TAR_PATH="${CURRENT_DIR}/${GO_TAR}"

# Installation directory
INSTALL_DIR="/usr/local"

# Environment variables
GOROOT="${INSTALL_DIR}/go"
GOPATH="${INSTALL_DIR}/go"
PROFILE_FILE="/etc/profile"

# Function to install Go
install_go() {
    echo "Installing Go ${GO_VERSION}..."
    sudo tar -C ${INSTALL_DIR} -xzf ${GO_TAR_PATH}
}

# Function to set environment variables in /etc/profile
setup_env() {
    echo "Setting up environment variables..."
    {
        echo ""
        echo "# Go environment"
        echo "export GOROOT=${GOROOT}"
        echo "export GOPATH=${GOPATH}"
        echo "export PATH=\$PATH:\$GOROOT/bin"
    } | sudo tee -a ${PROFILE_FILE}
}

# Function to source /etc/profile to make changes take effect
source_profile() {
    echo "Sourcing /etc/profile to apply changes..."
    source ${PROFILE_FILE}
}

# Function to verify installation
verify_installation() {
    echo "Verifying Go installation..."
    go version
}

# Main function
main() {
    install_go
    setup_env
    source_profile
    verify_installation
    echo "Go ${GO_VERSION} installation completed."
}

# Run main function
main
