@echo off
chcp 65001
cd /d "%~dp0"
echo "安装APK，请确保【开发人员模式】处于打开状态"
adb.exe connect 127.0.0.1:58526
adb.exe -s 127.0.0.1:58526 install -r "%1"
if %errorlevel% == 0 (
    echo "安装成功(按任意键退出)" 
) else (
    start %LOCALAPPDATA%\Microsoft\WindowsApps\MicrosoftCorporationII.WindowsSubsystemForAndroid_8wekyb3d8bbwe\WsaClient.exe
    echo "安装失败[安卓子系统未启动]"
    echo "启动子系统中。30秒后，再次尝试安装"
    timeout /t 30 /nobreak
    adb.exe connect 127.0.0.1:58526
    adb.exe -s 127.0.0.1:58526 install -r "%1"
    echo "如果出现Success，就表示安装成功了(按任意键退出)" 
)
adb.exe kill-server
pause & exit

