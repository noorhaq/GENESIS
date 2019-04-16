
sudo apt install figlet ;
mkdir TOOLS ;
figlet -c G E N E S I S ;
chmod +x *.sh
echo " Installing bFactor" ; 	
sudo ./bfactor.sh  ;
echo " Installing EDF" ;
sudo ./EDF.sh ;
echo " Installing frealign" ;
sudo ./frealign.sh ;
echo " Installing ROME" ;
sudo ./ROME.sh ;
echo " Installing Unblur" ;
sudo ./Unblur.sh ;
echo " Installing cisTEM" ;
sudo ./cisTEM.sh ;
echo " Installing ELEKTRONN" ;
sudo ./ELEKTRON.sh ;
echo " Installing GCTF" ; 
sudo ./GCTF.sh ;
echo " Installing Scipion" ; 
sudo ./Scipion.sh ;
echo " Installing Zorro" ;
sudo ./zorro.sh ;
echo " Installing diffMAP" ; 
sudo ./diffMAP.sh ;
echo " Installing findDQE" ;
sudo ./findDQE.sh ;
echo " Installing Relion" 
sudo ./Relion.sh ;		
echo " Installing Summovie" ; 
sudo ./summovie.sh ;
