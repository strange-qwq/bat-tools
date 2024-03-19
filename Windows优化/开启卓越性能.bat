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
title windows优化工具 V 1.0（by.QWQ）
color 70
ver
echo.
echo  ==================================================================================================
echo.
echo  开启卓越性能专版
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
echo             切换电源计划为高性能
echo.
echo  3秒后执行...
echo.
ping -n 3 127.0.0.1>nul
start "" C:\\Windows\\System32\\powercfg.exe -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
set "guid=8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c"
goto Set

:win10
echo  ===============================================
echo.
echo             切换电源计划为卓越性能
echo.
echo  3秒后执行...
echo.
ping -n 3 127.0.0.1>nul
setlocal EnableExtensions
setlocal EnableDelayedExpansion
set "params=%*"
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )
powercfg /list | find "(卓越性能)" > NUL
if %ERRORLEVEL% == 0 (
goto SetActive
) else (
goto DuplicateScheme
)

:DuplicateScheme
powercfg /DUPLICATESCHEME e9a42b02-d5df-448d-aa00-03f14749eb61 && echo 创建电源计划成功。 && goto SetActive

:SetActive
for /f "tokens=3,4" %%i in ('powercfg /list') do (
if "%%j" == "(卓越性能)" powercfg /SETACTIVE %%i && echo 切换成功。
)
Endlocal
>%tmp%\$t powercfg /l
for /f "tokens=1-3*" %%a in ('type %tmp%\$t^|find "卓越性能"') do (
    set "guid=%%c"
)
goto Set

:Set
echo  =====================
echo.
echo      开启快速启动
echo.
powercfg /h on
echo.
echo  =====================
echo.
echo    设置电源按钮为关机
echo.
powercfg -SetDcValueIndex 381b4222-f694-41f0-9685-ff5bb260df2e 4f971e89-eebd-4455-a8de-9e59040e7347 7648efa3-dd9c-4e3e-b566-50f929386280 3
powercfg -SetAcValueIndex 381b4222-f694-41f0-9685-ff5bb260df2e 4f971e89-eebd-4455-a8de-9e59040e7347 7648efa3-dd9c-4e3e-b566-50f929386280 3
echo.
echo  =====================
echo.
echo    设置睡眠按钮为睡眠
echo.
powercfg -SetDcValueIndex 381b4222-f694-41f0-9685-ff5bb260df2e 4f971e89-eebd-4455-a8de-9e59040e7347 96996bc0-ad50-47ec-923b-6f41874dd9eb 1
powercfg -SetAcValueIndex 381b4222-f694-41f0-9685-ff5bb260df2e 4f971e89-eebd-4455-a8de-9e59040e7347 96996bc0-ad50-47ec-923b-6f41874dd9eb 1
echo.
echo  =====================
echo.
echo    设置关闭盖子无操作
echo.
powercfg -SetDcValueIndex 381b4222-f694-41f0-9685-ff5bb260df2e 4f971e89-eebd-4455-a8de-9e59040e7347 5ca83367-6e45-459f-a27b-476b1d01c936 0
powercfg -SetAcValueIndex 381b4222-f694-41f0-9685-ff5bb260df2e 4f971e89-eebd-4455-a8de-9e59040e7347 5ca83367-6e45-459f-a27b-476b1d01c936 0
echo.
echo  执行完成！
echo.
mshta vbscript:msgbox("完成啦！",64,"Done")(window.close)
echo.
echo  按任意键退出
pause >nul
exit