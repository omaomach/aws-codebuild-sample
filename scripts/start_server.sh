mkdir scripts
cat < scripts/start_server.sh
#!/bin/bash
set -e  # Exit immediately if a command exits with a non-zero status

# Log output for debugging (optional)
exec > /tmp/start_server.log 2>&1

echo "=== Starting deployment script ==="

# Install Apache HTTP server if not already installed
echo "Installing httpd..."
sudo yum install -y httpd

# Start and enable Apache service
echo "Starting and enabling httpd..."
sudo systemctl start httpd
sudo systemctl enable httpd

# Create web root directory if it doesn't exist
echo "Creating /var/www/html..."
sudo mkdir -p /var/www/html

# Copy index.html to web root
echo "Copying index.html..."
sudo cp /home/ec2-user/MyApp/index.html /var/www/html/index.html

echo "=== Deployment completed successfully ==="
EOF

chmod +x scripts/start_server.sh