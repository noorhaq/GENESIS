#	Installation Package for frealign
cd TOOLS

wget --no-check-certificate 'http://grigoriefflab.janelia.org/sites/all/modules/pubdnldcnt/pubdnldcnt.php?file=http://grigoriefflab.janelia.org/sites/default/files/frealign_v9.11_151031.tar.gz&nid=22' -O frealign.tar.gz

tar -xf frealign.tar.gz

export PATH=${PATH}:'${frealign_path}'/bin
setenv PATH ${PATH}:'${frealign_path}'/bin

rm -r frealign.tar.gz
cd ..
