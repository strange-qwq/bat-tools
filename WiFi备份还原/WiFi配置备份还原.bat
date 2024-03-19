
@echo off
title 欢迎使用WiFi配置备份批处理（by.QWQ 2018.8.11）
color 70
echo.
ver
echo.
echo ==================================================
echo.
echo 欢迎使用WiFi配置备份批处理（by.QWQ）
echo.
echo tips：本批处理请勿使用管理员权限运行
echo.
echo 请选择操作：
echo.
echo 【1】备份
echo.
echo 【2】恢复
echo.
echo ==================================================
echo.
choice /c 12 /n /m "请选择"
if "%errorlevel%"=="1" goto backups
if "%errorlevel%"=="2" goto recovery

:backups
cls
title WiFi配置备份批处理(第一步，共三步）
echo.
echo.
echo ==================================================
echo.
echo 下面会列出当前计算机已保存的WiFi名称
echo.
netsh wlan show profiles
echo.
pause
cls
title WiFi配置备份批处理(第二步，共三步）
echo.
echo.
echo ==================================================
echo.
echo 提示：
echo.
echo 一个WiFi就是一个文件
echo.
echo 请确认本批处理所在位置适合存放
echo.
echo ==================================================
echo.
echo.
pause
cls
title WiFi配置备份批处理(第三步，共三步）
echo.
echo.
echo ==================================================
echo.
echo 结果：
echo.
netsh wlan export profile key=clear
echo.
pause>备份已完成，按任意键退出

:recovery
cls
echo.
echo.
echo ==================================================
echo.
echo 提示：
echo.
echo 请确认批处理所在位置有【WLAN】前缀的文件
echo.
echo ==================================================
echo.
pause
cls
echo ==================================================
echo.
echo 开始执行
echo.
for /r . %%i in (*.xml) do (
netsh wlan add profile filename="%%i" user=all
)
pause