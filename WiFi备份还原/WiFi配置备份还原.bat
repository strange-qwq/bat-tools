
@echo off
title ��ӭʹ��WiFi���ñ���������by.QWQ 2018.8.11��
color 70
echo.
ver
echo.
echo ==================================================
echo.
echo ��ӭʹ��WiFi���ñ���������by.QWQ��
echo.
echo tips��������������ʹ�ù���ԱȨ������
echo.
echo ��ѡ�������
echo.
echo ��1������
echo.
echo ��2���ָ�
echo.
echo ==================================================
echo.
choice /c 12 /n /m "��ѡ��"
if "%errorlevel%"=="1" goto backups
if "%errorlevel%"=="2" goto recovery

:backups
cls
title WiFi���ñ���������(��һ������������
echo.
echo.
echo ==================================================
echo.
echo ������г���ǰ������ѱ����WiFi����
echo.
netsh wlan show profiles
echo.
pause
cls
title WiFi���ñ���������(�ڶ�������������
echo.
echo.
echo ==================================================
echo.
echo ��ʾ��
echo.
echo һ��WiFi����һ���ļ�
echo.
echo ��ȷ�ϱ�����������λ���ʺϴ��
echo.
echo ==================================================
echo.
echo.
pause
cls
title WiFi���ñ���������(����������������
echo.
echo.
echo ==================================================
echo.
echo �����
echo.
netsh wlan export profile key=clear
echo.
pause>��������ɣ���������˳�

:recovery
cls
echo.
echo.
echo ==================================================
echo.
echo ��ʾ��
echo.
echo ��ȷ������������λ���С�WLAN��ǰ׺���ļ�
echo.
echo ==================================================
echo.
pause
cls
echo ==================================================
echo.
echo ��ʼִ��
echo.
for /r . %%i in (*.xml) do (
netsh wlan add profile filename="%%i" user=all
)
pause