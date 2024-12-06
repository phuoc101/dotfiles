#!/bin/bash
# Author : Ruturajn <nanotiruturaj@gmail.com>

# This script polls the battery status and prints out the
# the corresponding icon according the battery charge status.

# The path where battery info is stored on the system
BASE_PATH="/sys/class/power_supply/"

bat_var=$(ls "${BASE_PATH}" | grep "BAT")
battery_status=$(cat "${BASE_PATH}${bat_var}"/capacity)
# battery_status=$(acpi | sed 's/^.*ing, //' | sed 's/\%.*//')
ac_var=$(ls "${BASE_PATH}" | grep "AC")
charge_status=$(cat "${BASE_PATH}${ac_var}"/online)

if [[ "${battery_status}" -ge 90 ]] ; then
    # dunstify -r "9992" -i "icons8-full-battery-48" "Battery-Charged:${battery_status}%"
    bat_icon="󰁹"
elif [[ "${battery_status}" -ge 80 ]] ; then
    bat_icon="󰂂"
elif [[ "${battery_status}" -ge 70 ]] ; then
    bat_icon="󰂁"
elif [[ "${battery_status}" -ge 60 ]] ; then
    bat_icon="󰂀"
elif [[ "${battery_status}" -ge 50 ]] ; then
    bat_icon="󰁿"
elif [[ "${battery_status}" -ge 40 ]] ; then
    bat_icon="󰁾"
elif [[ "${battery_status}" -ge 30 ]] ; then
    bat_icon="󰁽"
elif [[ "${battery_status}" -ge 20 ]] ; then
    bat_icon="󰁼"
else
    bat_icon="󰁺"
	if [[ ${charge_status} != "1" ]]; then
		dunstify -u critical -r "9992" -i "icons8-battery-alert-48" "Battery-Low:${battery_status}%"
	fi
fi


# charge_status=$(acpi | awk '{print $3}' | sed 's/\,//')

# if [[ "${charge_status}" == "Charging" ]] ; then
#     bat_icon+=""
# fi
if [[ "${charge_status}" == "1" ]] ; then
    bat_icon="󰂄"
fi

printf "%s" " ${bat_icon}" " ${battery_status}% "
