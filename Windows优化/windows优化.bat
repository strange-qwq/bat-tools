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
echo  此工具将会为您优化Windows，期间子选项运行前会有3秒间隔，您可以以随时关闭窗口终止优化
echo.
echo  本工具所有代码均来自网络，由@QWQ修改，@QWQ与@王二千共同测试通过
echo.
echo  任何因本工具或文档而导致操作失误甚至电脑出现故障的，请自行负责
echo.
echo  您同意吗？
echo.
echo  1.同意并继续
echo.
echo  2.拒绝并退出
echo.
echo  3.帮助与文档
echo.
echo  ==================================================================================================
echo.
set /p id=请选择：
if "%id%"=="1" goto systemDetection
if "%id%"=="2" exit
if "%id%"=="3" goto help
:systemDetection
cls
ver | find "5.1." > NUL &&  goto error
ver | find "5.2." > NUL &&  goto error
ver | find "6.0." > NUL &&  goto error
ver | find "6.1." > NUL &&  goto start
ver | find "6.2." > NUL &&  goto start
ver | find "6.3." > NUL &&  goto start
ver | find "10.0." > NUL &&  goto start
:error
mshta vbscript:msgbox("不是Windows 7及以上你同意也没用！"^&vbCrLf^&"(￣３￣)a ",64,"(*/ω＼*)")(window.close)
exit
:start
cls
title windows优化工具（by.QWQ）——已执行百分之1
echo  ==================================================================================================
echo.
echo                                             开始执行
echo.
echo  ===============================================
echo.
echo                  Windows基础优化
echo.
echo  3秒后执行...
echo.
ping -n 3 127.0.0.1>nul
title windows优化工具（by.QWQ）——已执行百分之2
echo  =====================
echo.
echo    开启蓝屏自动重启
echo.
wmic path win32_OSRecoveryConfiguration set AutoReboot=True
echo.
echo  执行完成！
echo.
title windows优化工具（by.QWQ）——已执行百分之4
echo  =====================
echo.
echo    设置自动内存转储
echo.
reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\CrashControl" /v CrashDumpEnabled /t REG_DWORD /d 7 /f
echo.
echo  执行完成！
echo.
title windows优化工具（by.QWQ）——已执行百分之6
echo  =====================
echo.
echo    缩短开机菜单时间
echo.
BCDEDIT /set {bootmgr} timeout 1
echo.
echo  执行完成！
echo.
title windows优化工具（by.QWQ）——已执行百分之8
echo  =====================
echo.
echo      关闭远程登录
echo.
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 1 /f
echo.
echo  执行完成！
echo.
title windows优化工具（by.QWQ）——已执行百分之10
echo  =====================
echo.
echo      关闭默认共享
echo.
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\lanmanserver\parameters" /v AutoShareServer /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa" /v restrictanonymous /t REG_DWORD /d 1 /f
net stop LanmanServer
sc config LanmanServer start= disabled
echo.
echo  执行完成！
echo.
title windows优化工具（by.QWQ）——已执行百分之12
echo  =====================
echo.
echo     显示文件后缀名
echo.
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v HideFileExt /t REG_DWORD /d 00000000 /f
echo.
echo  执行完成！
echo.
title windows优化工具（by.QWQ）——已执行百分之14
echo  =====================
echo.
echo  是否需要开启Windows动画
echo  (若电脑性能较弱则不建议开启)
echo.
echo  1、开启
echo.
echo  2、关闭
echo.
choice /c 12 /n /m "请选择"
if "%errorlevel%"=="1" goto openAnimation
if "%errorlevel%"=="2" goto closeAnimation
:openAnimation
echo.
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 1 /f
echo.
echo  已设置为最佳外观
echo.
goto PowerPlanning
:closeAnimation
echo.
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f
echo.
echo  已设置为最佳性能
echo.
goto PowerPlanning
:PowerPlanning
title windows优化工具（by.QWQ）——已执行百分之18
ver | find "6.1." > NUL &&  goto win7
ver | find "6.2." > NUL &&  goto win7
ver | find "6.3." > NUL &&  goto win7
ver | find "10.0." > NUL &&  goto win10
:win7
set "verNumber=高性能子项"
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
set "verNumber=卓越性能子项"
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
echo.
title windows优化工具（by.QWQ）——已执行百分之20
echo  ===============================================
echo.
echo                 优化电源计划
echo.
echo  3秒后执行...
ping -n 3 127.0.0.1>nul
echo.
title windows优化工具（by.QWQ）——已执行百分之22
echo  =====================
echo.
echo      开启快速启动
echo.
powercfg /h on
echo.
title windows优化工具（by.QWQ）——已执行百分之24
::echo  =====================
::echo.
::echo    设置电源按钮为关机
::echo.
powercfg -SetDcValueIndex 381b4222-f694-41f0-9685-ff5bb260df2e 4f971e89-eebd-4455-a8de-9e59040e7347 7648efa3-dd9c-4e3e-b566-50f929386280 3
powercfg -SetAcValueIndex 381b4222-f694-41f0-9685-ff5bb260df2e 4f971e89-eebd-4455-a8de-9e59040e7347 7648efa3-dd9c-4e3e-b566-50f929386280 3
echo.
title windows优化工具（by.QWQ）——已执行百分之26
::echo  =====================
::echo.
::echo    设置睡眠按钮为睡眠
::echo.
powercfg -SetDcValueIndex 381b4222-f694-41f0-9685-ff5bb260df2e 4f971e89-eebd-4455-a8de-9e59040e7347 96996bc0-ad50-47ec-923b-6f41874dd9eb 1
powercfg -SetAcValueIndex 381b4222-f694-41f0-9685-ff5bb260df2e 4f971e89-eebd-4455-a8de-9e59040e7347 96996bc0-ad50-47ec-923b-6f41874dd9eb 1
echo.
title windows优化工具（by.QWQ）——已执行百分之28
::echo  =====================
::echo.
::echo    设置关闭盖子无操作
::echo.
powercfg -SetDcValueIndex 381b4222-f694-41f0-9685-ff5bb260df2e 4f971e89-eebd-4455-a8de-9e59040e7347 5ca83367-6e45-459f-a27b-476b1d01c936 0
powercfg -SetAcValueIndex 381b4222-f694-41f0-9685-ff5bb260df2e 4f971e89-eebd-4455-a8de-9e59040e7347 5ca83367-6e45-459f-a27b-476b1d01c936 0
echo.
title windows优化工具（by.QWQ）——已执行百分之30
::echo  =====================
::echo.
::echo     设置不关闭硬盘
::echo.
powercfg -SetDcValueIndex %guid% 0012ee47-9041-4b5d-9b77-535fba8b1442 6738e2c4-e8a5-4a42-b16a-e040e769756e 0
powercfg -SetAcValueIndex %guid% 0012ee47-9041-4b5d-9b77-535fba8b1442 6738e2c4-e8a5-4a42-b16a-e040e769756e 0
echo.
title windows优化工具（by.QWQ）——已执行百分之32
::echo  =====================
::echo.
::echo  设置JavaScript 计时器频率
::echo.
powercfg -SetDcValueIndex %guid% 02f815b5-a5cf-4c84-bf20-649d1f75d3d8 4c793e7d-a264-42e1-87d3-7a0d2f523ccd 0
powercfg -SetAcValueIndex %guid% 02f815b5-a5cf-4c84-bf20-649d1f75d3d8 4c793e7d-a264-42e1-87d3-7a0d2f523ccd 1
echo.
title windows优化工具（by.QWQ）——已执行百分之34
echo  =====================
echo.
echo  使用电池时桌面不放映幻灯片
echo.
powercfg -SetDcValueIndex %guid% 0d7dbae2-4294-402a-ba8e-26777e8488cd 309dce9b-bef4-4119-9921-a851fb12f0f4 1
powercfg -SetAcValueIndex %guid% 0d7dbae2-4294-402a-ba8e-26777e8488cd 309dce9b-bef4-4119-9921-a851fb12f0f4 0
echo.
title windows优化工具（by.QWQ）——已执行百分之36
::echo  =====================
::echo.
::echo     设置无线适配器
::echo.
powercfg -SetDcValueIndex %guid% 19cbb8fa-5279-450e-9fac-8a3d5fedd0c1 12bbebe6-58d6-4636-95bb-3217ef867c1a 2
powercfg -SetAcValueIndex %guid% 19cbb8fa-5279-450e-9fac-8a3d5fedd0c1 12bbebe6-58d6-4636-95bb-3217ef867c1a 0
echo.
title windows优化工具（by.QWQ）——已执行百分之38
::echo  =====================
::echo.
::echo      设置自动睡眠
::echo.
powercfg -SetDcValueIndex %guid% 238c9fa8-0aad-41ed-83f4-97be242c8f20 29f6c1db-86da-48c5-9fdb-f2b67b1f44da 3600
powercfg -SetAcValueIndex %guid% 238c9fa8-0aad-41ed-83f4-97be242c8f20 29f6c1db-86da-48c5-9fdb-f2b67b1f44da 0
echo.
title windows优化工具（by.QWQ）——已执行百分之40
echo  =====================
echo.
echo      关闭混合睡眠
echo.
powercfg -SetDcValueIndex %guid% 238c9fa8-0aad-41ed-83f4-97be242c8f20 94ac6d29-73ce-41a6-809f-6363ba21b47e 0
powercfg -SetAcValueIndex %guid% 238c9fa8-0aad-41ed-83f4-97be242c8f20 94ac6d29-73ce-41a6-809f-6363ba21b47e 0
echo.
title windows优化工具（by.QWQ）——已执行百分之42
::echo  =====================
::echo.
::echo      设置自动休眠
::echo.
powercfg -SetDcValueIndex %guid% 238c9fa8-0aad-41ed-83f4-97be242c8f20 9d7815a6-7ee4-497e-8888-515a05f02364 7200
powercfg -SetAcValueIndex %guid% 238c9fa8-0aad-41ed-83f4-97be242c8f20 9d7815a6-7ee4-497e-8888-515a05f02364 0
echo.
title windows优化工具（by.QWQ）——已执行百分之44
echo  =====================
echo.
echo     设置唤醒定时器
echo.
powercfg -SetDcValueIndex %guid% 238c9fa8-0aad-41ed-83f4-97be242c8f20 bd3b718a-0680-4d9d-8ab2-e1d2b4ac806d 2
powercfg -SetAcValueIndex %guid% 238c9fa8-0aad-41ed-83f4-97be242c8f20 bd3b718a-0680-4d9d-8ab2-e1d2b4ac806d 1
echo.
title windows优化工具（by.QWQ）——已执行百分之46
echo  =====================
echo.
echo    关闭USB选择性暂停
echo.
powercfg -SetDcValueIndex %guid% 2a737441-1930-4402-8d77-b2bebba308a3 48e6b7a6-50f5-4782-a5d4-53bb8f07e226 1
powercfg -SetAcValueIndex %guid% 2a737441-1930-4402-8d77-b2bebba308a3 48e6b7a6-50f5-4782-a5d4-53bb8f07e226 0
echo.
title windows优化工具（by.QWQ）——已执行百分之48
echo  =====================
echo.
echo  设置Intel(R) Graphics Power Plan
echo  (Tips:如果你不是英特尔cpu或者不支持此功能则可能会报错)
echo.
powercfg -SetDcValueIndex %guid% 44f3beca-a7c0-460e-9df2-bb8b99e0cba6 3619c3f2-afb2-4afc-b0e9-e7fef372de36 0
powercfg -SetAcValueIndex %guid% 44f3beca-a7c0-460e-9df2-bb8b99e0cba6 3619c3f2-afb2-4afc-b0e9-e7fef372de36 2
echo.
title windows优化工具（by.QWQ）——已执行百分之50
echo  =====================
echo.
echo    链接状态电源管理
echo.
powercfg -SetDcValueIndex %guid% 501a4d13-42af-4429-9fd1-a8218c268e20 ee12f906-d277-404b-b6da-e5fa1a576df5 1
powercfg -SetAcValueIndex %guid% 501a4d13-42af-4429-9fd1-a8218c268e20 ee12f906-d277-404b-b6da-e5fa1a576df5 0
echo.
title windows优化工具（by.QWQ）——已执行百分之52
echo  =====================
echo.
echo     最小处理器状态
echo.
powercfg -SetDcValueIndex %guid% 54533251-82be-4824-96c1-47b60b740d00 893dee8e-2bef-41e0-89c6-b55d0929964c 15
powercfg -SetAcValueIndex %guid% 54533251-82be-4824-96c1-47b60b740d00 893dee8e-2bef-41e0-89c6-b55d0929964c 20
echo.
title windows优化工具（by.QWQ）——已执行百分之54
echo  =====================
echo.
echo      系统散热方式
echo.
powercfg -SetDcValueIndex %guid% 54533251-82be-4824-96c1-47b60b740d00 94d3a615-a899-4ac5-ae2b-e4d8f634367f 1
powercfg -SetAcValueIndex %guid% 54533251-82be-4824-96c1-47b60b740d00 94d3a615-a899-4ac5-ae2b-e4d8f634367f 1
echo.
title windows优化工具（by.QWQ）——已执行百分之56
echo  =====================
echo.
echo     最大处理器状态
echo.
powercfg -SetDcValueIndex %guid% 54533251-82be-4824-96c1-47b60b740d00 bc5038f7-23e0-4960-96da-33abaf5935ec 99
powercfg -SetAcValueIndex %guid% 54533251-82be-4824-96c1-47b60b740d00 bc5038f7-23e0-4960-96da-33abaf5935ec 100
echo.
title windows优化工具（by.QWQ）——已执行百分之58
echo  =====================
echo.
echo     自动关闭显示器
echo.
powercfg -SetDcValueIndex %guid% 7516b95f-f776-4464-8c53-06167f40cc99 3c0bc021-c8a8-4e07-a973-6b14cbcb2b7e 3600
powercfg -SetAcValueIndex %guid% 7516b95f-f776-4464-8c53-06167f40cc99 3c0bc021-c8a8-4e07-a973-6b14cbcb2b7e 0
echo.
title windows优化工具（by.QWQ）——已执行百分之60
echo  =====================
echo.
echo       显示器亮度
echo.
powercfg -SetDcValueIndex %guid% 7516b95f-f776-4464-8c53-06167f40cc99 aded5e82-b909-4619-9949-f5d71dac0bcb 25
powercfg -SetAcValueIndex %guid% 7516b95f-f776-4464-8c53-06167f40cc99 aded5e82-b909-4619-9949-f5d71dac0bcb 50
echo.
title windows优化工具（by.QWQ）——已执行百分之62
echo  =====================
echo.
echo    显示器断电亮度变暗
echo.
powercfg -SetDcValueIndex %guid% 7516b95f-f776-4464-8c53-06167f40cc99 f1fbfde2-a960-4165-9f88-50667911ce96 25
powercfg -SetAcValueIndex %guid% 7516b95f-f776-4464-8c53-06167f40cc99 f1fbfde2-a960-4165-9f88-50667911ce96 50
echo.
title windows优化工具（by.QWQ）——已执行百分之64
::echo  =====================
::echo.
::echo     关闭自适应亮度
::echo.
powercfg -SetDcValueIndex %guid% 7516b95f-f776-4464-8c53-06167f40cc99 fbd9aa66-9553-4097-ba44-ed6e9d65eab8 0
powercfg -SetAcValueIndex %guid% 7516b95f-f776-4464-8c53-06167f40cc99 fbd9aa66-9553-4097-ba44-ed6e9d65eab8 0
echo.
title windows优化工具（by.QWQ）——已执行百分之66
::echo  =====================
::echo.
::echo     视频播放质量补偿
::echo.
powercfg -SetDcValueIndex %guid% 9596fb26-9850-41fd-ac3e-f7c3c00afd4b 10778347-1370-4ee0-8bbd-33bdacaade49 1
powercfg -SetAcValueIndex %guid% 9596fb26-9850-41fd-ac3e-f7c3c00afd4b 10778347-1370-4ee0-8bbd-33bdacaade49 1
echo.
title windows优化工具（by.QWQ）——已执行百分之68
::echo  =====================
::echo.
::echo  播放视频时优化视频质量
::echo.
powercfg -SetDcValueIndex %guid% 9596fb26-9850-41fd-ac3e-f7c3c00afd4b 34c7b99f-9a6d-4b3c-8dc7-b6693b78cef4 1
powercfg -SetAcValueIndex %guid% 9596fb26-9850-41fd-ac3e-f7c3c00afd4b 34c7b99f-9a6d-4b3c-8dc7-b6693b78cef4 0
echo.
title windows优化工具（by.QWQ）——已执行百分之70
::echo  =====================
::echo.
::echo      低电池电量通知
::echo.
powercfg -SetDcValueIndex %guid% e73a048d-bf27-4f12-9731-8b2076e8891f 5dbb7c9f-38e9-40d2-9749-4f8a0e9f640f 1
powercfg -SetAcValueIndex %guid% e73a048d-bf27-4f12-9731-8b2076e8891f 5dbb7c9f-38e9-40d2-9749-4f8a0e9f640f 1
echo.
title windows优化工具（by.QWQ）——已执行百分之72
echo  =====================
echo.
echo     关键级别电池操作
echo.
powercfg -SetDcValueIndex %guid% e73a048d-bf27-4f12-9731-8b2076e8891f 637ea02f-bbcb-4015-8e2c-a1c7b9c0b546 2
powercfg -SetAcValueIndex %guid% e73a048d-bf27-4f12-9731-8b2076e8891f 637ea02f-bbcb-4015-8e2c-a1c7b9c0b546 2
echo.
title windows优化工具（by.QWQ）——已执行百分之74
echo  =====================
echo.
echo     电池电量水平低
echo.
powercfg -SetDcValueIndex %guid% e73a048d-bf27-4f12-9731-8b2076e8891f 8183ba9a-e910-48da-8769-14ae6dc1170a 10
powercfg -SetAcValueIndex %guid% e73a048d-bf27-4f12-9731-8b2076e8891f 8183ba9a-e910-48da-8769-14ae6dc1170a 10
echo.
title windows优化工具（by.QWQ）——已执行百分之76
echo  =====================
echo.
echo    关键电池电量水平
echo.
powercfg -SetDcValueIndex %guid% e73a048d-bf27-4f12-9731-8b2076e8891f 9a66d8d7-4ff7-4ef9-b5a2-5a326ca2a469 5
powercfg -SetAcValueIndex %guid% e73a048d-bf27-4f12-9731-8b2076e8891f 9a66d8d7-4ff7-4ef9-b5a2-5a326ca2a469 5
echo.
title windows优化工具（by.QWQ）——已执行百分之78
::echo  =====================
::echo.
::echo       低电量通知
::echo.
powercfg -SetDcValueIndex %guid% e73a048d-bf27-4f12-9731-8b2076e8891f bcded951-187b-4d05-bccc-f7e51960c258 1
powercfg -SetAcValueIndex %guid% e73a048d-bf27-4f12-9731-8b2076e8891f bcded951-187b-4d05-bccc-f7e51960c258 1
echo.
title windows优化工具（by.QWQ）——已执行百分之80
echo  =====================
echo.
echo       低电量操作
echo.
powercfg -SetDcValueIndex %guid% e73a048d-bf27-4f12-9731-8b2076e8891f d8742dcb-3e6a-4b3c-b3fe-374623cdcf06 0
powercfg -SetAcValueIndex %guid% e73a048d-bf27-4f12-9731-8b2076e8891f d8742dcb-3e6a-4b3c-b3fe-374623cdcf06 0
echo.
title windows优化工具（by.QWQ）——已执行百分之84
::echo  =====================
::echo.
::echo      保留电池电量
::echo.
powercfg -SetDcValueIndex %guid% e73a048d-bf27-4f12-9731-8b2076e8891f f3c5027d-cd16-4930-aa6b-90db844a8f00 7
powercfg -SetAcValueIndex %guid% e73a048d-bf27-4f12-9731-8b2076e8891f f3c5027d-cd16-4930-aa6b-90db844a8f00 7
echo.
echo  执行完成！
echo.
title windows优化工具（by.QWQ）——已执行百分之88
echo  ===============================================
echo.
echo              Windows自带服务优化
echo.
echo  3秒后执行...
ping -n 3 127.0.0.1>nul
echo.
title windows优化工具（by.QWQ）——已执行百分之92
echo  =====================
echo.
echo   禁用自动检索和诊断
echo.
net stop DiagTrack
sc config DiagTrack start= disabled
net stop diagsvc
sc config diagsvc start= disabled
net stop DPS
sc config DPS start= disabled
net stop WdiServiceHost
sc config WdiServiceHost start= disabled
net stop WdiSystemHost
sc config WdiSystemHost start= disabled
net stop WerSvc
sc config WerSvc start= demand
echo.
echo  执行完成！
echo.
title windows优化工具（by.QWQ）——已执行百分之96
echo  =====================
echo.
echo     禁用Windows索引
echo.
net stop WSearch
sc config WSearch start= disabled
echo.
echo  执行完成！
echo.
title windows优化工具（by.QWQ）——已执行百分之99
echo  =====================
echo.
echo      禁用自动播放
echo.
net stop ShellHWDetection
sc config ShellHWDetection start= disabled
echo.
echo  执行完成！
echo.
title windows优化工具（by.QWQ）——已执行百分之100
ping -n 3 127.0.0.1>nul
mshta vbscript:msgbox("完成啦！",64,"Done")(window.close)
title windows优化工具（by.QWQ）——已完成！
echo.
echo  按任意键退出
pause >nul
exit

:help
cls
title windows优化工具——帮助与文档
echo.
echo  ==================================================================================================
echo.
echo  本工具由@QWQ（QQ：1456158721）基于网络教程制作
echo.
echo  版本号：1.0.0
echo.
echo  1.【优化内容】
echo.
echo  2.【部分说明】
echo.
echo  3.【返回菜单】
echo.
echo  4.【退出工具】
echo.
echo  ==================================================================================================
echo.
choice /c 1234 /n /m "请选择"
if "%errorlevel%"=="1" goto helpOne
if "%errorlevel%"=="2" goto helpTwo
if "%errorlevel%"=="3" goto Admin
if "%errorlevel%"=="4" exit
:helpOne
cls
title windows优化工具——优化内容
ver | find "6.1." > NUL &&  goto helpOnewin7
ver | find "6.2." > NUL &&  goto helpOnewin7
ver | find "6.3." > NUL &&  goto helpOnewin7
ver | find "10.0." > NUL &&  goto helpOnewin10
:helpOnewin7
set "helpVerNumber=高性能"
goto helpNext
:helpOnewin10
set "helpVerNumber=卓越性能"
goto helpNext
:helpNext
::如果你用非记事本的软件看到这儿，我要说一句:[]
::这个格式我之所以排成这样是因为记事本有毒:(
::下面也是这样XD
(
echo.
echo +----------------------+
echo +                               +
echo +        优化内容        +
echo +                               +
echo +----------------------+
echo.
echo 警告：
echo 1、默认值有X种——
echo “开启”表示勾选选框
echo “关闭”表示不勾选选框
echo “不存在”表示原本不存在此内容
echo “隐藏”表示系统自带但选项被隐藏
echo “xx 或 xx”表示可以由用户选择内容
echo 其余内容一般为设置的选项，若有特殊内容，请看标题后注释
echo 2、任何因本文档而导致操作失误甚至电脑出现故障的，请自行负责
echo.
echo ——蓝屏自动重启
echo 默认值：关闭
echo 设定值：开启
echo 位置：控制面板\所有控制面板项\系统\高级系统设置\高级\启动和故障恢复设置
echo.
echo ——内存转储
echo 默认值：小内存转储(256 KB)
echo 设定值：自动内存转储
echo 位置：控制面板\所有控制面板项\系统\高级系统设置\高级\启动和故障恢复设置
echo.
echo ——开机显示操作系统列表的时间(单位：秒)
echo 默认值：30
echo 设定值：1
echo 位置：控制面板\所有控制面板项\系统\高级系统设置\高级\启动和故障恢复设置
echo.
echo ——系统远程登录
echo 默认值：允许远程连接到此计算机
echo 设定值：不允许远程连接到此计算机
echo 位置：控制面板\所有控制面板项\系统\高级系统设置\远程
echo.
echo ——系统默认共享(数字表示注册项内容)
echo 默认值1：1
echo 默认值2：不存在
echo 设定值1：0
echo 设定值2：1
echo 位置1：注册表\HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\lanmanserver\parameters\AutoShareServer(REG_DWORD)
echo 位置2：注册表\HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa\restrictanonymous(REG_DWORD)
echo.
echo ——文件后缀名
echo 默认值：开启
echo 设定值：关闭
echo 位置：控制面板\所有控制面板项\文件资源管理器选项\查看\隐藏已知文件类型的扩展名
echo.
echo ——系统动画
echo 默认值：让 Windows 选择计算机的最佳设置
echo 设定值：调整为最佳外观 或 调整为最佳性能
echo 位置：控制面板\所有控制面板项\系统\高级系统设置\高级\性能设置\视觉效果
echo.
echo ——创建%helpVerNumber%电源计划
echo 默认值：隐藏或不存在
echo 设定值：创建并选中
echo 位置：控制面板\所有控制面板项\电源选项
echo.
echo ——%verNumber%——桌面放映幻灯片
echo 默认值：可用
echo 设定值：使用电池电池——暂停
echo 位置：控制面板\所有控制面板项\电源选项\编辑计划设置\更改高级电源设置\桌面背景设置\放映幻灯片
echo.
echo ——%verNumber%——混合睡眠
echo 默认值：开启
echo 设定值：关闭
echo 位置：控制面板\所有控制面板项\电源选项\编辑计划设置\更改高级电源设置\睡眠\允许混合睡眠
echo.
echo ——%verNumber%——唤醒定时器
echo 默认值：使用电池——禁用，接通电源——仅限重要的唤醒定时器
echo 设定值：使用电池——仅限重要的唤醒定时器，接通电源——启用
echo 位置：控制面板\所有控制面板项\电源选项\编辑计划设置\更改高级电源设置\睡眠\允许使用唤醒定时器
echo.
echo ——%verNumber%——USB选择性暂停
echo 默认值：已启用
echo 设定值：使用电池——已启用，接通电源——已禁用
echo 位置：控制面板\所有控制面板项\电源选项\编辑计划设置\更改高级电源设置\USB设置\USB选择性暂停设置
echo.
echo ——%verNumber%——Intel(R) Graphics Power Plan
echo  (Tips:如果你不是英特尔cpu或者不支持此功能则可能会报错)
echo 默认值：使用电池——Maximum Battery Life，接通电源——Maximum Performance
echo 设定值：使用电池——Balanced，接通电源——Maximum Performance
echo 位置：控制面板\所有控制面板项\电源选项\编辑计划设置\更改高级电源设置\Intel(R) Graphics Settings\Intel(R) Graphics Power Plan
echo.
echo ——%verNumber%——链接状态电源管理
echo 默认值：使用电池——最大电源节省量，接通电源——关闭
echo 设定值：使用电池——中等电源节省量，接通电源——关闭
echo 位置：控制面板\所有控制面板项\电源选项\编辑计划设置\更改高级电源设置\PCI Express\链接状态电源管理
echo.
echo ——%verNumber%——最小处理器状态
echo 默认值：20%
echo 设定值：使用电池——百分之10，接通电源——百分之15
echo 位置：控制面板\所有控制面板项\电源选项\编辑计划设置\更改高级电源设置\处理器电源管理\最小处理器状态
echo.
echo ——%verNumber%——系统散热方式
echo 默认值：使用电池——被动，接通电源——主动
echo 设定值：主动
echo 位置：控制面板\所有控制面板项\电源选项\编辑计划设置\更改高级电源设置\处理器电源管理\系统散热方式
echo.
echo ——%verNumber%——最大处理器状态
echo 默认值：百分之100
echo 设定值：使用电池——百分之99，接通电源——百分之100
echo 位置：控制面板\所有控制面板项\电源选项\编辑计划设置\更改高级电源设置\处理器电源管理\最大处理器状态
echo.
echo ——%verNumber%——自动关闭显示器
echo 默认值：百分之15
echo 设定值：使用电池——60分钟，接通电源——从不
echo 位置：控制面板\所有控制面板项\电源选项\编辑计划设置\更改高级电源设置\显示\在此时间后关闭显示
echo.
echo ——%verNumber%——显示器亮度
echo 默认值：未知
echo 设定值：百分之50
echo 位置：控制面板\所有控制面板项\电源选项\编辑计划设置\更改高级电源设置\显示
echo.
echo ——%verNumber%——显示器断电亮度变暗
echo 默认值：未知
echo 设定值：百分之25
echo 位置：控制面板\所有控制面板项\电源选项\编辑计划设置\更改高级电源设置\显示
echo.
echo ——%verNumber%——关键级别电池操作
echo 默认值：关机
echo 设定值：休眠
echo 位置：控制面板\所有控制面板项\电源选项\编辑计划设置\更改高级电源设置\电池\关键级别电池操作
echo.
echo ——%verNumber%——电池电量水平低
echo 默认值：百分之20
echo 设定值：百分之10
echo 位置：控制面板\所有控制面板项\电源选项\编辑计划设置\更改高级电源设置\电池\电池电量水平低
echo.
echo ——%verNumber%——关键电池电量水平
echo 默认值：百分之10
echo 设定值：百分之5
echo 位置：控制面板\所有控制面板项\电源选项\编辑计划设置\更改高级电源设置\电池\关键电池电量水平
echo.
echo ——%verNumber%——低电量操作
echo 默认值：睡眠
echo 设定值：不采取任何操作
echo 位置：控制面板\所有控制面板项\电源选项\编辑计划设置\更改高级电源设置\电池\低电量操作
echo.
echo ——禁用自动检索和诊断
echo 默认值1：Win 10 Th2之后的版本:Connected User Experiences and Telemetry(DiagTrack)——自动
echo 默认值1：Win 10 Th2之前的版本:Diagnostics Tracking Service(DiagTrack)——自动
echo 默认值2：Diagnostic Execution Service(diagsvc)——自动
echo 默认值3：Diagnostic Policy Service(DPS)——自动
echo 默认值4：Diagnostic Service Host(WdiServiceHost)——自动
echo 默认值5：Diagnostic System Host(WdiSystemHost)——自动
echo 默认值6：Windows Error Reporting Service(WerSvc)——自动
echo 设定值：禁用
echo 位置：运行——服务(services.msc)
echo.
echo ——禁用Windows索引
echo 默认值：Windows Search(WSearch)——自动
echo 设定值：禁用
echo 位置：运行——服务(services.msc)
echo.
echo ——禁用自动播放
echo 默认值：Shell Hardware Detection(ShellHWDetection)——自动
echo 设定值：禁用
echo 位置：运行——服务(services.msc)
)>%userprofile%\Desktop\优化内容.txt
start "" %userprofile%\Desktop\优化内容.txt
echo  ==================================================================================================
echo.
echo  已尝试将优化内容文件放至桌面并自动打开
echo.
echo  若未自动打开请尝试手动开启
echo.
echo  1.【帮助菜单】
echo.
echo  2.【主页菜单】
echo.
echo  3.【退出工具】
echo.
echo  ==================================================================================================
echo.
choice /c 123 /n /m "请选择"
if "%errorlevel%"=="1" goto help
if "%errorlevel%"=="2" goto Admin
if "%errorlevel%"=="3" exit
:helpTwo
cls
title title windows优化工具——部分优化说明
(
echo.
echo +----------------------+
echo +                               +
echo +     部分优化说明       +
echo +                               +
echo +----------------------+
echo.
echo Q:电源计划中的唤醒定时器是什么？
echo A:指定是否允许定时事件将计算机从睡眠状态唤醒
echo 	(比如你设置了自动更新、自动备份之类的，如果那个时间电脑处于睡眠状态的话，会被自动唤醒)
echo.
echo Q:电源计划中的USB选择性暂停是什么？会对我的优盘有什么影响吗？
echo A:Windows为了更低耗和环保有一个节能模式，像USB这样的接口默认在一定时间不用会让其进入休眠状态。
echo 	本工具会在连接电源是禁用该模式，所以不会对你的U盘有影响！
)>%userprofile%\Desktop\部分优化说明.txt
start "" %userprofile%\Desktop\部分优化说明.txt
echo  ==================================================================================================
echo.
echo  已尝试将优化说明文件放至桌面并自动打开
echo.
echo  若未自动打开请尝试手动开启
echo.
echo  1.【帮助菜单】
echo.
echo  2.【主页菜单】
echo.
echo  3.【退出工具】
echo.
echo  ==================================================================================================
echo.
choice /c 123 /n /m "请选择"
if "%errorlevel%"=="1" goto help
if "%errorlevel%"=="2" goto Admin
if "%errorlevel%"=="3" exit