# This Bash script automates downloading, compiling, and installing libcurl 8.9.1 from source on a Linux system.
# Remediates vulnerabilities in older libcurl versions such as CVE-2024-7264 (Denial of Service vulnerability)

#!/bin/bash

echo "Installing required dependencies..."
sudo apt update
sudo apt install build-essential checkinstall zlib1g-dev libssl-dev -y

# Download and extract libcurl 8.9.1
echo "Downloading and extracting libcurl 8.9.1..."
sudo wget -P /usr/local/src https://curl.se/download/curl-8.9.1.tar.gz
cd /usr/local/src
sudo tar -xf curl-8.9.1.tar.gz

# Compile and install libcurl
echo "Configuring, compiling, and installing libcurl..."
cd curl-8.9.1
sudo ./configure --with-ssl
sudo make
sudo make install

# Update shared library cache
echo "Updating shared library cache..."
sudo ldconfig

# Confirm the installation
echo "Installation confirmed with the following version:"
/usr/local/bin/curl --version

# Optionally, reboot to ensure changes are fully applied
echo "Rebooting system to apply changes..."
sudo reboot

# Download this script:
# wget <github raw script url> --no-check-certificate

# Make the script executable:
# chmod +x libcurl-8.9.1-install.sh

# Execute the script:
# ./libcurl-8.9.1-install.sh
