cd TOOLS
$PWD=pwd

sudo apt install git
sudo apt install python-pip

git clone 'https://github.com/I2PC/scipion.git' 
cd scipion
cd install
pip install script.py
cd ..

sudo ln $PWD/scipion/./scipion /bin/scipion
