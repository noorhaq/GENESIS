#		Installation script file for diffMAP
cd /opt/GENESIS/TOOLS
wget --no-check-certificate 'http://grigoriefflab.janelia.org/sites/all/modules/pubdnldcnt/pubdnldcnt.php?file=http://grigoriefflab.janelia.org/sites/default/files/diffmap.tar.gz&nid=132' -O diffmap.tar.gz

tar -xf diffmap.tar.gz

sudo ln -s /opt/GENESIS/TOOLS/diffmap/diffmap.exe /bin/diffmap
rm -r diffmap.tar.gz
cd ..
