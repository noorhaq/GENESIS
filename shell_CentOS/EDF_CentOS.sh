cd /opt/GENESIS/TOOLS
mkdir ImageJ
cd ImageJ
wget --no-check-certificate 'http://wsr.imagej.net/distros/linux/ij152-linux64-java8.zip' -O ImageJ.zip

unzip ImageJ.zip
rm -r ImageJ.zip

#----ImageJ Plugin----------------------------------
cd ?lugin?
wget --no-check-certificate 'http://bigwww.epfl.ch/demo/edf/EDF.zip' -0 EDF.zip
unzip EDF.zip

rm -r EDF.zip
cd ..
cd ..
