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
title windows 10 ����ͨ�����Ĺ���
color 70
mode con lines=30 cols=101
cls
echo.
echo.
echo ==================================================================================================
echo.
echo.                                             ˵��
echo.
echo. ���ȴ�Windows 10�ġ����á�
echo.
echo  ���롰���ºͰ�ȫѡ���
echo.
echo  ѡ��Windows Ԥ������ƻ���
echo.
echo  ������ϣ�������������ݡ������ѡ������Ϊ��������һ��Windows�汾��
echo.
echo  Ȼ���ٱ��������а����������ע����ļ����Զ�����
echo.
echo ==================================================================================================
echo.
goto 1
::pause

:1
cls
echo.
echo ����ע����ļ����Զ�����
echo.
echo ==================================================================================================
echo.
echo  ��ʼ����
echo.
echo Windows Registry Editor Version 5.00>ǿ�ƽ�����Ծͨ��.reg
echo. >>ǿ�ƽ�����Ծͨ��.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsSelfHost\Applicability]>>ǿ�ƽ�����Ծͨ��.reg
echo "ContentType"="Skip">>ǿ�ƽ�����Ծͨ��.reg
regedit /s ǿ�ƽ�����Ծͨ��.reg
del ǿ�ƽ�����Ծͨ��.reg
goto 2

:2
cls
echo
echo.
echo ==================================================================================================
echo.
echo.                                             ˵��
echo.
echo. ע����ѵ������
echo.
echo  ��������ڵ�ǰ�������л�һ��ѡ�
echo.
echo  ���л�����
echo.
echo  ���ͨ��û����Ϊ���ĳɹ�
echo.
echo  ��֮���ֶ�����ע���regedit.exe)
echo.
echo  ���ν��롰�����\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsSelfHost\Applicability��
echo.
echo  ˫��"ContentType"�޸�����Ϊ"Skip"ȷ�����漴��
echo.
echo ==================================================================================================
echo.
pause





