mkdir ImageJ
cd /opt/GENESIS/TOOLS
cd ImageJ
wget --no-check-certificate 'http://wsr.imagej.net/distros/linux/ij152-linux64-java8.zip' -O ImageJ.zip

unzip ImageJ.zip
rm -r ImageJ.zip

#----ImageJ Plugin----------------------------------
cd ?lugin?
wget --no-check-certificate 'https://imagej.nih.gov/ij/plugins/fraclac/fraclac.html' -0 fraclac.zip
unzip Frac_Lac.jar

rm -r Frac_Lac.jar
cd ..
cd ..
