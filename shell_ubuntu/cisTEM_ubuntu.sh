#		Installation script file for cisTEM
cd /opt/GENESIS/TOOLS
wget --no-check-certificate 'https://cistem.org/system/tdf/upload3/cistem-1.0.0-beta-intel-linux.tar.gz?file=1&type=cistem_details&id=37&force=0&s3fs=1' -O cisTEM_v1.0.tar.gz

tar -xf cisTEM_v1.0.tar.gz

sudo ln -s /opt/GENESIS/TOOLS/cistem-1.0.0-beta/cisTEM /bin/cisTEM

rm -r cisTEM_v1.0.tar.gz
cd ..
