#!/bin/bash

# Update the package repository
sudo yum update -y

# Install Docker
sudo yum install -y docker

# Start the Docker service
sudo service docker start

# Enable Docker to start on boot
sudo chkconfig docker on

# Add the user to the docker group (use "ec2-user")
sudo usermod -aG docker ec2-user

# Log out and log back in to apply changes
echo "Please log out and log back in to apply Docker group changes."

# Install Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Verify Docker Compose installation
docker-compose --version

echo "Docker and Docker Compose have been installed."
