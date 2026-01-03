#!/bin/bash
set -e

echo "Installing Netdata..."
curl -s https://my-netdata.io/kickstart.sh | sudo bash

echo "Enabling and starting Netdata service..."
sudo systemctl enable netdata
sudo systemctl start netdata

echo "Netdata installation completed."
echo "Access dashboard at http://localhost:19999"
