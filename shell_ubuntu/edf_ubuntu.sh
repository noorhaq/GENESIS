mkdir ImageJ
cd /opt/GENESIS/TOOLS
cd ImageJ
wget --no-check-certificate https://downloads.imagej.net/fiji/latest/fiji-linux64.zip
wget --no-check-certificate http://bigwww.epfl.ch/demo/edf/edf_3D.jar
unzip EDF.zip
rm -r EDF.zip
mv EDF /ImageJ/ij152-linux64-java8/ImageJ/plugins

