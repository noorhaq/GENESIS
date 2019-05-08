cd ..
cd TOOLS
$PWD=pwd

wget --no-check-certificate 'http://grigoriefflab.janelia.org/sites/all/modules/pubdnldcnt/pubdnldcnt.php?file=http://grigoriefflab.janelia.org/sites/default/files/unblur_1.0.2.tar.gz&nid=4902' -O unblur.zip
unzip unblur.zip

rm -r unblur.zip

sudo ln $PWD/unblur_1.0.2/bin/unblur_openmp_7_17_15.exe /bin/unblur

cd ..
