#!/bin/bash
## ALL STATS OF BATTERY
#~ find /sys/class/power_supply/BAT0/ -type f | xargs -tn1 cat

## BATTERY LOW LEVE ALERT
LOW_LEVEL=15

## DEFAULT ALERT ON 95
## USER CAN SPECIFY 1st ARG AS custom  threshold level

THRESHOLD=95

if [ $# -ge 1 ]
then
  if [ $1 -ge 0 -a  $1 -lt 100 ] ## -a means and condition
  then
    THRESHOLD=$1
  fi
fi


# post 4.2 keernel (see using uaname -a)  recommended usage to get batter percent /sys/class/power_supply/BAT0
# ll /sys/class/power_supply/BAT*
# cat /sys/class/power_supply/BAT0/capacity #in my machine  somtime it might in BAT1 !? :|

## GET CURRENT BATTERY STATE
CURRENT_LEVEL=$(cat /sys/class/power_supply/BAT0/capacity)
CURRENT_STATUS=$(cat /sys/class/power_supply/BAT0/status)

printf "$(date +"%d-%b-%Y %T (%Z)"), $(cat /sys/class/power_supply/BAT0/status), current battery level: $CURRENT_LEVEL, threshold: $THRESHOLD"


## if current battery level is more than threahhold
if [ $CURRENT_LEVEL -ge $THRESHOLD ] # Discharging | Charging
then
  #~ LOUD
  #~ paplay /usr/share/sounds/LinuxMint/stereo/phone-incoming-call.ogg

  #~ MILD
  paplay /usr/share/sounds/freedesktop/stereo/complete.oga
  echo "save power" | espeak
  printf ", HIGH ALERT"
fi


if [ $CURRENT_LEVEL -lt $LOW_LEVEL ] && [ $CURRENT_STATUS == "Discharging" ] # Discharging | Charging
then
  paplay /usr/share/sounds/freedesktop/stereo/complete.oga
  echo "connect charger" | espeak
  printf ", LOW ALERT"
fi

printf "\n"

## CRON: crontab -e
#~ XDG_RUNTIME_DIR=/run/user/1000
#~ */5 * * * * /home/rajz/auto-scripts/alert-on-full-battery.sh 95 >> /tmp/alert-on-full-battery.log

