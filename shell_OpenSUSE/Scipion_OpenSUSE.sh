cd /opt/GENESIS/TOOLS
sudo apt install git
sudo apt install python-pip

git clone 'https://github.com/I2PC/scipion.git'
cd scipion
cd install
pip install script.py
cd ..

sudo ln -s /opt/GENESIS/TOOLS/scipion/./scipion /bin/scipion
