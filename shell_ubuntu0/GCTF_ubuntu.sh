#	Installation Package for frealign
cd TOOLS

wget --no-check-certificate 'http://www.mrc-lmb.cam.ac.uk/kzhang/Gctf/Gctf_v1.06_and_examples.tar.gz' -O Gctf.tar.gz

tar -xf Gctf.tar.gz
wget https://developer.nvidia.com/compute/cuda/8.0/Prod2/local_installers/cuda_8.0.61_375.26_linux-run
sudo sh cuda_8.0.61_375.26_linux.run

#Gctf-v1.06_sm_30_cu8.0_x86_64 --apix 1.07  --kV 300 --Cs 2.7 --ac 0.1  Micrographs/Falcon*.mrc
rm -r Gctf.tar.gz
cd ..
