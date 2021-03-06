cd /opt/GENESIS/TOOLS

#-----------------Installing Dependencies
sudo xterm -e yum install git
sudo xterm -e yum install python-pip
sudo xterm -e yum install libfftw3-dev
sudo xterm -e pip install numpy
sudo xterm -e pip install SciPy
sudo xterm -e pip install pyFFTW
sudo xterm -e pip install mrcz
sudo xterm -e pip install PyTables
sudo xterm -e pip install scikit-image
sudo xterm -e pip install PySide
sudo xterm -e pip install psutil
sudo xterm -e pip uninstall matplotlib
sudo xterm -e pip install matplotlib==2.0.2

#--Cloining Link
git clone https://github.com/C-CINA/zorro.git

cd zorro

pip install -I zorroautomator

sudo ln -s /opt/GENESIS/TOOLS/zorro/zorro/python zorro.py /bin/scipion

#automator & #TO launch Zorro GUI

