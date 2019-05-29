$PWD=pwd
cd TOOLS

sudo apt install g++-5 gcc-5

sudo apt install cmake build-essential mpi-default-bin mpi-default-dev libfftw3-dev

git clone https://github.com/3dem/relion.git
cd relion
#-----Installation:qa!

mkdir build
cd build
sudo cmake -DCMAKE_INSTALL_PREFIX=$PWD/TOOLS/relion/

update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-6 2 --slave /usr/bin/g++ g++ /usr/bin/g++-6
update-alternatives --config gcc
sudo make -j4
sudo make install
ln $PWD/TOOLS/relion/bin/relion /bin/relion

cd $PWD
