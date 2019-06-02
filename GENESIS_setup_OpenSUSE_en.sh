#--------------------------------------------------------------------#
#	GENESIS V 1.0 INSTALLATION PACKAGE 	#


#!/bin/sh

#goto function

goto ()
{
	label=$1
	cmd=$(sed -n "/$label:/{:a;n;p;ba};" $0 | grep -v ':$')
	eval "$cmd"
	exit
}

#WELCOME

#Password Funtion
Password ()
{
if sudo -n true 2>/dev/null; then
    echo "Super User Access Enabled"
	start;
else
   PASSWD="$(zenity --password --title=Authetication\n)";
case $? in
   	 0)
			echo -e $PASSWD | sudo -S echo " ";
			Password;
			exit ;;
         1) zenity 	--question \
			--text "Are you sure you want to exit the installation?" \
			--ok-label=Yes \
			--width=500 \
			--title="GENESIS v1.0 Setup" \
			--cancel-label=No;
		case $? in
   			 0)
				echo "Installation Cancelled";
				exit ;;
    			 1)
				echo "Installation resumed";
				goto start;;
    			 -1)
        			echo "An unexpected error has occurred.";;
		esac;;
        -1)
                echo "An unexpected error has occurred.";
		zenity --error --width=500 --text "Error occurred during installation.";
		exit ;;
esac
fi
}
start:
#exit_case
exit_case(){
case $? in

         1) zenity 	--question \
			--text "Are you sure you want to exit the installation?" \
			--ok-label=Yes \
			--width=500 \
			--title="GENESIS v1.0 Setup" \
			--cancel-label=No;
		case $? in
   			 0)
				echo "Installation Cancelled";
				exit ;;
    			 1)
				echo "Installation resumed";
				goto start;;
    			 -1)
        			echo "An unexpected error has occurred.";;
		esac;;
        -1)
                echo "An unexpected error has occurred.";
		zenity --error --width=500 --text "Error occurred during installation.";
		exit ;;
esac

}

#Starting Point====================================================================================
Password;

zenity 	--question \
	--height=400 --width=500 \
	--ok-label=Next \
	--cancel-label=Cancel \
	--title="GENESIS v1.0 Setup" \
	--text="<span color=\"blue\"><b><big>Welcome</big></b></span>\n\n \
Welcome to GENESIS v1.0 Setup Wizard\n \
-------------------------------------------------------------------------------------------------------
GENESIS is a Cyro-Electron Imaging solution which installs all the necessary tools required to work with Cyro Electron Microscopes\n \

GENESIS implements the complete software pipeline related to Cyro-Electron Imaging. It also provide a seperate GUI Application to run each installed tool.\n\n\n\n\n\n\n\n\n \
Click Next to continue or Cancel to exit setup.\n"
exit_case;


#========================================Internet Availability Window
b=$(ping -q -w 1 -c 1 `ip r | grep default | cut -d ' ' -f 3` > /dev/null && echo 1 || echo 0);

if [ "$b" == 1 ]; then
	echo "Internet Available";
	zenity 	--info \
		--width=500 \
		--text "Internet connection check successful.\nTools installation will now proceed." \
		--title="GENESIS v1.0 Setup"
else
	echo "No internet";
	zenity 	--error \
		--width=500 \
		--text "No internet connection available.\nPlease check your internet connection and restart the installation." \
		--title="GENESIS v1.0 Setup"
	exit
fi

#==================File Selection
cd shell_OpenSUSE;
shell_ubuntu=$(pwd);
cd opt
sudo mkdir GENESIS
cd GENESIS
sudo mkdir TOOLS
cd TOOLS
#==========================================================Selection Screen Tools
selection=$(zenity --list --checklist \\
  --width=500 --height=400  --title="GENESIS v1.0 Setup" --text="Select the tools for Preprocessing you want to install." --separator=':'\\
  --column="Select" --column="Sr" --column="Tool name" --column="Size (MB)"\\
  FALSE   :   "******Image Pre-Prrocessing******"  " "\\
  FALSE   :  "  ***Image Enhancement***   "   " "\\
  FALSE   1   "bFactor"    "0.493"\\
  FALSE   2   "Diffmap"    "0.183"\\
  FALSE   3   "FindDQE"    "8.5"\\
  FALSE   4   "Relion"    "2.8"\\

  FALSE   :   "   ***Image Visualization***   "  " "\\
  FALSE   5  "BioImageXD"     "110"\\
  FALSE   6   "Drishti"     "2.2"\\

  FALSE   :   "   ***Drift Correction***   "  " "\\
  FALSE   7   "MotionCorr2"    "1.8"\\
  FALSE   8   "TranSPHIRE"    "0.883"\\
  FALSE   9   "Gctf"    "303"\\

  FALSE   :   "   ***CTF estimation***   "  " "\\
  FALSE   10   "Frealign"    "143"\\
  FALSE   11   "cisTEM"    "382"\\
  FALSE   12   "Gctf"    "303"\\

  FALSE   :   "******Image Processing******"    " "\\
  FALSE   :   "   ***Image Segmentation***   "     " "\\
  FALSE   13   "Auto-Threshold"    "0.18"\\

  FALSE   :   "   ***Image Registration***   "     " "\\
  FALSE   14   "BioImageXD"    "110"\\
  FALSE   15   "Virtual Stack"    "0.27"\\

  FALSE   :   "   ***3D Macro-molecules***   "    " "\\
  FALSE   16   "cisTEM"    "382"\\
  FALSE   17   "Emringer"    "0.256"\\
  FALSE   18   "Frealix"    "47"\\
  FALSE   19   "Gorgon"    "0.629"\\

  FALSE   :   "   ***3D Refinement***   "    " "\\
  FALSE   20   "ROME"    "169"\\


  FALSE   :   "******Structural Analysis******"    "9.4"\\
  FALSE   :   "   ***Particle Picking***   "    " "\\
  FALSE   21   "EMAN2"    "12"\\
  FALSE   22   "DeepPicker"    "0.416"\\
  FALSE   23   "cisTEM"    "382"\\
  FALSE   24   "Xmipp"    "7.3"\\

  FALSE   :   "   ***Neuron Tracing***   "    " "\\
  FALSE   25   "FARSIGHT"    "69"\\

  FALSE   :   "   ***Structural Orientation***   "    " "\\
  FALSE   26   "FibriTool"    "5.11"\\

  FALSE   :   "   ***Image Classification***   "    " "\\
  FALSE   27   "RELION"    "2.8"\\
  FALSE   28   "EMAN"    "12"\\
  FALSE   29   "cisTEM"    "382"\\

  FALSE   :   "   ***Biological Reconstruction***   "    " "\\
  FALSE   30   "FARSIGHT"    "69"\\

  FALSE   :   "   ***Single Particle Analysis***   "    " "\\
  FALSE   31   "Unblur"    "9.3"\\
  FALSE   32   "Scipion"    "29"\\
  FALSE   33   "EMringer"    "256"\\

  FALSE   :   "   ***Morphometric Analysis***   "    " "\\
  FALSE   34   "Gorgon"    "62.9"\\
  FALSE   35   "Flynotyper"    "167"\\
  FALSE   36   "BioImageXD"    "110"\\
  FALSE   37   "Fraclac"    "13.1"\\

  FALSE   :   "******Image Data Management******"    " "\\
  FALSE   :   "   ***Data Annotaion***   "    " "\\
  FALSE   38   "Cytomine"    "161.5"\\
  FALSE   39   "Summovie"    "9.6"\\
  FALSE   40   "NeuroMorph"    "131"\\
  FALSE   41   "CCP-EM"    "716")
echo $selection


#===================================================Installation procee
zenity   --question \\
  --text "<span><b>Ready to install</b></span>\\n
Setup is now ready to install GENESIS on your computer.
Installation will use at least 6-7GiB of diskspace if all the softwares are selected." \\
  --title="GENESIS v1.0 Setup" \\
  --height=400 --width=500 \\
  --ok-label=Install \\
  --cancel-label=Cancel \\

exit_case

cd shell_ubuntu;
#Tools Installation Preprocessing Screen
if [ -z "$selection" ] ; then
     echo "No Tools selected.";
    zenity --error --width=500 --text "No Tools selected to install.";
exit;
fi
(
   echo $selection
    IFS=":" ; for word in $selection ; do
   case $word in

  1)
  cd $shell_ubuntu;
  echo "# Installing bFactor" ;
  chmod +x bfactor_ubuntu.sh
   sudo bash bfactor_ubuntu.sh
  sleep 2;;

  2)

         cd $shell_ubuntu;
  echo "# Installing diffMAP" ;
  chmod +x diffMAP_ubuntu.sh;
   sudo bash diffMAP_ubuntu.sh;

   sleep 2;;

  3)

   cd $shell_ubuntu;
  echo "# Installing findDQE" ;
  chmod +x findDQE_ubuntu.sh;
   sudo bash findDQE_ubuntu.sh;

   sleep 2;;
  4)

        cd $shell_ubuntu;
  echo "# Installing Relion" ;
  chmod +x Relion_ubuntu.sh;
   sudo bash Relion_ubuntu.sh;
  sleep 2;;


  cd $shell_ubuntu;
  echo "# Installing EDF" ;
  chmod +x edf_ubuntu.sh;
   sudo bash edf_ubuntu.sh;
  sleep 2;;

  5)
  cd $shell_ubuntu;
  echo "# Installing BioImageXD" ;
  chmod +x bioimage_ubuntu.sh;
   sudo bash bioimage_ubuntu.sh;
  sleep 2;;

  6)

cd $shell_ubuntu;
  echo "# Installing Drishti" ;
  chmod +x drishti_ubuntu.sh;
   sudo bash drishti_ubuntu.sh;
  sleep 2;;


  7)

   cd $shell_ubuntu;
  echo "# Installing MotionCorr2" ;
  chmod +x motionCor2_ubuntu.sh;
   sudo bash motionCor2_ubuntu.sh;

   sleep 2;;

  8)

   cd $shell_ubuntu;
  echo "# Installing TranSPHIRE" ;
  chmod +x tranSPHIRE_ubuntu.sh;
   sudo bash tranSPHIRE_ubuntu.sh;
  sleep 2;;




  9)

   cd $shell_ubuntu;
  echo "# Installing GCTF" ;
  chmod +x GCTF_ubuntu.sh;
  sudo bash GCTF_ubuntu.sh;

   sleep 2;;
  10)

   cd $shell_ubuntu;
  echo "# Installing frealign" ;
  chmod +x frealign_ubuntu.sh;
   sudo bash frealign_ubuntu.sh;

   sleep 2;;
cd $shell_ubuntu;
  echo "# Installing Scipion" ;
  chmod +x Scipion_ubuntu.sh;
   sudo bash Scipion_ubuntu.sh;
  sleep 2;;

  11)

       cd $shell_ubuntu;
  echo "# Installing cisTEM" ;
  chmod +x cisTEM_ubuntu.sh
   sudo bash cisTEM_ubuntu.sh
  sleep 2;;




  12)

   cd $shell_ubuntu;
  echo "# Installing GCTF" ;
  chmod +x GCTF_ubuntu.sh;
  sudo bash GCTF_ubuntu.sh;

   sleep 2;;

  13)

       cd $shell_ubuntu;
  echo "# Installing Auto_Threshld" ;
  chmod +x auto_ubuntu.sh;
   sudo bash auto_ubuntu.sh;

   sleep 2;;



   14)
     cd $shell_ubuntu;
  echo "# Installing BioImageXD" ;
  chmod +x bioimage_ubuntu.sh;
   sudo bash bioimage_ubuntu.sh;

   sleep 2;;
  15)

       cd $shell_ubuntu;
  echo "# Installing Virtual stack" ;
  chmod +x virtual_stack_ubuntu.sh;
   sudo bash virtual_stack_ubuntu.sh;

   sleep 2;;

   16)
     cd $shell_ubuntu;
  echo "# Installing cisTEM" ;
  chmod +x cisTEM_ubuntu.sh
   sudo bash cisTEM_ubuntu.sh
  sleep 2;;
  17)
     cd $shell_ubuntu;
  echo "# Installing Emringer" ;
  chmod +x emringer_ubuntu.sh
   sudo bash emringer_ubuntu.sh
  sleep 2;;
  18)
     cd $shell_ubuntu;
  echo "# Installing Frealix" ;
  chmod +x Frealix_ubuntu.sh
   sudo bash Frealix_ubuntu.sh
  sleep 2;;
  19)
     cd $shell_ubuntu;
  echo "# Installing Gorgon" ;
  chmod +x Gorgon_ubuntu.sh
   sudo bash Gorgon_ubuntu.sh
  sleep 2;;
  20)
     cd $shell_ubuntu;
  echo "# Installing ROME" ;
  chmod +x ROME_ubuntu.sh
   sudo bash ROME_ubuntu.sh
  sleep 2;;
  21)
     cd $shell_ubuntu;
  echo "# Installing EMAN2" ;
  chmod +x eman_ubuntu.sh
   sudo bash eman_ubuntu.sh
  sleep 2;;
  22)
     cd $shell_ubuntu;
  echo "# Installing DeepPicker" ;
  chmod +x DeepPicker_ubuntu.sh
   sudo bash DeepPicker_ubuntu.sh
  sleep 2;;
  23)
     cd $shell_ubuntu;
  echo "# Installing cisTEM" ;
  chmod +x cisTEM_ubuntu.sh
   sudo bash cisTEM_ubuntu.sh
  sleep 2;;
  24)
     cd $shell_ubuntu;
  echo "# Installing Xmipp" ;
  chmod +x xmipp_ubuntu.sh
   sudo bash xmipp_ubuntu.sh
  sleep 2;;
  25)
     cd $shell_ubuntu;
  echo "# Installing FARSIGHT" ;
  chmod +x FARSIGHT_ubuntu.sh
   sudo bash FARSIGHT_ubuntu.sh
  sleep 2;;
  26)
     cd $shell_ubuntu;
  echo "# Installing FibriTooll" ;
  chmod +x FibriTool_ubuntu.sh
   sudo bash FibritTool_ubuntu.sh
  sleep 2;;
     27)
     cd $shell_ubuntu;
  echo "# Installing RELION" ;
  chmod +x RELION_ubuntu.sh
   sudo bash RELION_ubuntu.sh
  sleep 2;;
  28)
     cd $shell_ubuntu;
  echo "# Installing EMAN" ;
  chmod +x EMAN_ubuntu.sh
   sudo bash EMAN_ubuntu.sh
  sleep 2;;
  29)
  cd $shell_ubuntu;
  echo "# Installing cisTEM" ;
  chmod +x cisTEM_ubuntu.sh
   sudo bash cisTEM_ubuntu.sh
  sleep 2;;
  30)
     cd $shell_ubuntu;
  echo "# Installing FARSIGHT" ;
  chmod +x FARSIGHT_ubuntu.sh
   sudo bash FARSIGHT_ubuntu.sh
  sleep 2;;
  31)
     cd $shell_ubuntu;
  echo "# Installing Unblur" ;
  chmod +x Unblur_ubuntu.sh
   sudo bash Unblur_ubuntu.sh
  sleep 2;;
  32)
     cd $shell_ubuntu;
  echo "# Installing Scipion" ;
  chmod +x Scipion_ubuntu.sh;
   sudo ./Scipion_ubuntu.sh;
  sleep 2;;
  33)
     cd $shell_ubuntu;
  echo "# Installing EMriner" ;
  chmod +x EMringer_ubuntu.sh;
   sudo bash EMringer_ubuntu.sh;
  sleep 2;;
  34)
     cd $shell_ubuntu;
  echo "# Installing Gorgon" ;
  chmod +x Gorgon_ubuntu.sh
   sudo bash Gorgon_ubuntu.sh
  sleep 2;;
  35)
     cd $shell_ubuntu;
  echo "# Installing Flynotyper" ;
  chmod +x Flynotyper_ubuntu.sh
   sudo bash Flynotyper_ubuntu.sh
  sleep 2;;
  36)
     cd $shell_ubuntu;
  echo "# Installing BioImageXD" ;
  chmod +x BioImageXD_ubuntu.sh;
   sudo bash BioImageXD_ubuntu.sh;
  sleep 2;;
  37)
     cd $shell_ubuntu;
  echo "# Installing Fraclac" ;
  chmod +x Fraclac_ubuntu.sh;
   sudo bash Fraclac_ubuntu.sh;
  sleep 2;;
  38)
     cd $shell_ubuntu;
  echo "# Installing Cytomine" ;
  chmod +x Cytomine_ubuntu.sh;
   sudo bash Cytomine_ubuntu.sh;
  sleep 2;;
  39)
     cd $shell_ubuntu;
  echo "# Installing Summovie" ;
  chmod +x summovie_ubuntu.sh;
   sudo bash summovie_ubuntu.sh;
  sleep 2;;
  40)
     cd $shell_ubuntu;
  echo "# Installing NeuroMorph" ;
  chmod +x NeuroMorph_ubuntu.sh;
   sudo bash NeuroMorph_ubuntu.sh;
  sleep 2;;

  41)
     cd $shell_ubuntu;
  echo "# Installing CCP-EM" ;
  chmod +x CCP_EM_ubuntu.sh;
   sudo bash CCP_EM_ubuntu.sh;
  sleep 2;;





   esac
done
) |
zenity   --progress \\
    --title="GENESIS v1.0 Setup" \\
   --text="GENESIS Preprocessing Tools installation in progress..." \\
  --height=400 --width=500 \\
  --pulsate \\
    --auto-close\\
    --auto-kill \\
#Installation finishe
zenity   --info \\
  --text "<span><b>Completing the GENESIS Setup Wizard</b></span>\\n
Click Finish to exit the GENESIS Setup Wizard." \\
  --title="GENESIS v1.0 Setup" \\
  --height=400 --width=500 \\
  --ok-label=Finish
  

}
