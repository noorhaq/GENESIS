#!/bin/bash
cd /opt/GENESIS/TOOLS
sudo apt update
wget 'http://www.ccpem.ac.uk/download.php' 
tar -xzvf ccpem-<version>.tar.gz
cd ccpem-<version>
sudo chmod +x install_ccpem.sh
./install_ccpem.sh
source setup_ccpem.sh
wget http://www.ccp4.ac.uk/download/index.php'http://www.ccp4.ac.uk/download/index.php'
cd ccp4
source ccp4.setup-sh
./ccpem

