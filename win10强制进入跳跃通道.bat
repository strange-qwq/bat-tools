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
title windows 10 更新通道更改工具
color 70
mode con lines=30 cols=101
cls
echo.
echo.
echo ==================================================================================================
echo.
echo.                                             说明
echo.
echo. 请先打开Windows 10的“设置”
echo.
echo  进入“更新和安全选项卡”
echo.
echo  选择“Windows 预览体验计划”
echo.
echo  将“你希望接收哪类内容”下面的选项框更改为“跳到下一个Windows版本”
echo.
echo  然后再本批处理中按任意键生成注册表文件并自动导入
echo.
echo ==================================================================================================
echo.
goto 1
::pause

:1
cls
echo.
echo 创建注册表文件并自动导入
echo.
echo ==================================================================================================
echo.
echo  开始操作
echo.
echo Windows Registry Editor Version 5.00>强制进入跳跃通道.reg
echo. >>强制进入跳跃通道.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsSelfHost\Applicability]>>强制进入跳跃通道.reg
echo "ContentType"="Skip">>强制进入跳跃通道.reg
regedit /s 强制进入跳跃通道.reg
del 强制进入跳跃通道.reg
goto 2

:2
cls
echo
echo.
echo ==================================================================================================
echo.
echo.                                             说明
echo.
echo. 注册表已导入完毕
echo.
echo  现在随便在当前分类中切换一个选项卡
echo.
echo  再切换回来
echo.
echo  如果通道没变则为更改成功
echo.
echo  反之请手动到打开注册表（regedit.exe)
echo.
echo  依次进入“计算机\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsSelfHost\Applicability”
echo.
echo  双击"ContentType"修改数据为"Skip"确定保存即可
echo.
echo ==================================================================================================
echo.
pause





