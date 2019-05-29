cd /opt/GENESIS/TOOLS
#-----------------Installing Dependencies
sudo  apt install git
sudo  apt install python-pip
sudo  apt install libfftw3-dev
sudo pip install numpy
sudo pip install SciPy
sudo pip install pyFFTW
sudo pip install mrcz
sudo pip install PyTables
sudo pip install scikit-image
sudo pip install PySide
sudo pip install psutil
sudo pip uninstall matplotlib
sudo pip install matplotlib==2.0.2

#--Cloining Link
git clone https://github.com/C-CINA/zorro.git

cd zorro

pip install -I zorroautomator --user

#automator & #TO launch Zorro GUI

cd ..
cd ..
