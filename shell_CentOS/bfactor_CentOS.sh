#!/bin/sh
#		Installation script file for bfactor
cd /opt/GENESIS/TOOLS
wget --no-check-certificate 'http://grigoriefflab.janelia.org/sites/all/modules/pubdnldcnt/pubdnldcnt.php?file=http://grigoriefflab.janelia.org/sites/default/files/bfactor_v1.03.tar.gz&nid=129' -O bfactor_v1.03.tar.gz
echo $Installing_location
tar -xf bfactor_v1.03.tar.gz

rm -r bfactor_v1.03.tar.gz
sudo ln -s /opt/GENESIS/TOOLS/bfactor/bfactor.exe /bin/bfactor

cd .. 
