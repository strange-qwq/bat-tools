@echo off

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
ver
echo=
echo. ==================================================================================================
echo.
echo.                                             FBI WARNING !
echo.
echo.                                                警告！
echo.
echo. 如有360、电脑管家等安全软件提醒，请勾选信任允许和不再提醒！
echo.
echo. 本工具仅Windows 7及以上可用，Windows XP请参考文档2
echo.
echo. 此工具仅适用于Windows更新卡在初始化阶段的修复（可能对其它更新错误也有用）
echo.
echo. 执行此工具 ，您的update服务将被重置！
echo.
echo. 此工具基于Microsoft的Windows 支持文档制作
echo.
echo. 文档1：https://answers.microsoft.com/zh-hans/insider/forum/insider_wintp-insider_install/win10%E7%B3%BB%E7%BB%9F%E6%9B%B4%E6%96%B0%E4%B8%80/a9303d48-2246-48ec-b809-2e6aa2d16e17?auth=1
echo.
echo. 文档2：https://support.microsoft.com/zh-cn/help/971058/how-do-i-reset-windows-update-components
echo.
echo. ==================================================================================================
echo.
echo. 按任意键继续
pause >nul
CLS
title 重置说明 （2/4）
echo. ==================================================================================================
echo.
echo.                                            重置说明
echo. 
echo. 重置前请尝试普通修复工具【1】
echo.
echo. 如果普通修复无效再尝试深度修复工具【2】
echo.
echo. 此工具基于Microsoft的Windows 支持文档制作
echo.
echo. 文档1：https://answers.microsoft.com/zh-hans/insider/forum/insider_wintp-insider_install/win10%E7%B3%BB%E7%BB%9F%E6%9B%B4%E6%96%B0%E4%B8%80/a9303d48-2246-48ec-b809-2e6aa2d16e17?auth=1
echo.
echo. 文档2：https://support.microsoft.com/zh-cn/help/971058/how-do-i-reset-windows-update-components
echo.
echo. ==================================================================================================
echo.
set /p ID=请输入选择项目的序号：
if "%id%"=="1" goto 普通修复工具
if "%id%"=="2" goto 深度修复工具
IF "%id%"=="3" exit

:普通修复工具
title 普通修复工具（3/4）
CLS
echo. ==================================================================================================
echo.
echo.                                            使用说明
echo. 
echo. 此阶段仅提供删除更新缓存操作
echo.
echo. 修复完成后会自动重启Windows（如果没有请手动重启），请注意保存自己的工作
echo.
echo. 重启后请尝试重新更新，失败则多试几次，如若还是不行，请尝试重新运行本工具并进入深度修复阶段
echo. 
echo. ==================================================================================================
echo.
echo. 按任意键继续
pause >nul
CLS
title 普通修复工具（4/4）
echo. ==================================================================================================
echo.
echo.                                            开始修复
echo. 
net stop wuauserv
net stop BITS
del /s /f /q C:\Windows\SoftwareDistribution\DataStore
del /s /f /q C:\Windows\SoftwareDistribution\Download
net start wuauserv
net start BITS
shutdown -r -t 60
mshta vbscript:msgbox("普通已修复完成，windows将在60秒后重启，请注意保存自己的工作哦！",64,"tips")(window.close)
cmd /k

:深度修复工具
title 深度修复工具（3/4）
CLS
echo. ==================================================================================================
echo.
echo.                                            使用说明
echo. 
echo. 此阶段将完全重置update组件
echo.
echo. 修复完成后会自动重启Windows（如果没有请手动重启），请注意保存自己的工作
echo.
echo. 重启后请尝试重新更新，失败则多试几次，如若还是不行，请尝试访问文档2
echo. 
echo. ==================================================================================================
echo.
echo. 按任意键继续
pause >nul
CLS
title 深度修复工具（4/4）
echo. ==================================================================================================
echo.
echo.                                            开始修复
echo. 
net stop bits
net stop wuauserv
net stop server
net stop cryptsvc
Del "%ALLUSERSPROFILE%\Application Data\Microsoft\Network\Downloader\qmgr*.dat"
cd /d %windir%\system32
regsvr32.exe atl.dll
regsvr32.exe urlmon.dll
regsvr32.exe mshtml.dll
regsvr32.exe shdocvw.dll
regsvr32.exe browseui.dll
regsvr32.exe jscript.dll
regsvr32.exe vbscript.dll
regsvr32.exe scrrun.dll
regsvr32.exe msxml.dll
regsvr32.exe msxml3.dll
regsvr32.exe msxml6.dll
regsvr32.exe actxprxy.dll
regsvr32.exe softpub.dll
regsvr32.exe wintrust.dll
regsvr32.exe dssenh.dll
regsvr32.exe rsaenh.dll
regsvr32.exe gpkcsp.dll
regsvr32.exe sccbase.dll
regsvr32.exe slbcsp.dll
regsvr32.exe cryptdlg.dll
regsvr32.exe oleaut32.dll
regsvr32.exe ole32.dll
regsvr32.exe shell32.dll
regsvr32.exe initpki.dll
regsvr32.exe wuapi.dll
regsvr32.exe wuaueng.dll
regsvr32.exe wuaueng1.dll
regsvr32.exe wucltui.dll
regsvr32.exe wups.dll
regsvr32.exe wups2.dll
regsvr32.exe wuweb.dll
regsvr32.exe qmgr.dll
regsvr32.exe qmgrprxy.dll
regsvr32.exe wucltux.dll
regsvr32.exe muweb.dll
regsvr32.exe wuwebv.dll
netsh winsock reset
netsh winhttp reset proxy
net start bits
net start wuauserv
net start appidsvc
net start cryptsvc
echo. ==================================================================================================
echo.
echo.                                            重置完成
echo. 
echo. 修复成功输入【1】，保存工作并重启
echo.
echo. 修复失败输入【2】，尝试模式2继续修复
echo.
echo. 稍后手动重启输入【3】
echo.
echo. ==================================================================================================
echo.
set /p ID=请选择：
if "%id%"=="1" goto 重启
if "%id%"=="2" goto 模式2
IF "%id%"=="3" exit

:模式2
CLS
title 深度修复工具（5/5）
echo. ==================================================================================================
echo.
echo.                                            开始模式2修复阶段
echo. 
Ren %systemroot%\SoftwareDistribution SoftwareDistribution.bak
Ren %systemroot%\system32\catroot2 catroot2.bak
sc.exe sdset bits D:(A;;CCLCSWRPWPDTLOCRRC;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;BA)(A;;CCLCSWLOCRRC;;;AU)(A;;CCLCSWRPWPDTLOCRRC;;;PU)
sc.exe sdset wuauserv D:(A;;CCLCSWRPWPDTLOCRRC;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;BA)(A;;CCLCSWLOCRRC;;;AU)(A;;CCLCSWRPWPDTLOCRRC;;;PU)
echo. ==================================================================================================
echo.
echo.                                            修复完成
echo. 
echo. 修复成功输入【1】，保存工作并重启
echo.
echo. 修复失败输入【2】，尝试依照文档2手动执行
echo.
echo. 稍后手动重启输入【3】
echo.
echo. ==================================================================================================
echo.
set /p ID=请选择：
if "%id%"=="1" goto 重启
if "%id%"=="2" goto 教程
IF "%id%"=="3" exit

:重启
shutdown -r -t 60
mshta vbscript:msgbox("深度修复已完成，windows将在60秒后重启，请注意保存自己的工作哦！",64,"tips")(window.close)
exit

:教程
echo. ==================================================================================================
echo.
echo.                                            正在打开网页
echo. 
echo. 请检查浏览器是否已经打开
echo.
echo. 未打开请尝试手动访问：
echo.https://support.microsoft.com/zh-cn/help/971058/how-do-i-reset-windows-update-components
echo.
echo. ==================================================================================================
echo.
explorer "https://support.microsoft.com/zh-cn/help/971058/how-do-i-reset-windows-update-components"
echo. 按任意键退出
pause >nul
exit