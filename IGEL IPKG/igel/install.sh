#!/bin/bash

# Run containerd installation
bash /services/greencloud/install-containerd.sh

# Enable services (but don't start them yet - config sync will handle that)
enable_system_service containerd.service
enable_system_service gcnode.service

# Set executable permissions
chmod +x /services/greencloud/usr/local/bin/*
chmod +x /usr/local/bin/greencloud-register

# Run config sync to create config files from IGEL parameters
bash /services/greencloud/greencloud-config-sync.sh

# Start containerd
systemctl start containerd.service

echo "GreenCloud installation complete"
echo "Configure API key and node name in IGEL Setup, then run: greencloud-register"
