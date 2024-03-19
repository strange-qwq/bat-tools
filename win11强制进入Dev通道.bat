@echo off & setlocal enabledelayedexpansion
ver
title Windows 10/11 忽略tpm限制并强制进入Dev通道（By.QWQ）
color 70
mode con lines=30 cols=101
cls
echo.
echo.
echo ==================================================================================================
echo.
echo.                                          QWQ的友情提示
echo.
echo                                    本工具需要以管理员权限运行
echo.
echo                  在下一步之前若要退出直接点击右上角关闭即可，脚本不会做任何操作
echo.
echo.                  Dev通道的bug较多，而且伴有绿屏风险，建议不要使用主力机升级
echo.
echo                 升级后除非其它通道比当前版本大或重装系统，否则无法切换回其它通道
echo.
echo                                          您确认要继续吗
echo.
echo ==================================================================================================
echo.
pause

cd %~dp0
cls
echo.
echo 禁用 TPM 检测
echo.
echo ==================================================================================================
echo.
echo  开始操作
echo.
echo ^@^(set ^"^0=^%~f^0^"^^^)#^) ^& powershell -nop -c iex^([io.file]^:^:ReadAllText($env:0^)^) ^& del disableTPM.bat ^& exit/b>disableTPM.bat
echo. >>disableTPM.bat
echo $_Paste_in_Powershell = {>>disableTPM.bat
echo   $N = 'Skip TPM Check on Dynamic Update'>>disableTPM.bat
echo   $^0 = sp 'HKLM:\SYSTEM\Setup\MoSetup' 'AllowUpgradesWithUnsupportedTPMOrCPU' ^1 -type dword -force -ea ^0>>disableTPM.bat
echo   $B = gwmi -Class __FilterToConsumerBinding -Namespace 'root\subscription' -Filter ^"Filter = ^"^"__eventfilter.name='$N'^"^"^" -ea ^0>>disableTPM.bat
echo   $C = gwmi -Class CommandLineEventConsumer -Namespace 'root\subscription' -Filter ^"Name='$N'^" -ea ^0>>disableTPM.bat
echo   $F = gwmi -Class __EventFilter -NameSpace 'root\subscription' -Filter ^"Name='$N'^" -ea ^0>>disableTPM.bat
echo   if ^($B^) { $B ^| rwmi } ^; if ^($C^) { $C ^| rwmi } ^; if ^($F^) { $F ^| rwmi }>>disableTPM.bat
echo   $C = ^"cmd ^/q $N ^(c^) AveYo, 2021 ^/d^/x^/r^>nul ^(erase ^/f^/s^/q ^%systemdrive^%\`$windows.~bt\appraiserres.dll^">>disableTPM.bat
echo   $C^+= '^&md 11^&cd 11^&ren vd.exe vdsldr.exe^&robocopy ^"..^/^" ^"./^" ^"vdsldr.exe^"^&ren vdsldr.exe vd.exe^&start vd -Embedding^)^&rem^;'>>disableTPM.bat
echo   $K = 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\vdsldr.exe'>>disableTPM.bat
echo   if ^(test-path $K^) {ri $K -force -ea ^0^; write-host -fore 0xf -back 0xd ^"`n $N [REMOVED] run again to install ^"^;}>>disableTPM.bat
echo   else {$0=ni $K^; sp $K Debugger $C -force^; write-host -fore 0xf -back 0x2 ^"`n $N [INSTALLED] run again to remove ^"^;}>>disableTPM.bat
echo } ^; start -verb runas powershell -args ^"-nop -c ^& {`n`n$^($_Paste_in_Powershell-replace'^"','\^"'^)}^">>disableTPM.bat
echo #^:^:>>disableTPM.bat
echo. >>disableTPM.bat
call disableTPM.bat
pause

cls
echo.
echo 创建注册表文件并自动导入
echo.
echo ==================================================================================================
echo.
echo  开始操作
echo.
echo Windows Registry Editor Version 5.00>强制进入Dev通道.reg
echo. >>强制进入Dev通道.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsSelfHost\Applicability]>>强制进入Dev通道.reg
echo "BranchName"="Dev">>强制进入Dev通道.reg
echo "ContentType"="Mainline">>强制进入Dev通道.reg
echo. >>强制进入Dev通道.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsSelfHost\UI\Selection]>>强制进入Dev通道.reg
echo "UIBranch"="Dev">>强制进入Dev通道.reg
echo "UIContentType"="Mainline">>强制进入Dev通道.reg
regedit /s 强制进入Dev通道.reg
del 强制进入Dev通道.reg

cls
echo
echo.
echo ==================================================================================================
echo.
echo.                                             完成
echo.
echo.                                打开 设置 - Windows更新 看看吧！
echo.
echo.                如果仍显示“您的PC不符合Windows 11的最低硬件要求”则表示您的CPU太老了
echo.
echo                     该提示不会影响补丁更新，但可能会导致收不到 Windows 版本更新
echo.
echo                                           解决方法：
echo.
echo                                    1、官网下载预览镜像
echo.
echo                    2、解压并删除sources\appraiserres.dll文件然后打开setup.exe
echo.
echo                                      3、打开setup.exe
echo.
echo                               4、点击“更改安装程序下载更新的方式”
echo.
echo                                     5、修改为“不是现在”
echo.
echo                                   6、一直下一步开始安装即可
echo.
echo ==================================================================================================
echo.
pause
