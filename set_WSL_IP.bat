@echo off
cacls.exe "%SystemDrive%\System Volume Information" >nul 2>nul
if %errorlevel%==0 goto Admin
if exist "%temp%\getadmin.vbs" del /f /q "%temp%\getadmin.vbs"
echo Set RequestUAC = CreateObject^("Shell.Application"^)>"%temp%\getadmin.vbs"
echo RequestUAC.ShellExecute "%~s0","","","runas",1 >>"%temp%\getadmin.vbs"
echo WScript.Quit >>"%temp%\getadmin.vbs"
"%temp%\getadmin.vbs" /f
if exist "%temp%\getadmin.vbs" del /f /q "%temp%\getadmin.vbs"
exit

:Admin
setlocal enabledelayedexpansion
:: set wsl2 ip
wsl -u root ip addr | findstr "192.168.169.2" > nul
if !errorlevel! equ 0 (
    echo wsl ip has set
) else (
    wsl -u root ip addr add 192.168.169.2/28 broadcast 192.168.169.15 dev eth0 label eth0:1
    echo set wsl ip success: 192.168.169.2
)

:: set windows ip
ipconfig | findstr "192.168.169.1" > nul
if !errorlevel! equ 0 (
    echo windows ip has set
    wsl
) else (
    netsh interface ip add address "vEthernet (WSL)" 192.168.169.1 255.255.255.240
    echo set windows ip success: 192.168.169.1
    wsl
)
