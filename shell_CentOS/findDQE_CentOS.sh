#	Installation Package for findDQE
cd /opt/GENESIS/TOOLS
wget --no-check-certificate 'http://grigoriefflab.janelia.org/sites/all/modules/pubdnldcnt/pubdnldcnt.php?file=http://grigoriefflab.janelia.org/sites/default/files/FindDQE_131021.tar.gz&nid=4220' -O findDQE.tar.gz

tar -xf findDQE.tar.gz

rm -r findDQE.tar.gz
sudo ln -s /opt/GENESIS/TOOLS/FindDQE/bin/finddqe.exe /bin/findDQE

cd ..
