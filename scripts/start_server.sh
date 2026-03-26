#!/bin/bash
set -e
exec > /tmp/start_server.log 2>&1

echo "=== Starting deployment script ==="

echo "Installing httpd..."
sudo yum install -y httpd

echo "Starting and enabling httpd..."
sudo systemctl start httpd
sudo systemctl enable httpd

sudo mkdir -p /var/www/html

echo "Copying index.html..."
sudo cp /home/ec2-user/MyApp/index.html /var/www/html/index.html

echo "=== Deployment completed successfully ==="