cd /opt/GENESIS/TOOLS

sudo yum install git
sudo yum install python-pip

git clone 'https://github.com/I2PC/scipion.git' 
cd scipion
cd install
pip install script.py
cd ..

sudo ln -s /opt/GENESIS/TOOLS/scipion/./scipion /bin/scipion
