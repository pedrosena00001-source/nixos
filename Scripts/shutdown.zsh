!#usr/bin/env zsh
choice=$(echo -e "Shutdown\nReboot" | rofi -dmenu)
echo $choice

if [[ "$choice" == "Shutdown" ]]; then 
     shutdown -h now
elif [[ "$choice" == "Reboot" ]]; then 
	 reboot
else
	exit 0
fi


