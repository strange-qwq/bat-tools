@echo off
set wlanname=QAQ
set wlanpassword=1456158721
netsh wlan set hostednetwork  mode=allow ssid=%wlanname% key=%wlanpassword%
netsh wlan start hostednetwork
echo  Wlan ID:%wlanname%
echo  Wlan Password:%wlanpassword%
pause
cmd /k