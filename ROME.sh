
cd TOOLS

wget --no-check-certificate 'http://ipccsb.dfci.harvard.edu/rome/source/ROME1.1.0.zip' -O ROME.zip
unzip ROME.zip
#--------------Installation
source /apps/mpss/intel_parallel_2015/composer_xe_2015.1.133/bin/compilervars.sh intel64
source /apps/mpss/intel_parallel_2015/impi/5.0.2.044/bin64/mpivars.sh

cd ROME
make
export ROME_CC=mpicxx
make

cd ..
rm -r ROME.zip
cd ..

