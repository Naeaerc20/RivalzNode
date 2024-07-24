#!/bin/bash

# Step 1: Remove old Node.js and npm installations
echo
echo "##############################"
echo "# Removing Node.js and npm...#"
echo "##############################"
echo
sudo apt-get purge -y nodejs npm
sudo rm -rf /usr/local/bin/node /usr/local/bin/npm /usr/local/lib/node_modules
sudo rm -rf ~/.npm ~/.nvm ~/.node

# Step 2: Install NVM
echo
echo "####################"
echo "# Installing NVM...#"
echo "####################"
echo
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

# Load NVM into the current shell
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Step 3: Install Node.js v20.15.1
echo
echo "#################################"
echo "# Installing Node.js v20.15.1...#"
echo "#################################"
echo
nvm install 20.15.1
nvm alias default 20.15.1

# Identify free space of the largest partition or current partition
free_space=$(df -h --output=avail / | tail -1 | sed 's/[^0-9]//g')

# Step 4: Update npm to version 10.7.0
echo
echo "####################################"
echo "# Updating npm to version 10.7.0...#"
echo "####################################"
echo
npm install -g npm@10.7.0

# Step 5: Check installed versions
echo
echo "#################################"
echo "# Checking installed versions...#"
echo "#################################"
echo
node -v
npm -v

# 10-second pause
echo "10-second pause..."
sleep 10

# Install the rivalz-node-cli package
echo
echo "############################################"
echo "# Installing the rivalz-node-cli package...#"
echo "############################################"
echo
npm i -g rivalz-node-cli

# Inform about additional information needed
echo
echo "#################################"
echo "# Additional information needed #"
echo "#################################"
echo
echo "Before continuing, have the EVM wallet used in the testnet ready, you will need to provide it along with the following information:"
echo "Number of CPU cores to be used"
echo "Amount of RAM to be used by Rivalz's rClient"
echo "Disk type"
echo "Disk serial number"
echo "Disk size you want to allow the client to use"
echo "Currently available space: $free_space GB"
echo
echo "Press any key to continue..."
read -n 1 -s

# Run the rivalz run command
echo
echo "#####################################"
echo "# Running the rivalz run command... #"
echo "#####################################"
echo
rivalz run

echo "Installation and configuration completed!"
