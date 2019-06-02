mkdir bioimagexd
cd /opt/GENESIS/TOOLS
cd bioimagexd
wget http://sourceforge.net/projects/bioimagexd/files/bioimagexd/BioImageXD-1.0/BioImageXD-1.0-r1799.tar.gz/download
tar xvzf BioImageXD-1.0-r1799.tar.gz
rm -r BioImageXD-1.0-r1799.tar.gz
cd BioImageXD-1.0-r1799/BioImageXD-1.0
touch .bashrc
nano .bashrc
BXD_PATH="~/BioImageXD-1.0-r1799/BioImageXD-1.0"
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${BXD_PATH}/VTK/lib:${BXD_PATH}/VTK/lib/vtk-5.6:${BXD_PATH}/ITK/lib/InsightToolkit:${BXD_PATH}/ITK/lib/InsightToolkit/WrapITK/lib
python BioImageXD.py
