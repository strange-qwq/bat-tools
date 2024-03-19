@echo off
chcp 65001
cd /d "%~dp0"
%1 start "" mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c ""%~s0"" ::","","runas",1)(window.close)&&exit

echo "输入1 添加 打开方式"
echo "输入2 删除 打开方式"
echo "输入3 更改.APK文件图标"
set _progId=WSA_install
set _handler=wsa.bat
set /p cmd_select=请输入数字:
if %cmd_select% == 1 ( goto _install )
if %cmd_select% == 2 ( goto _uninstall ) 
if %cmd_select% == 3 ( goto _set_icon )

:_uninstall
    reg delete HKCU\Software\Classes\.apk /f
    reg delete HKCU\Software\Classes\%_progId% /f
    echo "删除成功"
    pause & exit
:_install
    reg add HKCU\Software\Classes\.apk\OpenWithProgIds /v %_progId% /f
    reg add HKCU\Software\Classes\%_progId%\DefaultIcon /f /ve /d "%%SystemRoot%%\System32\shell32.dll,196"
    reg add HKCU\Software\Classes\%_progId%\Shell\Open\Command /f /ve /d "%~dp0%_handler% ""%%1"""
    echo "添加成功，请执行以下步骤，让其生效"
    echo "右键任意【.apk】格式文件 ->【打开方式】->【选择其他应用】->【wsa.bat】->【始终使用此应用打开】"
    pause & exit
:_set_icon
    echo "请输入图标的路径。逗号+数字表示第几个图标。"
    echo "要恢复图标，最初页面选择【输入1 添加 打开方式】"
    echo "【例】c:\abc\def.exe"
    echo "【例】c:\abc\def.dll,1"
    set /p icon_path=请输入路径:
    reg add HKCU\Software\Classes\%_progId%\DefaultIcon /f /ve /d "%icon_path%"
    echo "修改成功，请执行以下步骤，让其生效"
    echo "右键任意【.apk】格式文件 ->【打开方式】->【选择其他应用】->【wsa.bat】->【始终使用此应用打开】"
    pause & exit
