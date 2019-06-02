#!/bin/bash
cd /opt/GENESIS/TOOLS
wget http://gorgon.wustl.edu/pages/download.php
cd gorgon-master
pip install paramiko
pip install -U 
pip install cryptography
pip install pyasn1>=0.1.2
pip install six>=1.5.0
pip install cffi>=0.8
pip install gssapi
git clone 'https://github.com/pythongssapi/python-gssapi.git'
unzip gorgon-master.zip
python setup.py build
python setup.py install




