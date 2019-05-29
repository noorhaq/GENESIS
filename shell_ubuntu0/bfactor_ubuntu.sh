
#		Installation script file for bfactor
cd TOOLS
$PWD=pwd
wget --no-check-certificate 'http://grigoriefflab.janelia.org/sites/all/modules/pubdnldcnt/pubdnldcnt.php?file=http://grigoriefflab.janelia.org/sites/default/files/bfactor_v1.03.tar.gz&nid=129' -O bfactor_v1.03.tar.gz

tar -xf bfactor_v1.03.tar.gz

rm -r bfactor_v1.03.tar.gz
ln $PWD/bfactor/bfactor.exe /bin/bfactor

cd .. 
