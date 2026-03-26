#!/bin/bash
exec > /tmp/start_server.log 2>&1

echo "=== Starting deployment script ==="
sudo yum install -y httpd || true
sudo systemctl start httpd || true
sudo systemctl enable httpd || true
sudo mkdir -p /var/www/html
sudo cp /home/ec2-user/MyApp/index.html /var/www/html/index.html
echo "=== Deployment completed successfully ==="