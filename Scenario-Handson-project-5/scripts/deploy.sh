#!/bin/bash

SERVER_IP="server-ip"
USER="user"
REMOTE_DIR="/var/www/static-site"

echo "Deploying static site..."
rsync -avz --delete static-site/ $USER@$SERVER_IP:$REMOTE_DIR
echo "Deployment completed."
