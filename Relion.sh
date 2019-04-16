$PWD=pwd
cd TOOLS

sudo apt install cmake build-essential mpi-default-bin mpi-default-dev libfftw3-dev

git clone https://github.com/3dem/relion.git
cd relion
#-----Installation:qa!

mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=/usr/local/GENESIS/relion/
make -j4
make install

cd $PWD
