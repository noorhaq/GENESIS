cd /opt/GENESIS/TOOLS
wget --no-check-certificate 'http://grigoriefflab.janelia.org/sites/all/modules/pubdnldcnt/pubdnldcnt.php?file=http://grigoriefflab.janelia.org/sites/default/files/summovie_1.0.1_150611.tar.gz&nid=4902' -O summovie.tar.gz
tar -xf summovie.tar.gz

rm -r summovie.tar.gz
sudo ln -s /opt/GENESIS/TOOLS/summovie*/bin/sum_movie_openmp_7_17_15.exe /bin/summovie

cd ..
