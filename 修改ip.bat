@echo off
ver
echo.
echo ��������Ҫ�Թ���ԱȨ�����У��Ժ��Զ��Թ���Ա���ڴ�
echo.
echo ������ʾ������лл
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
title �������IP
color 70
::Netsh InterFace IP Show Address|Findstr "��"'>Nul&&goto this||goto auto
echo.
choice /c 12 /n /m "��ѡ����������(1:��̬IP / 2:�Զ���ȡIP)��"
if "%errorlevel%"=="1" goto this
if "%errorlevel%"=="2" goto auto

:this
title ָ��IP
echo.
echo ��������IP����������
echo.
cmd /c netsh interface ip set address name="�������� 2" source=static addr=169.254.0.37 mask=255.255.255.0 gateway=192.168.0.1 gwmetric=1
echo ��������DNS������
echo.
cmd /c netsh interface ip add dnsservers name="�������� 2" address=218.6.200.139 index=1
cmd /c netsh interface ip add dnsservers name="�������� 2" address=61.139.2.69 index=2
exit

:auto
title �Զ�IP
echo.
echo �Զ���ȡIP��ַ....
echo.
netsh interface ip set address name = "�������� 2" source = dhcp
echo �Զ���ȡDNS������....
echo.
netsh interface ip set dns name = "�������� 2" source = dhcp
exit