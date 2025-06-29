#!/bin/bash
set -euxo pipefail

# Update package list
sudo apt-get update -y

# Install required packages
sudo apt-get install -y apache2 php nodejs

# Enable Apache2 service
sudo systemctl enable apache2

# Start Apache2 service
sudo systemctl start apache2
