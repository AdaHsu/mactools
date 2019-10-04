#!/bin/zsh

## 用途：依 Wi-Fi SSID 資訊自動切換網路所在位置

notification() {

osascript <<EOF
    display notification "$1"
EOF

}

outdoor() 
{
    networksetup -switchtolocation OUTDOOR

}

at_home()
{
    networksetup -switchtolocation Automatic

}


# 抄來的，等待電腦開機完成

NAME="$0:t:r"

PPID_NAME=$(ps -cp "$PPID" | fgrep -v 'PID TTY')

case "$PPID_NAME" in
    *launchd*)
        # delay 15s for Mac's first wakes up.
        sleep 30
    ;;
    *)              
        # These settings are used when the script is not called via `launchd`
    ;;
esac

# delay
sleep 3

# GET SSID
SSID=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | awk -F': ' '/ SSID/{print $NF}')

if [ "${SSID}" = "NEXUS_6P" ]
then
    SHOW_MOD="外出"
    outdoor
else
    SHOW_MOD="自動"
    at_home
fi

notification "已設定網路位置為 ${SHOW_MOD}"

