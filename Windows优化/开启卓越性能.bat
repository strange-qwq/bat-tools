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
title windows�Ż����� V 1.0��by.QWQ��
color 70
ver
echo.
echo  ==================================================================================================
echo.
echo  ����׿Խ����ר��
echo.
echo  ==================================================================================================
echo.
pause

:PowerPlanning
cls
ver | find "6.1." > NUL &&  goto win7
ver | find "6.2." > NUL &&  goto win7
ver | find "6.3." > NUL &&  goto win7
ver | find "10.0." > NUL &&  goto win10

:win7
echo  ===============================================
echo.
echo             �л���Դ�ƻ�Ϊ������
echo.
echo  3���ִ��...
echo.
ping -n 3 127.0.0.1>nul
start "" C:\\Windows\\System32\\powercfg.exe -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
set "guid=8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c"
goto Set

:win10
echo  ===============================================
echo.
echo             �л���Դ�ƻ�Ϊ׿Խ����
echo.
echo  3���ִ��...
echo.
ping -n 3 127.0.0.1>nul
setlocal EnableExtensions
setlocal EnableDelayedExpansion
set "params=%*"
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )
powercfg /list | find "(׿Խ����)" > NUL
if %ERRORLEVEL% == 0 (
goto SetActive
) else (
goto DuplicateScheme
)

:DuplicateScheme
powercfg /DUPLICATESCHEME e9a42b02-d5df-448d-aa00-03f14749eb61 && echo ������Դ�ƻ��ɹ��� && goto SetActive

:SetActive
for /f "tokens=3,4" %%i in ('powercfg /list') do (
if "%%j" == "(׿Խ����)" powercfg /SETACTIVE %%i && echo �л��ɹ���
)
Endlocal
>%tmp%\$t powercfg /l
for /f "tokens=1-3*" %%a in ('type %tmp%\$t^|find "׿Խ����"') do (
    set "guid=%%c"
)
goto Set

:Set
echo  =====================
echo.
echo      ������������
echo.
powercfg /h on
echo.
echo  =====================
echo.
echo    ���õ�Դ��ťΪ�ػ�
echo.
powercfg -SetDcValueIndex 381b4222-f694-41f0-9685-ff5bb260df2e 4f971e89-eebd-4455-a8de-9e59040e7347 7648efa3-dd9c-4e3e-b566-50f929386280 3
powercfg -SetAcValueIndex 381b4222-f694-41f0-9685-ff5bb260df2e 4f971e89-eebd-4455-a8de-9e59040e7347 7648efa3-dd9c-4e3e-b566-50f929386280 3
echo.
echo  =====================
echo.
echo    ����˯�߰�ťΪ˯��
echo.
powercfg -SetDcValueIndex 381b4222-f694-41f0-9685-ff5bb260df2e 4f971e89-eebd-4455-a8de-9e59040e7347 96996bc0-ad50-47ec-923b-6f41874dd9eb 1
powercfg -SetAcValueIndex 381b4222-f694-41f0-9685-ff5bb260df2e 4f971e89-eebd-4455-a8de-9e59040e7347 96996bc0-ad50-47ec-923b-6f41874dd9eb 1
echo.
echo  =====================
echo.
echo    ���ùرո����޲���
echo.
powercfg -SetDcValueIndex 381b4222-f694-41f0-9685-ff5bb260df2e 4f971e89-eebd-4455-a8de-9e59040e7347 5ca83367-6e45-459f-a27b-476b1d01c936 0
powercfg -SetAcValueIndex 381b4222-f694-41f0-9685-ff5bb260df2e 4f971e89-eebd-4455-a8de-9e59040e7347 5ca83367-6e45-459f-a27b-476b1d01c936 0
echo.
echo  ִ����ɣ�
echo.
mshta vbscript:msgbox("�������",64,"Done")(window.close)
echo.
echo  ��������˳�
pause >nul
exit