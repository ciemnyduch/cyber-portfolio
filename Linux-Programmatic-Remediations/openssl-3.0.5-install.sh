# This Bash script automates downloading, compiling, and installing OpenSSL 3.0.5 from source on a Linux system, updating library paths, and rebooting to apply changes
# Remediates vulnerabilities in older OpenSSL versions such as CVE-2022-2097 and CVE-2022-2274

#!/bin/bash

echo "Installing dependencies..."
sudo apt update
sudo apt install build-essential checkinstall zlib1g-dev -y

# Download and extract OpenSSL 3.0.5
echo "Downloading and extracting OpenSSL 3.0.5..."
sudo wget -P /usr/local/src https://www.openssl.org/source/openssl-3.0.5.tar.gz
cd /usr/local/src
sudo tar -xf openssl-3.0.5.tar.gz

# Compile and install OpenSSL
echo "Configuring, compiling, and installing OpenSSL..."
cd openssl-3.0.5
sudo ./config
sudo make
sudo make install

# Set library path for OpenSSL libraries
echo "Setting library paths..."
echo "/usr/local/lib64" | sudo tee /etc/ld.so.conf.d/openssl-3.conf
sudo ldconfig

# Confirm the installation
echo "Installation confirmed with the following version:"
/usr/local/bin/openssl version

# Reboot to apply all changes
echo "Rebooting system to apply changes..."
sudo reboot

# Download the script
# wget <github url of raw script> --no-check-certificate

# Make the script executable:
# chmod +x openssl-3.0.5-install.sh

# Execute the script:
# ./openssl-3.0.5-install.sh
