@echo off
ver
echo.
echo 本工具需要以管理员权限运行，稍后将自动以管理员窗口打开
echo.
echo 如有提示请允许，谢谢
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
cls
title 快捷设置IP
color 70
::Netsh InterFace IP Show Address|Findstr "是"'>Nul&&goto this||goto auto
echo.
choice /c 12 /n /m "请选择设置类型(1:静态IP / 2:自动获取IP)："
if "%errorlevel%"=="1" goto this
if "%errorlevel%"=="2" goto auto

:this
title 指定IP
echo.
echo 正在设置IP及子网掩码
echo.
cmd /c netsh interface ip set address name="本地连接 2" source=static addr=169.254.0.37 mask=255.255.255.0 gateway=192.168.0.1 gwmetric=1
echo 正在设置DNS服务器
echo.
cmd /c netsh interface ip add dnsservers name="本地连接 2" address=218.6.200.139 index=1
cmd /c netsh interface ip add dnsservers name="本地连接 2" address=61.139.2.69 index=2
exit

:auto
title 自动IP
echo.
echo 自动获取IP地址....
echo.
netsh interface ip set address name = "本地连接 2" source = dhcp
echo 自动获取DNS服务器....
echo.
netsh interface ip set dns name = "本地连接 2" source = dhcp
exit