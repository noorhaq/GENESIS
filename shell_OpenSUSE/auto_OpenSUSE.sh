mkdir ImageJ
cd /opt/GENESIS/TOOLS
cd ImageJ
wget --no-check-certificate https://downloads.imagej.net/fiji/latest/fiji-linux64.zip
unzip ij152-linux64-java8.zip
rm -r ij152-linux64-java8.zip

wget --no-check-certificate http://maven.imagej.net/service/local/artifact/maven/redirect?r=releases&g=sc.fiji&a=Auto_Threshold&v=RELEASE&e=jar
unzip Auto_Threshold-1.17.1.jar
rm -r Auto_Threshold-1.17.1.jar
mv Auto_Threshold-1.17.1 /ij152-linux64-java8/ImageJ/plugins

