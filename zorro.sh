$PWD=pwd
cd TOOLS
#-----------------Installing Dependencies
sudo apt install git
sudo apt install python-pip
pip install numpy
pip install SciPy
pip install pyFFTW
pip install mrcz
pip install PyTables
pip install scikit-image
pip install PySide

#--Cloining Link
git clone https://github.com/C-CINA/zorro.git

cd automator

pip install Automator.py
cd $PWD
