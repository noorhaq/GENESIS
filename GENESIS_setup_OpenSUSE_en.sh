#--------------------------------------------------------------------#
#	GENESIS V 1.0 INSTALLATION PACKAGE 	#


#!/bin/bash

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
	goto start;    
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
start:
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
shell_OpenSUSE=$(pwd);
Installing_location1=$(zenity --file-selection --title="Choose a directory" --directory)
cd $Installing_location1
mkdir GENESIS
cd GENESIS
mkdir TOOLS
cd TOOLS
Installing_location=$(pwd);
#==========================================================Selection Screen Tools
selection=$(zenity --list --checklist \
	--width=500 --height=400  --title="GENESIS v1.0 Setup" --text="Select the tools for Preprocessing you want to install." --separator=':'\
	--column="Select" --column="Sr" --column="Tool name" --column="Size (MB)"\
	FALSE 	1 	"bFactor"			"0.493"\
	FALSE 	2 	"cisTEM" 			"384"\
	FALSE 	3 	"diffMAP"			"0.183"\
	FALSE 	4 	"EDF"				"0.544"\
	FALSE 	5 	"ELEKTRONN"			"10"\
	FALSE 	6 	"findDQE"			"8.5"\
	FALSE 	7 	"frealign"			"143"\
	FALSE 	8 	"GCTF"				"303.6"\
	FALSE 	9 	"Relion"			"2.8"\
	FALSE 	10 	"Scipion"			"30"\
	FALSE 	11 	"Summovie"			"9.7"\
	FALSE 	12 	"Unblur"			"9.4"\
	FALSE 	13 	"Zorro"			"0.7")
echo $selection


#===================================================Installation proceed
zenity 	--question \
	--text "<span><b>Ready to install</b></span>\n
Setup is now ready to install GENESIS on your computer.
Installation will use at least 6-7GiB of diskspace if all the softwares are selected." \
	--title="GENESIS v1.0 Setup" \
	--height=400 --width=500 \
	--ok-label=Install \
	--cancel-label=Cancel \

exit_case

cd shell_OpenSUSE;
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
	cd $shell_OpenSUSE;
	echo "# Installing bFactor" ;
	chmod +x bfactor_OpenSUSE.sh
		sudo bash bfactor_OpenSUSE.sh
	sleep 2;;

	2)
	cd $shell_OpenSUSE;
	echo "# Installing cisTEM" ;
	chmod +x cisTEM_OpenSUSE.sh
		sudo bash cisTEM_OpenSUSE.sh
	sleep 2;;

	3)
	cd $shell_OpenSUSE;
	echo "# Installing diffMAP" ;
	chmod +x diffMAP_OpenSUSE.sh;
		sudo bash diffMAP_OpenSUSE.sh;
	sleep 2;;

	4)
	cd $shell_OpenSUSE;
	echo "# Installing EDF" ;
	chmod +x EDF_OpenSUSE.sh;
		sudo bash EDF_OpenSUSE.sh;
	sleep 2;;

	5)
	cd $shell_OpenSUSE;
	echo "# Installing ELEKTRONN" ;
	chmod +x ELEKTRON_OpenSUSE.sh;
		sudo bash ELEKTRON_OpenSUSE.sh;
	sleep 2;;

	6)
	cd $shell_OpenSUSE;
	echo "# Installing findDQE" ;
	chmod +x findDQE_OpenSUSE.sh;
		sudo bash findDQE_OpenSUSE.sh;
	sleep 2;;

	7)
	cd $shell_OpenSUSE;
	echo "# Installing frealign" ;
	chmod +x frealign_OpenSUSE.sh;
		sudo bash frealign_OpenSUSE.sh;
	sleep 2;;

	8)
	cd $shell_OpenSUSE;
	echo "# Installing GCTF" ;
	chmod +x GCTF_OpenSUSE.sh;
	sudo bash GCTF_OpenSUSE.sh;
	sleep 2;;

	9)
	cd $shell_OpenSUSE;
	echo "# Installing Relion" ;
	chmod +x Relion_OpenSUSE.sh;
		sudo bash Relion_OpenSUSE.sh;
	sleep 2;;

	10)
	cd $shell_OpenSUSE;
	echo "# Installing Scipion" ;
	chmod +x Scipion_OpenSUSE.sh;
		sudo bash Scipion_OpenSUSE.sh;
	sleep 2;;

	11)
	cd $shell_OpenSUSE;
	echo "# Installing Summovie" ;
	chmod +x summovie_OpenSUSE.sh;
		sudo bash summovie_OpenSUSE.sh;
	sleep 2;;

	12)
	cd $shell_OpenSUSE;
	echo "# Installing Unblur" ;
	chmod +x Unblur_OpenSUSE.sh;
		sudo bash Unblur_OpenSUSE.sh;
	sleep 2;;

	13)
	cd $shell_OpenSUSE;
	echo "# Installing Zorro" ;
	chmod +x zorro_OpenSUSE.sh;
		sudo bash zorro_OpenSUSE.sh;
	sleep 2;;

	14)
	cd $shell_OpenSUSE;
	echo "# Installing Scipion" ;
	chmod +x Scipion_OpenSUSE.sh;
		sudo ./Scipion_OpenSUSE.sh;
	sleep 2;;

	esac
done
) |
zenity 	--progress \
  	--title="GENESIS v1.0 Setup" \
 	--text="GENESIS Preprocessing Tools installation in progress..." \
	--height=400 --width=500 \
	--pulsate \
  	--auto-close\
  	--auto-kill \
#Installation finished
zenity 	--info \
	--text "<span><b>Completing the GENESIS Setup Wizard</b></span>\n
Click Finish to exit the GENESIS Setup Wizard." \
	--title="GENESIS v1.0 Setup" \
	--height=400 --width=500 \
	--ok-label=Finish

