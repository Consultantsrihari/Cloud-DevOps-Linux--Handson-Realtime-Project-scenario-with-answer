#!/bin/bash

set -e

echo "Updating system..."
sudo apt update -y

echo "Installing Nginx..."
sudo apt install nginx -y

echo "Creating web root..."
sudo mkdir -p /var/www/static-site
sudo chown -R $USER:$USER /var/www/static-site

echo "Deploying Nginx configuration..."
sudo cp nginx/static-site.conf /etc/nginx/sites-available/static-site
sudo ln -sf /etc/nginx/sites-available/static-site /etc/nginx/sites-enabled/

sudo nginx -t
sudo systemctl reload nginx

echo "Nginx setup completed."
