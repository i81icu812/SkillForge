# terraform/main.tf
# Training Routine: Create a Container with Apache2, PHP, Node.js, Python3 and Deploy to DigitalOcean Droplet

# Provider Configuration
provider "digitalocean" {
  token = "your_digitalocean_token_here"  # Replace with your DigitalOcean API token
}

# Resource: DigitalOcean Droplet
resource "digitalocean_droplet" "container" {
  name         = "LAP_Container"            # Name of the droplet
  image         = "ubuntu-2204-x64-stable" # Ubuntu 22.04 image
  region        = "us-central1"            # Region (e.g., us-central1)
  size          = "s-1vcpu"                # Droplet size
  private_networking = true                # Enable private networking
  key_pair      = "my-key-pair"            # SSH key pair for access
}

# Provisioners to Install Required Packages
provisioner "shell" {
  source = "scripts/install_packages.sh"  # Script to install packages
  timeout = "10m"                         # Timeout for provisioning
}

# Script to Install Packages (bash)
# This script is executed after the droplet is created
# It installs Apache2, PHP, Node.js, and Python3
# Ensure the script is in the correct directory and executable

# Comments:
# 1. Provider block: Configures DigitalOcean with your token
# 2. Droplet resource: Creates a new droplet with Ubuntu 22.04
# 3. Provisioner: Installs required packages using a shell script
# 4. Script: Contains commands to install Apache2, PHP, and Node.js
