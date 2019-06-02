cd /opt/GENESIS/TOOLS
sudo apt install git
mkdir eman2
cd eman2
git clone https://github.com/cryoem/eman2.git
unzip eman2-master.zip
wget https://repo.continuum.io/miniconda/Miniconda2-4.4.10-Linux-x86_64.sh
conda install "conda>=4.5.2" -c defaults
conda install cmake=3.9 -c defaults
conda install eman-deps=14 -c cryoem -c defaults -c conda-forge
cmake <~/eman2-master>  -DENABLE_OPTIMIZE_MACHINE=ON
