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
title FBI WARNING !（1/4）
color 70
mode con lines=30 cols=101
setlocal enabledelayedexpansion
del shutdown.vbs
cls
echo.
echo 声明条款
echo.
echo ==================================================================================================
echo.
echo.                                             FBI WARNING !
echo.
echo.                                                警告！
echo.
echo  如有360、电脑管家等安全软件提醒，请勾选信任允许和不再提醒！
echo.
echo  本工具通过修改注册表的形式达到显示目的
echo.
echo  修改完成后会自动重启Windows以完成添加（不重启将无法看到是否修改成功）
echo.
echo  转载请保留著作信息（也就是选项4）
echo.
echo 【1】继续
echo.
echo 【2】拒绝
echo.
echo 【4】关于
echo.
echo ==================================================================================================
echo.
choice /c 1234 /n /m "请选择"
if "%errorlevel%"=="1" goto 1
if "%errorlevel%"=="2" exit
if "%errorlevel%"=="3" goto del
if "%errorlevel%"=="4" goto help

:1
cls
title 向控制面板添加steam快捷方式 By.QWQ（1/4）
echo.
echo.
echo.
echo ==================================================================================================
echo.
echo  既然您已经同意协议，那么我们继续
echo.
echo  跟据系统版本，我们的实现方式稍有不同
echo.
echo  bat将自动判断您的系统版本
echo.
echo  本工具仅支持以下Windows
echo.
echo  1.Windows XP
echo.
echo  2.Windows Vista
echo.
echo  3.Windows 7及以上
echo.
echo ==================================================================================================
echo.
ver | find "5.1." > NUL &&  goto XP
ver | find "5.2." > NUL &&  goto XP
ver | find "6.0." > NUL &&  goto Vista
ver | find "6.1." > NUL &&  goto 7
ver | find "6.2." > NUL &&  goto 7
ver | find "6.3." > NUL &&  goto 7
ver | find "10.0." > NUL &&  goto 7
echo 如果没有自动跳转请确认您是否在以上操作系统当中

:win
cls
title 请选择您的系统版本（2.5/4）
echo.
echo.
echo ==================================================================================================
echo.
echo  请选择您的系统版本并继续
echo.
echo  1.Windows XP
echo.
echo  2.Windows Vista
echo.
echo  3.Windows 7及以上
echo.
echo ==================================================================================================
echo.
choice /c 123 /n /m "请选择"
if "%errorlevel%"=="1" goto XP
if "%errorlevel%"=="2" goto Vista
if "%errorlevel%"=="3" goto 7

:XP
cls
title 向控制面板添加steam快捷方式 By.QWQ（2/4）
echo.
echo.
echo ==================================================================================================
echo.
echo  您的系统是Windows XP
echo.
echo  正确请按【1】
echo.
echo  错误请按【2】
echo.
echo ==================================================================================================
echo.
choice /c 12 /n /m "请选择"
if "%errorlevel%"=="1" goto XP_start
if "%errorlevel%"=="2" goto win

:Vista
cls
title 向控制面板添加steam快捷方式 By.QWQ（2/4）
echo.
echo.
echo ==================================================================================================
echo.
echo  您的系统是Windows Vista
echo.
echo  正确请按【1】
echo.
echo  错误请按【2】
echo.
echo ==================================================================================================
echo.
choice /c 12 /n /m "请选择"
if "%errorlevel%"=="1" goto Vista_start
if "%errorlevel%"=="2" goto win

:7
cls
title 向控制面板添加steam快捷方式 By.QWQ（2/4）
echo.
echo.
echo ==================================================================================================
echo.
echo  您的系统是Windows 7或以上
echo.
echo  正确请按【1】
echo.
echo  错误请按【2】
echo.
echo ==================================================================================================
echo.
choice /c 12 /n /m "请选择"
if "%errorlevel%"=="1" goto 7_start
if "%errorlevel%"=="2" goto win

:XP_start
cls
title 向控制面板添加steam快捷方式 By.QWQ（Windows XP_3/4）
echo.
echo 第一步：导入steam路径
echo.
echo ==================================================================================================
echo.
echo  开始操作
echo.
set /p steam1=请输入steam根目录路径(G:\steam\steam.exe，请填写G:\steam)：
set steam2=%steam1:\=\\%
cls
echo.
echo 第二步：生成注册表文件
echo.
echo ==================================================================================================
echo.
echo Windows Registry Editor Version 5.00>steam.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel\NameSpace\{b74436e4-f4de-43b4-9363-ac7041edc88b}]>>steam.reg
echo @="特别定制功能">>steam.reg
echo ;By.QWQ>>steam.reg
echo [HKEY_CLASSES_ROOT\CLSID\{b74436e4-f4de-43b4-9363-ac7041edc88b}]>>steam.reg
echo @="steam">>steam.reg
echo "InfoTip"="G胖的怀抱像你敞开着">>steam.reg
echo "System.ControlPanel.Category"="0,5">>steam.reg
echo [HKEY_CLASSES_ROOT\CLSID\{b74436e4-f4de-43b4-9363-ac7041edc88b}\DefaultIcon]>>steam.reg
echo @="%steam2%\Steam.exe">>steam.reg
echo ;By.QWQ>>steam.reg
echo [HKEY_CLASSES_ROOT\CLSID\{b74436e4-f4de-43b4-9363-ac7041edc88b}\Shell\Open\command]>>steam.reg
echo @="%steam2%\Steam.exe">>steam.reg
regedit /s steam.reg
del steam.reg
cls
echo set WshShell = WScript.CreateObject("WScript.Shell")>shutdown.vbs
echo WshShell.run "shutdown -r -t 0">>shutdown.vbs
echo Set WshShell = Nothing>>shutdown.vbs
echo.
echo 第三步：完成
echo.
echo ==================================================================================================
echo.
echo 经过三步的操作，安装已经完成
echo.
echo 请记住，在主菜单（也就是第一个页面）按3以卸载此功能
echo.
echo 10秒后将自动重启，您可以关闭窗口阻止重启。
echo.
for /L %%a in ( 
10,-1,0 
) do ( 
cls
echo.
echo 第三步：完成
echo.
echo ==================================================================================================
echo.
echo 经过三步的操作，安装已经完成
echo.
echo 请记住，在主菜单（也就是第一个页面）按3以卸载此功能
echo.
echo.
echo %%a秒后将自动重启，您可以关闭窗口阻止重启。 
echo.
ping -n 2 localhost 1>nul 2>nul 
)
wscript.exe shutdown.vbs
del shutdown.vbs

:Vista_start
cls
title 向控制面板添加steam快捷方式 By.QWQ（Windows Vista_3/4）
echo.
echo 第一步：导入steam路径
echo.
echo ==================================================================================================
echo.
echo  开始操作
echo.
set /p steam1=请输入steam根目录路径(G:\steam\steam.exe，请填写G:\steam)：
set steam2=%steam1:\=\\%
cls
echo 第二步：生成注册表文件
echo.
echo ==================================================================================================
echo.
echo Windows Registry Editor Version 5.00>steam.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel\NameSpace\{b74436e4-f4de-43b4-9363-ac7041edc88b}]>>steam.reg
echo @="特别定制功能">>steam.reg
echo ;By.QWQ>>steam.reg
echo [HKEY_CLASSES_ROOT\CLSID\{b74436e4-f4de-43b4-9363-ac7041edc88b}]>>steam.reg
echo @="steam">>steam.reg
echo "InfoTip"="G胖的怀抱像你敞开着">>steam.reg
echo "System.ControlPanel.Category"="0,5,7,8">>steam.reg
echo [HKEY_CLASSES_ROOT\CLSID\{b74436e4-f4de-43b4-9363-ac7041edc88b}\DefaultIcon]>>steam.reg
echo @="%steam2%\Steam.exe">>steam.reg
echo ;By.QWQ>>steam.reg
echo [HKEY_CLASSES_ROOT\CLSID\{b74436e4-f4de-43b4-9363-ac7041edc88b}\Shell\Open\command]>>steam.reg
echo @="%steam2%\Steam.exe">>steam.reg
regedit /s steam.reg
del steam.reg
cls
echo set WshShell = WScript.CreateObject("WScript.Shell")>shutdown.vbs
echo WshShell.run "shutdown -r -t 0">>shutdown.vbs
echo Set WshShell = Nothing>>shutdown.vbs
echo.
echo 第三步：完成
echo.
echo ==================================================================================================
echo.
echo 经过三步的操作，安装已经完成
echo.
echo 请记住，在主菜单（也就是第一个页面）按3以卸载此功能
echo.
echo 10秒后将自动重启，您可以关闭窗口阻止重启。
echo.
for /L %%a in ( 
10,-1,0 
) do ( 
cls
echo.
echo 第三步：完成
echo.
echo ==================================================================================================
echo.
echo 经过三步的操作，安装已经完成
echo.
echo 请记住，在主菜单（也就是第一个页面）按3以卸载此功能
echo.
echo.
echo %%a秒后将自动重启，您可以关闭窗口阻止重启。 
echo.
ping -n 2 localhost 1>nul 2>nul 
)
wscript.exe shutdown.vbs
del shutdown.vbs

:7_start
cls
title 向控制面板添加steam快捷方式 By.QWQ（Windows 7_3/4）
echo.
echo 第一步：导入steam路径
echo.
echo ==================================================================================================
echo.
echo  开始操作
echo.
set /p steam1=请输入steam根目录路径(G:\steam\steam.exe，请填写G:\steam)：
set steam2=%steam1:\=\\%
cls
echo 第二步：生成注册表文件并安装
echo.
echo ==================================================================================================
echo.
echo Windows Registry Editor Version 5.00>steam.reg
echo.>>steam.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel\NameSpace\{b74436e4-f4de-43b4-9363-ac7041edc88b}]>>steam.reg
echo @="特别定制功能">>steam.reg
echo ;By.QWQ>>steam.reg
echo.>>steam.reg
echo [HKEY_CLASSES_ROOT\CLSID\{b74436e4-f4de-43b4-9363-ac7041edc88b}]>>steam.reg
echo @="steam">>steam.reg
echo "InfoTip"="G胖的怀抱向你敞开着">>steam.reg
echo "System.ControlPanel.Category"="0">>steam.reg
echo.>>steam.reg
echo [HKEY_CLASSES_ROOT\CLSID\{b74436e4-f4de-43b4-9363-ac7041edc88b}\DefaultIcon]>>steam.reg
echo @="%steam2%\\Steam.exe">>steam.reg
echo ;By.QWQ>>steam.reg
echo.>>steam.reg
echo [HKEY_CLASSES_ROOT\CLSID\{b74436e4-f4de-43b4-9363-ac7041edc88b}\Shell\Open\command]>>steam.reg
echo @="%steam2%\\Steam.exe">>steam.reg
regedit /s steam.reg
del steam.reg
cls
echo set WshShell = WScript.CreateObject("WScript.Shell")>shutdown.vbs
echo WshShell.run "shutdown -r -t 0">>shutdown.vbs
echo Set WshShell = Nothing>>shutdown.vbs
echo.
echo 第三步：完成
echo.
echo ==================================================================================================
echo.
echo 经过三步的操作，安装已经完成
echo.
echo 请记住，在主菜单（也就是第一个页面）按3以卸载此功能
echo.
echo 10秒后将自动重启，您可以关闭窗口阻止重启。
echo.
for /L %%a in ( 
10,-1,0 
) do ( 
cls
echo.
echo 第三步：完成
echo.
echo ==================================================================================================
echo.
echo 经过三步的操作，安装已经完成
echo.
echo 请记住，在主菜单（也就是第一个页面）按3以卸载此功能
echo.
echo.
echo %%a秒后将自动重启，您可以关闭窗口阻止重启。 
echo.
ping -n 2 localhost 1>nul 2>nul 
)
wscript.exe shutdown.vbs
del shutdown.vbs

:del
cls
title 卸载程序 By.QWQ
echo.
echo.
echo.
echo ==================================================================================================
echo.
echo 您正在尝试卸载控制面板的steam选项卡，请确认是否继续？
echo.
echo  【1】继续
echo.
echo  【2】取消
echo.
echo ==================================================================================================
echo.
choice /c 1234 /n /m "请选择"
if "%errorlevel%"=="1" goto del_1
if "%errorlevel%"=="2" goto Admin

:del_1
echo.
echo  steam卸载程序【手动滑稽】
echo.
echo ==================================================================================================
echo.
ceho  开始操作（你可能什么都看不到，正常情况你可能这句话都看不到）
echo Windows Registry Editor Version 5.00>del_steam.reg
echo [-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel\NameSpace\{86506789-0817-40bd-9161-9b68d19b01c0}]>>del_steam.reg
echo [-HKEY_CLASSES_ROOT\CLSID\{86506789-0817-40bd-9161-9b68d19b01c0}]>>del_steam.reg
regedit /s del_steam.reg
del del_steam.reg
cls
echo set WshShell = WScript.CreateObject("WScript.Shell")>shutdown.vbs
echo WshShell.run "shutdown -r -t 0">>shutdown.vbs
echo Set WshShell = Nothing>>shutdown.vbs
echo.
echo 卸载完成
echo.
echo ==================================================================================================
echo.
echo 10秒后将自动重启，您可以关闭窗口阻止重启。
echo.
for /L %%a in ( 
10,-1,0 
) do ( 
cls
echo.
echo 卸载完成
echo.
echo ==================================================================================================
echo.
echo 10秒后将自动重启，您可以关闭窗口阻止重启。
echo.
ping -n 2 localhost 1>nul 2>nul 
)
wscript.exe shutdown.vbs
del shutdown.vbs

:help
cls
title 关于 By.QWQ
ver
echo.
echo ==================================================================================================
echo.
echo.                                             关于
echo.
echo  本工具为@QWQ基于网络教程制作
echo.
echo  通过修改注册表的形式达到显示目的
echo.
echo  转载请保留这里的名字，谢谢
echo.
echo 【1】回到主页
echo.
echo 【2】支持文档
echo.
echo ==================================================================================================
echo.
choice /c 12 /n /m "请选择"
if "%errorlevel%"=="1" goto Admin
if "%errorlevel%"=="2" goto Support

:Support
cls
title 支持 By.QWQ
ver
echo.
echo ==================================================================================================
echo.
echo.                                             支持
echo.
echo  原理：
echo.
echo  在以下位置添加注册表子项{b74436e4-f4de-43b4-9363-ac7041edc88b}：
echo.
echo  【A】HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel\NameSpace
echo.
echo  【B】HKEY_CLASSES_ROOT\CLSID
echo.
echo  在【B】的位置中添加信息：
echo.
echo  默认值为名字，
echo.
echo  InfoTip为鼠标悬浮文字
echo.
echo  System.ControlPanel.Category为在控制面板哪些地方显示
echo.
echo 在【B】的位置中新建子项"DefaultIcon"和"Shell\Open\command"
echo.
echo  这是图标和启动命令（即应用所在文件夹)
echo.
echo 【1】回到主页
echo.
echo 【2】退出
echo.
echo ==================================================================================================
echo.
choice /c 12 /n /m "请选择"
if "%errorlevel%"=="1" goto Admin
if "%errorlevel%"=="2" exit