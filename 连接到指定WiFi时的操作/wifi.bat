@echo off
netsh wlan show interfaces | Findstr /c:"SSID                   : ZRKJ_5G" && goto t || goto f

:t
echo worker > log.txt
start /d "E:\Install\Navicat" active.bat >> log.txt
net start MySQL80 >> log.txt
call "C:\Users\14561\AppData\Local\JetBrains\Toolbox\scripts\idea.cmd" >> log.txt
start /d "C:\Program Files (x86)\Oray\HskDDNS" HskDDNS.exe >> log.txt
goto e

:f
echo home > log.txt
start /d "G:\steam\skins\Threshold Miku Light" SteamLauncher.exe >> log.txt
goto p

:p
call "C:\Users\14561\Documents\Development\Kotlin\IDEA\qwq_tools\control_miot\power.bat" >> log.txt
goto p

:e
::cmd /k
