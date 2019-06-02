mkdir frealix
cd /opt/GENESIS/TOOLS
cd frealix
wget http://grigoriefflab.janelia.org/sites/all/modules/pubdnldcnt/pubdnldcnt.php?file=http://grigoriefflab.janelia.org/sites/default/files/frealix-1.0.0.tar.gz&nid=3546
tar xzvf frealix-1.0.0-linux64.tar.gz
rm -r xzvf frealix-1.0.0-linux64.tar.gz
./configure
make
make install

