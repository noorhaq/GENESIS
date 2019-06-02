#!/bin/bash
cd /opt/GENESIS/TOOLS
wget 'https://github.com/NeuroMorph-EPFL/NeuroMorph/raw/master/NeuroMorph_screenshot.png'
unzip NeuroMorph-master.zip
wget 'https://www.blender.org/download/Blender2.79/blender-2.79b-linux-glibc219-x86_64.tar.bz2/'
tar -xzvf blender-2.79b-linux-glibc219-x86_64.tar.bz2
cd /downloads
sudo apt install blender 


