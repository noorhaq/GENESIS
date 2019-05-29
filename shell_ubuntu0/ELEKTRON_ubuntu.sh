#		Installation script file for ELEKTRON
cd ..
cd TOOLS_ubuntu
$PWD=pwd
#Download Main Dependencies
sudo apt install git
sudo apt install cython
sudo apt install python
sudo apt install python-tk
sudo apt install curl
# Download Links
git clone 'https://github.com/ELEKTRONN/ELEKTRONN.git'

cd ELEKTRONN

# Downloading Python sub Dependencies
sudo python2 -m pip install 'numpy>=1.8' --user
sudo python2 -m pip install 'scipy>=0.14' --use$
sudo python2 -m pip install 'matplotlib>=1.4' --user
sudo python2 -m pip install 'h5py>=2.2' --user
sudo python2 -m pip install 'numpy>=0.10' --user
sudo python2 -m pip install 'cython>=0.23' --user

# Installing Setup
sudo apt-get install nvidia-cuda-toolkit
sudo python2 -m pip install elektronn --user

#	Theano Configuration
wget --no-check-certificate 'https://developer.nvidia.com/compute/cuda/10.1/Prod/local_installers/cuda_10.1.105_418.39_linux.run'
sudo sh cuda_10.1.105_418.39_linux.run

#	.bashrc script for 
export PATH=/usr/local/cuda-10.1/bin:$PATH >> .bashrc
export LD_LIBRARY_PATH=/usr/local/cuda-10.1/lib64:$LD_LIBRARY_PATH >> .bashrc

touch ~/.theanorc
[global]				>>.theanorc
floatX = float32			>>.theanorc
device = gpu 				>>.theanorc
exception_verbosity=high		>>.theanorc
linker = cvm_nogc			>>.theanorc
					>>.theanorc
[nvcc]					>>.theanorc
fastmath = True				>>.theanorc
					>>.theanorc
[cuda]					>>.theanorc
root = /usr/local/cuda-10.1/		>>.theanorc

python2 -m setup.py install --user

cd $PWD
#Running an Example
elektronn-train MNIST_CNN_warp_config.py
