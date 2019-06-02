cd /opt/GENESIS/TOOLS
sudo apt install git
mkdir ImageJ
cd ImageJ
wget --no-check-certificate https://downloads.imagej.net/fiji/latest/fiji-linux64.zip
unzip ij152-linux64-java8.zip
rm -r ij152-linux64-java8.zip
git clone https://github.com/fiji/register_virtual_stack_slices.git
unzip register_virtual_stack_slices-master.zip
rm -r register_virtual_stack_slices-master.zip
mv register_virtual_stack_slices-master /ij152-linux64-java8/ImageJ/plugins

