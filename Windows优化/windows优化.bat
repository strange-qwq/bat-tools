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
echo  �˹��߽���Ϊ���Ż�Windows���ڼ���ѡ������ǰ����3����������������ʱ�رմ�����ֹ�Ż�
echo.
echo  ���������д�����������磬��@QWQ�޸ģ�@QWQ��@����ǧ��ͬ����ͨ��
echo.
echo  �κ��򱾹��߻��ĵ������²���ʧ���������Գ��ֹ��ϵģ������и���
echo.
echo  ��ͬ����
echo.
echo  1.ͬ�Ⲣ����
echo.
echo  2.�ܾ����˳�
echo.
echo  3.�������ĵ�
echo.
echo  ==================================================================================================
echo.
set /p id=��ѡ��
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
mshta vbscript:msgbox("����Windows 7��������ͬ��Ҳû�ã�"^&vbCrLf^&"(������)a ",64,"(*/�أ�*)")(window.close)
exit
:start
cls
title windows�Ż����ߣ�by.QWQ��������ִ�аٷ�֮1
echo  ==================================================================================================
echo.
echo                                             ��ʼִ��
echo.
echo  ===============================================
echo.
echo                  Windows�����Ż�
echo.
echo  3���ִ��...
echo.
ping -n 3 127.0.0.1>nul
title windows�Ż����ߣ�by.QWQ��������ִ�аٷ�֮2
echo  =====================
echo.
echo    ���������Զ�����
echo.
wmic path win32_OSRecoveryConfiguration set AutoReboot=True
echo.
echo  ִ����ɣ�
echo.
title windows�Ż����ߣ�by.QWQ��������ִ�аٷ�֮4
echo  =====================
echo.
echo    �����Զ��ڴ�ת��
echo.
reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\CrashControl" /v CrashDumpEnabled /t REG_DWORD /d 7 /f
echo.
echo  ִ����ɣ�
echo.
title windows�Ż����ߣ�by.QWQ��������ִ�аٷ�֮6
echo  =====================
echo.
echo    ���̿����˵�ʱ��
echo.
BCDEDIT /set {bootmgr} timeout 1
echo.
echo  ִ����ɣ�
echo.
title windows�Ż����ߣ�by.QWQ��������ִ�аٷ�֮8
echo  =====================
echo.
echo      �ر�Զ�̵�¼
echo.
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 1 /f
echo.
echo  ִ����ɣ�
echo.
title windows�Ż����ߣ�by.QWQ��������ִ�аٷ�֮10
echo  =====================
echo.
echo      �ر�Ĭ�Ϲ���
echo.
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\lanmanserver\parameters" /v AutoShareServer /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa" /v restrictanonymous /t REG_DWORD /d 1 /f
net stop LanmanServer
sc config LanmanServer start= disabled
echo.
echo  ִ����ɣ�
echo.
title windows�Ż����ߣ�by.QWQ��������ִ�аٷ�֮12
echo  =====================
echo.
echo     ��ʾ�ļ���׺��
echo.
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v HideFileExt /t REG_DWORD /d 00000000 /f
echo.
echo  ִ����ɣ�
echo.
title windows�Ż����ߣ�by.QWQ��������ִ�аٷ�֮14
echo  =====================
echo.
echo  �Ƿ���Ҫ����Windows����
echo  (���������ܽ����򲻽��鿪��)
echo.
echo  1������
echo.
echo  2���ر�
echo.
choice /c 12 /n /m "��ѡ��"
if "%errorlevel%"=="1" goto openAnimation
if "%errorlevel%"=="2" goto closeAnimation
:openAnimation
echo.
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 1 /f
echo.
echo  ������Ϊ������
echo.
goto PowerPlanning
:closeAnimation
echo.
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f
echo.
echo  ������Ϊ�������
echo.
goto PowerPlanning
:PowerPlanning
title windows�Ż����ߣ�by.QWQ��������ִ�аٷ�֮18
ver | find "6.1." > NUL &&  goto win7
ver | find "6.2." > NUL &&  goto win7
ver | find "6.3." > NUL &&  goto win7
ver | find "10.0." > NUL &&  goto win10
:win7
set "verNumber=����������"
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
set "verNumber=׿Խ��������"
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
echo.
title windows�Ż����ߣ�by.QWQ��������ִ�аٷ�֮20
echo  ===============================================
echo.
echo                 �Ż���Դ�ƻ�
echo.
echo  3���ִ��...
ping -n 3 127.0.0.1>nul
echo.
title windows�Ż����ߣ�by.QWQ��������ִ�аٷ�֮22
echo  =====================
echo.
echo      ������������
echo.
powercfg /h on
echo.
title windows�Ż����ߣ�by.QWQ��������ִ�аٷ�֮24
::echo  =====================
::echo.
::echo    ���õ�Դ��ťΪ�ػ�
::echo.
powercfg -SetDcValueIndex 381b4222-f694-41f0-9685-ff5bb260df2e 4f971e89-eebd-4455-a8de-9e59040e7347 7648efa3-dd9c-4e3e-b566-50f929386280 3
powercfg -SetAcValueIndex 381b4222-f694-41f0-9685-ff5bb260df2e 4f971e89-eebd-4455-a8de-9e59040e7347 7648efa3-dd9c-4e3e-b566-50f929386280 3
echo.
title windows�Ż����ߣ�by.QWQ��������ִ�аٷ�֮26
::echo  =====================
::echo.
::echo    ����˯�߰�ťΪ˯��
::echo.
powercfg -SetDcValueIndex 381b4222-f694-41f0-9685-ff5bb260df2e 4f971e89-eebd-4455-a8de-9e59040e7347 96996bc0-ad50-47ec-923b-6f41874dd9eb 1
powercfg -SetAcValueIndex 381b4222-f694-41f0-9685-ff5bb260df2e 4f971e89-eebd-4455-a8de-9e59040e7347 96996bc0-ad50-47ec-923b-6f41874dd9eb 1
echo.
title windows�Ż����ߣ�by.QWQ��������ִ�аٷ�֮28
::echo  =====================
::echo.
::echo    ���ùرո����޲���
::echo.
powercfg -SetDcValueIndex 381b4222-f694-41f0-9685-ff5bb260df2e 4f971e89-eebd-4455-a8de-9e59040e7347 5ca83367-6e45-459f-a27b-476b1d01c936 0
powercfg -SetAcValueIndex 381b4222-f694-41f0-9685-ff5bb260df2e 4f971e89-eebd-4455-a8de-9e59040e7347 5ca83367-6e45-459f-a27b-476b1d01c936 0
echo.
title windows�Ż����ߣ�by.QWQ��������ִ�аٷ�֮30
::echo  =====================
::echo.
::echo     ���ò��ر�Ӳ��
::echo.
powercfg -SetDcValueIndex %guid% 0012ee47-9041-4b5d-9b77-535fba8b1442 6738e2c4-e8a5-4a42-b16a-e040e769756e 0
powercfg -SetAcValueIndex %guid% 0012ee47-9041-4b5d-9b77-535fba8b1442 6738e2c4-e8a5-4a42-b16a-e040e769756e 0
echo.
title windows�Ż����ߣ�by.QWQ��������ִ�аٷ�֮32
::echo  =====================
::echo.
::echo  ����JavaScript ��ʱ��Ƶ��
::echo.
powercfg -SetDcValueIndex %guid% 02f815b5-a5cf-4c84-bf20-649d1f75d3d8 4c793e7d-a264-42e1-87d3-7a0d2f523ccd 0
powercfg -SetAcValueIndex %guid% 02f815b5-a5cf-4c84-bf20-649d1f75d3d8 4c793e7d-a264-42e1-87d3-7a0d2f523ccd 1
echo.
title windows�Ż����ߣ�by.QWQ��������ִ�аٷ�֮34
echo  =====================
echo.
echo  ʹ�õ��ʱ���治��ӳ�õ�Ƭ
echo.
powercfg -SetDcValueIndex %guid% 0d7dbae2-4294-402a-ba8e-26777e8488cd 309dce9b-bef4-4119-9921-a851fb12f0f4 1
powercfg -SetAcValueIndex %guid% 0d7dbae2-4294-402a-ba8e-26777e8488cd 309dce9b-bef4-4119-9921-a851fb12f0f4 0
echo.
title windows�Ż����ߣ�by.QWQ��������ִ�аٷ�֮36
::echo  =====================
::echo.
::echo     ��������������
::echo.
powercfg -SetDcValueIndex %guid% 19cbb8fa-5279-450e-9fac-8a3d5fedd0c1 12bbebe6-58d6-4636-95bb-3217ef867c1a 2
powercfg -SetAcValueIndex %guid% 19cbb8fa-5279-450e-9fac-8a3d5fedd0c1 12bbebe6-58d6-4636-95bb-3217ef867c1a 0
echo.
title windows�Ż����ߣ�by.QWQ��������ִ�аٷ�֮38
::echo  =====================
::echo.
::echo      �����Զ�˯��
::echo.
powercfg -SetDcValueIndex %guid% 238c9fa8-0aad-41ed-83f4-97be242c8f20 29f6c1db-86da-48c5-9fdb-f2b67b1f44da 3600
powercfg -SetAcValueIndex %guid% 238c9fa8-0aad-41ed-83f4-97be242c8f20 29f6c1db-86da-48c5-9fdb-f2b67b1f44da 0
echo.
title windows�Ż����ߣ�by.QWQ��������ִ�аٷ�֮40
echo  =====================
echo.
echo      �رջ��˯��
echo.
powercfg -SetDcValueIndex %guid% 238c9fa8-0aad-41ed-83f4-97be242c8f20 94ac6d29-73ce-41a6-809f-6363ba21b47e 0
powercfg -SetAcValueIndex %guid% 238c9fa8-0aad-41ed-83f4-97be242c8f20 94ac6d29-73ce-41a6-809f-6363ba21b47e 0
echo.
title windows�Ż����ߣ�by.QWQ��������ִ�аٷ�֮42
::echo  =====================
::echo.
::echo      �����Զ�����
::echo.
powercfg -SetDcValueIndex %guid% 238c9fa8-0aad-41ed-83f4-97be242c8f20 9d7815a6-7ee4-497e-8888-515a05f02364 7200
powercfg -SetAcValueIndex %guid% 238c9fa8-0aad-41ed-83f4-97be242c8f20 9d7815a6-7ee4-497e-8888-515a05f02364 0
echo.
title windows�Ż����ߣ�by.QWQ��������ִ�аٷ�֮44
echo  =====================
echo.
echo     ���û��Ѷ�ʱ��
echo.
powercfg -SetDcValueIndex %guid% 238c9fa8-0aad-41ed-83f4-97be242c8f20 bd3b718a-0680-4d9d-8ab2-e1d2b4ac806d 2
powercfg -SetAcValueIndex %guid% 238c9fa8-0aad-41ed-83f4-97be242c8f20 bd3b718a-0680-4d9d-8ab2-e1d2b4ac806d 1
echo.
title windows�Ż����ߣ�by.QWQ��������ִ�аٷ�֮46
echo  =====================
echo.
echo    �ر�USBѡ������ͣ
echo.
powercfg -SetDcValueIndex %guid% 2a737441-1930-4402-8d77-b2bebba308a3 48e6b7a6-50f5-4782-a5d4-53bb8f07e226 1
powercfg -SetAcValueIndex %guid% 2a737441-1930-4402-8d77-b2bebba308a3 48e6b7a6-50f5-4782-a5d4-53bb8f07e226 0
echo.
title windows�Ż����ߣ�by.QWQ��������ִ�аٷ�֮48
echo  =====================
echo.
echo  ����Intel(R) Graphics Power Plan
echo  (Tips:����㲻��Ӣ�ض�cpu���߲�֧�ִ˹�������ܻᱨ��)
echo.
powercfg -SetDcValueIndex %guid% 44f3beca-a7c0-460e-9df2-bb8b99e0cba6 3619c3f2-afb2-4afc-b0e9-e7fef372de36 0
powercfg -SetAcValueIndex %guid% 44f3beca-a7c0-460e-9df2-bb8b99e0cba6 3619c3f2-afb2-4afc-b0e9-e7fef372de36 2
echo.
title windows�Ż����ߣ�by.QWQ��������ִ�аٷ�֮50
echo  =====================
echo.
echo    ����״̬��Դ����
echo.
powercfg -SetDcValueIndex %guid% 501a4d13-42af-4429-9fd1-a8218c268e20 ee12f906-d277-404b-b6da-e5fa1a576df5 1
powercfg -SetAcValueIndex %guid% 501a4d13-42af-4429-9fd1-a8218c268e20 ee12f906-d277-404b-b6da-e5fa1a576df5 0
echo.
title windows�Ż����ߣ�by.QWQ��������ִ�аٷ�֮52
echo  =====================
echo.
echo     ��С������״̬
echo.
powercfg -SetDcValueIndex %guid% 54533251-82be-4824-96c1-47b60b740d00 893dee8e-2bef-41e0-89c6-b55d0929964c 15
powercfg -SetAcValueIndex %guid% 54533251-82be-4824-96c1-47b60b740d00 893dee8e-2bef-41e0-89c6-b55d0929964c 20
echo.
title windows�Ż����ߣ�by.QWQ��������ִ�аٷ�֮54
echo  =====================
echo.
echo      ϵͳɢ�ȷ�ʽ
echo.
powercfg -SetDcValueIndex %guid% 54533251-82be-4824-96c1-47b60b740d00 94d3a615-a899-4ac5-ae2b-e4d8f634367f 1
powercfg -SetAcValueIndex %guid% 54533251-82be-4824-96c1-47b60b740d00 94d3a615-a899-4ac5-ae2b-e4d8f634367f 1
echo.
title windows�Ż����ߣ�by.QWQ��������ִ�аٷ�֮56
echo  =====================
echo.
echo     �������״̬
echo.
powercfg -SetDcValueIndex %guid% 54533251-82be-4824-96c1-47b60b740d00 bc5038f7-23e0-4960-96da-33abaf5935ec 99
powercfg -SetAcValueIndex %guid% 54533251-82be-4824-96c1-47b60b740d00 bc5038f7-23e0-4960-96da-33abaf5935ec 100
echo.
title windows�Ż����ߣ�by.QWQ��������ִ�аٷ�֮58
echo  =====================
echo.
echo     �Զ��ر���ʾ��
echo.
powercfg -SetDcValueIndex %guid% 7516b95f-f776-4464-8c53-06167f40cc99 3c0bc021-c8a8-4e07-a973-6b14cbcb2b7e 3600
powercfg -SetAcValueIndex %guid% 7516b95f-f776-4464-8c53-06167f40cc99 3c0bc021-c8a8-4e07-a973-6b14cbcb2b7e 0
echo.
title windows�Ż����ߣ�by.QWQ��������ִ�аٷ�֮60
echo  =====================
echo.
echo       ��ʾ������
echo.
powercfg -SetDcValueIndex %guid% 7516b95f-f776-4464-8c53-06167f40cc99 aded5e82-b909-4619-9949-f5d71dac0bcb 25
powercfg -SetAcValueIndex %guid% 7516b95f-f776-4464-8c53-06167f40cc99 aded5e82-b909-4619-9949-f5d71dac0bcb 50
echo.
title windows�Ż����ߣ�by.QWQ��������ִ�аٷ�֮62
echo  =====================
echo.
echo    ��ʾ���ϵ����ȱ䰵
echo.
powercfg -SetDcValueIndex %guid% 7516b95f-f776-4464-8c53-06167f40cc99 f1fbfde2-a960-4165-9f88-50667911ce96 25
powercfg -SetAcValueIndex %guid% 7516b95f-f776-4464-8c53-06167f40cc99 f1fbfde2-a960-4165-9f88-50667911ce96 50
echo.
title windows�Ż����ߣ�by.QWQ��������ִ�аٷ�֮64
::echo  =====================
::echo.
::echo     �ر�����Ӧ����
::echo.
powercfg -SetDcValueIndex %guid% 7516b95f-f776-4464-8c53-06167f40cc99 fbd9aa66-9553-4097-ba44-ed6e9d65eab8 0
powercfg -SetAcValueIndex %guid% 7516b95f-f776-4464-8c53-06167f40cc99 fbd9aa66-9553-4097-ba44-ed6e9d65eab8 0
echo.
title windows�Ż����ߣ�by.QWQ��������ִ�аٷ�֮66
::echo  =====================
::echo.
::echo     ��Ƶ������������
::echo.
powercfg -SetDcValueIndex %guid% 9596fb26-9850-41fd-ac3e-f7c3c00afd4b 10778347-1370-4ee0-8bbd-33bdacaade49 1
powercfg -SetAcValueIndex %guid% 9596fb26-9850-41fd-ac3e-f7c3c00afd4b 10778347-1370-4ee0-8bbd-33bdacaade49 1
echo.
title windows�Ż����ߣ�by.QWQ��������ִ�аٷ�֮68
::echo  =====================
::echo.
::echo  ������Ƶʱ�Ż���Ƶ����
::echo.
powercfg -SetDcValueIndex %guid% 9596fb26-9850-41fd-ac3e-f7c3c00afd4b 34c7b99f-9a6d-4b3c-8dc7-b6693b78cef4 1
powercfg -SetAcValueIndex %guid% 9596fb26-9850-41fd-ac3e-f7c3c00afd4b 34c7b99f-9a6d-4b3c-8dc7-b6693b78cef4 0
echo.
title windows�Ż����ߣ�by.QWQ��������ִ�аٷ�֮70
::echo  =====================
::echo.
::echo      �͵�ص���֪ͨ
::echo.
powercfg -SetDcValueIndex %guid% e73a048d-bf27-4f12-9731-8b2076e8891f 5dbb7c9f-38e9-40d2-9749-4f8a0e9f640f 1
powercfg -SetAcValueIndex %guid% e73a048d-bf27-4f12-9731-8b2076e8891f 5dbb7c9f-38e9-40d2-9749-4f8a0e9f640f 1
echo.
title windows�Ż����ߣ�by.QWQ��������ִ�аٷ�֮72
echo  =====================
echo.
echo     �ؼ������ز���
echo.
powercfg -SetDcValueIndex %guid% e73a048d-bf27-4f12-9731-8b2076e8891f 637ea02f-bbcb-4015-8e2c-a1c7b9c0b546 2
powercfg -SetAcValueIndex %guid% e73a048d-bf27-4f12-9731-8b2076e8891f 637ea02f-bbcb-4015-8e2c-a1c7b9c0b546 2
echo.
title windows�Ż����ߣ�by.QWQ��������ִ�аٷ�֮74
echo  =====================
echo.
echo     ��ص���ˮƽ��
echo.
powercfg -SetDcValueIndex %guid% e73a048d-bf27-4f12-9731-8b2076e8891f 8183ba9a-e910-48da-8769-14ae6dc1170a 10
powercfg -SetAcValueIndex %guid% e73a048d-bf27-4f12-9731-8b2076e8891f 8183ba9a-e910-48da-8769-14ae6dc1170a 10
echo.
title windows�Ż����ߣ�by.QWQ��������ִ�аٷ�֮76
echo  =====================
echo.
echo    �ؼ���ص���ˮƽ
echo.
powercfg -SetDcValueIndex %guid% e73a048d-bf27-4f12-9731-8b2076e8891f 9a66d8d7-4ff7-4ef9-b5a2-5a326ca2a469 5
powercfg -SetAcValueIndex %guid% e73a048d-bf27-4f12-9731-8b2076e8891f 9a66d8d7-4ff7-4ef9-b5a2-5a326ca2a469 5
echo.
title windows�Ż����ߣ�by.QWQ��������ִ�аٷ�֮78
::echo  =====================
::echo.
::echo       �͵���֪ͨ
::echo.
powercfg -SetDcValueIndex %guid% e73a048d-bf27-4f12-9731-8b2076e8891f bcded951-187b-4d05-bccc-f7e51960c258 1
powercfg -SetAcValueIndex %guid% e73a048d-bf27-4f12-9731-8b2076e8891f bcded951-187b-4d05-bccc-f7e51960c258 1
echo.
title windows�Ż����ߣ�by.QWQ��������ִ�аٷ�֮80
echo  =====================
echo.
echo       �͵�������
echo.
powercfg -SetDcValueIndex %guid% e73a048d-bf27-4f12-9731-8b2076e8891f d8742dcb-3e6a-4b3c-b3fe-374623cdcf06 0
powercfg -SetAcValueIndex %guid% e73a048d-bf27-4f12-9731-8b2076e8891f d8742dcb-3e6a-4b3c-b3fe-374623cdcf06 0
echo.
title windows�Ż����ߣ�by.QWQ��������ִ�аٷ�֮84
::echo  =====================
::echo.
::echo      ������ص���
::echo.
powercfg -SetDcValueIndex %guid% e73a048d-bf27-4f12-9731-8b2076e8891f f3c5027d-cd16-4930-aa6b-90db844a8f00 7
powercfg -SetAcValueIndex %guid% e73a048d-bf27-4f12-9731-8b2076e8891f f3c5027d-cd16-4930-aa6b-90db844a8f00 7
echo.
echo  ִ����ɣ�
echo.
title windows�Ż����ߣ�by.QWQ��������ִ�аٷ�֮88
echo  ===============================================
echo.
echo              Windows�Դ������Ż�
echo.
echo  3���ִ��...
ping -n 3 127.0.0.1>nul
echo.
title windows�Ż����ߣ�by.QWQ��������ִ�аٷ�֮92
echo  =====================
echo.
echo   �����Զ����������
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
echo  ִ����ɣ�
echo.
title windows�Ż����ߣ�by.QWQ��������ִ�аٷ�֮96
echo  =====================
echo.
echo     ����Windows����
echo.
net stop WSearch
sc config WSearch start= disabled
echo.
echo  ִ����ɣ�
echo.
title windows�Ż����ߣ�by.QWQ��������ִ�аٷ�֮99
echo  =====================
echo.
echo      �����Զ�����
echo.
net stop ShellHWDetection
sc config ShellHWDetection start= disabled
echo.
echo  ִ����ɣ�
echo.
title windows�Ż����ߣ�by.QWQ��������ִ�аٷ�֮100
ping -n 3 127.0.0.1>nul
mshta vbscript:msgbox("�������",64,"Done")(window.close)
title windows�Ż����ߣ�by.QWQ����������ɣ�
echo.
echo  ��������˳�
pause >nul
exit

:help
cls
title windows�Ż����ߡ����������ĵ�
echo.
echo  ==================================================================================================
echo.
echo  ��������@QWQ��QQ��1456158721����������̳�����
echo.
echo  �汾�ţ�1.0.0
echo.
echo  1.���Ż����ݡ�
echo.
echo  2.������˵����
echo.
echo  3.�����ز˵���
echo.
echo  4.���˳����ߡ�
echo.
echo  ==================================================================================================
echo.
choice /c 1234 /n /m "��ѡ��"
if "%errorlevel%"=="1" goto helpOne
if "%errorlevel%"=="2" goto helpTwo
if "%errorlevel%"=="3" goto Admin
if "%errorlevel%"=="4" exit
:helpOne
cls
title windows�Ż����ߡ����Ż�����
ver | find "6.1." > NUL &&  goto helpOnewin7
ver | find "6.2." > NUL &&  goto helpOnewin7
ver | find "6.3." > NUL &&  goto helpOnewin7
ver | find "10.0." > NUL &&  goto helpOnewin10
:helpOnewin7
set "helpVerNumber=������"
goto helpNext
:helpOnewin10
set "helpVerNumber=׿Խ����"
goto helpNext
:helpNext
::������÷Ǽ��±�����������������Ҫ˵һ��:[]
::�����ʽ��֮�����ų���������Ϊ���±��ж�:(
::����Ҳ������XD
(
echo.
echo +----------------------+
echo +                               +
echo +        �Ż�����        +
echo +                               +
echo +----------------------+
echo.
echo ���棺
echo 1��Ĭ��ֵ��X�֡���
echo ����������ʾ��ѡѡ��
echo ���رա���ʾ����ѡѡ��
echo �������ڡ���ʾԭ�������ڴ�����
echo �����ء���ʾϵͳ�Դ���ѡ�����
echo ��xx �� xx����ʾ�������û�ѡ������
echo ��������һ��Ϊ���õ�ѡ������������ݣ��뿴�����ע��
echo 2���κ����ĵ������²���ʧ���������Գ��ֹ��ϵģ������и���
echo.
echo ���������Զ�����
echo Ĭ��ֵ���ر�
echo �趨ֵ������
echo λ�ã��������\���п��������\ϵͳ\�߼�ϵͳ����\�߼�\�����͹��ϻָ�����
echo.
echo �����ڴ�ת��
echo Ĭ��ֵ��С�ڴ�ת��(256 KB)
echo �趨ֵ���Զ��ڴ�ת��
echo λ�ã��������\���п��������\ϵͳ\�߼�ϵͳ����\�߼�\�����͹��ϻָ�����
echo.
echo ����������ʾ����ϵͳ�б��ʱ��(��λ����)
echo Ĭ��ֵ��30
echo �趨ֵ��1
echo λ�ã��������\���п��������\ϵͳ\�߼�ϵͳ����\�߼�\�����͹��ϻָ�����
echo.
echo ����ϵͳԶ�̵�¼
echo Ĭ��ֵ������Զ�����ӵ��˼����
echo �趨ֵ��������Զ�����ӵ��˼����
echo λ�ã��������\���п��������\ϵͳ\�߼�ϵͳ����\Զ��
echo.
echo ����ϵͳĬ�Ϲ���(���ֱ�ʾע��������)
echo Ĭ��ֵ1��1
echo Ĭ��ֵ2��������
echo �趨ֵ1��0
echo �趨ֵ2��1
echo λ��1��ע���\HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\lanmanserver\parameters\AutoShareServer(REG_DWORD)
echo λ��2��ע���\HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa\restrictanonymous(REG_DWORD)
echo.
echo �����ļ���׺��
echo Ĭ��ֵ������
echo �趨ֵ���ر�
echo λ�ã��������\���п��������\�ļ���Դ������ѡ��\�鿴\������֪�ļ����͵���չ��
echo.
echo ����ϵͳ����
echo Ĭ��ֵ���� Windows ѡ���������������
echo �趨ֵ������Ϊ������ �� ����Ϊ�������
echo λ�ã��������\���п��������\ϵͳ\�߼�ϵͳ����\�߼�\��������\�Ӿ�Ч��
echo.
echo ��������%helpVerNumber%��Դ�ƻ�
echo Ĭ��ֵ�����ػ򲻴���
echo �趨ֵ��������ѡ��
echo λ�ã��������\���п��������\��Դѡ��
echo.
echo ����%verNumber%���������ӳ�õ�Ƭ
echo Ĭ��ֵ������
echo �趨ֵ��ʹ�õ�ص�ء�����ͣ
echo λ�ã��������\���п��������\��Դѡ��\�༭�ƻ�����\���ĸ߼���Դ����\���汳������\��ӳ�õ�Ƭ
echo.
echo ����%verNumber%�������˯��
echo Ĭ��ֵ������
echo �趨ֵ���ر�
echo λ�ã��������\���п��������\��Դѡ��\�༭�ƻ�����\���ĸ߼���Դ����\˯��\������˯��
echo.
echo ����%verNumber%�������Ѷ�ʱ��
echo Ĭ��ֵ��ʹ�õ�ء������ã���ͨ��Դ����������Ҫ�Ļ��Ѷ�ʱ��
echo �趨ֵ��ʹ�õ�ء���������Ҫ�Ļ��Ѷ�ʱ������ͨ��Դ��������
echo λ�ã��������\���п��������\��Դѡ��\�༭�ƻ�����\���ĸ߼���Դ����\˯��\����ʹ�û��Ѷ�ʱ��
echo.
echo ����%verNumber%����USBѡ������ͣ
echo Ĭ��ֵ��������
echo �趨ֵ��ʹ�õ�ء��������ã���ͨ��Դ�����ѽ���
echo λ�ã��������\���п��������\��Դѡ��\�༭�ƻ�����\���ĸ߼���Դ����\USB����\USBѡ������ͣ����
echo.
echo ����%verNumber%����Intel(R) Graphics Power Plan
echo  (Tips:����㲻��Ӣ�ض�cpu���߲�֧�ִ˹�������ܻᱨ��)
echo Ĭ��ֵ��ʹ�õ�ء���Maximum Battery Life����ͨ��Դ����Maximum Performance
echo �趨ֵ��ʹ�õ�ء���Balanced����ͨ��Դ����Maximum Performance
echo λ�ã��������\���п��������\��Դѡ��\�༭�ƻ�����\���ĸ߼���Դ����\Intel(R) Graphics Settings\Intel(R) Graphics Power Plan
echo.
echo ����%verNumber%��������״̬��Դ����
echo Ĭ��ֵ��ʹ�õ�ء�������Դ��ʡ������ͨ��Դ�����ر�
echo �趨ֵ��ʹ�õ�ء����еȵ�Դ��ʡ������ͨ��Դ�����ر�
echo λ�ã��������\���п��������\��Դѡ��\�༭�ƻ�����\���ĸ߼���Դ����\PCI Express\����״̬��Դ����
echo.
echo ����%verNumber%������С������״̬
echo Ĭ��ֵ��20%
echo �趨ֵ��ʹ�õ�ء����ٷ�֮10����ͨ��Դ�����ٷ�֮15
echo λ�ã��������\���п��������\��Դѡ��\�༭�ƻ�����\���ĸ߼���Դ����\��������Դ����\��С������״̬
echo.
echo ����%verNumber%����ϵͳɢ�ȷ�ʽ
echo Ĭ��ֵ��ʹ�õ�ء�����������ͨ��Դ��������
echo �趨ֵ������
echo λ�ã��������\���п��������\��Դѡ��\�༭�ƻ�����\���ĸ߼���Դ����\��������Դ����\ϵͳɢ�ȷ�ʽ
echo.
echo ����%verNumber%�����������״̬
echo Ĭ��ֵ���ٷ�֮100
echo �趨ֵ��ʹ�õ�ء����ٷ�֮99����ͨ��Դ�����ٷ�֮100
echo λ�ã��������\���п��������\��Դѡ��\�༭�ƻ�����\���ĸ߼���Դ����\��������Դ����\�������״̬
echo.
echo ����%verNumber%�����Զ��ر���ʾ��
echo Ĭ��ֵ���ٷ�֮15
echo �趨ֵ��ʹ�õ�ء���60���ӣ���ͨ��Դ�����Ӳ�
echo λ�ã��������\���п��������\��Դѡ��\�༭�ƻ�����\���ĸ߼���Դ����\��ʾ\�ڴ�ʱ���ر���ʾ
echo.
echo ����%verNumber%������ʾ������
echo Ĭ��ֵ��δ֪
echo �趨ֵ���ٷ�֮50
echo λ�ã��������\���п��������\��Դѡ��\�༭�ƻ�����\���ĸ߼���Դ����\��ʾ
echo.
echo ����%verNumber%������ʾ���ϵ����ȱ䰵
echo Ĭ��ֵ��δ֪
echo �趨ֵ���ٷ�֮25
echo λ�ã��������\���п��������\��Դѡ��\�༭�ƻ�����\���ĸ߼���Դ����\��ʾ
echo.
echo ����%verNumber%�����ؼ������ز���
echo Ĭ��ֵ���ػ�
echo �趨ֵ������
echo λ�ã��������\���п��������\��Դѡ��\�༭�ƻ�����\���ĸ߼���Դ����\���\�ؼ������ز���
echo.
echo ����%verNumber%������ص���ˮƽ��
echo Ĭ��ֵ���ٷ�֮20
echo �趨ֵ���ٷ�֮10
echo λ�ã��������\���п��������\��Դѡ��\�༭�ƻ�����\���ĸ߼���Դ����\���\��ص���ˮƽ��
echo.
echo ����%verNumber%�����ؼ���ص���ˮƽ
echo Ĭ��ֵ���ٷ�֮10
echo �趨ֵ���ٷ�֮5
echo λ�ã��������\���п��������\��Դѡ��\�༭�ƻ�����\���ĸ߼���Դ����\���\�ؼ���ص���ˮƽ
echo.
echo ����%verNumber%�����͵�������
echo Ĭ��ֵ��˯��
echo �趨ֵ������ȡ�κβ���
echo λ�ã��������\���п��������\��Դѡ��\�༭�ƻ�����\���ĸ߼���Դ����\���\�͵�������
echo.
echo ���������Զ����������
echo Ĭ��ֵ1��Win 10 Th2֮��İ汾:Connected User Experiences and Telemetry(DiagTrack)�����Զ�
echo Ĭ��ֵ1��Win 10 Th2֮ǰ�İ汾:Diagnostics Tracking Service(DiagTrack)�����Զ�
echo Ĭ��ֵ2��Diagnostic Execution Service(diagsvc)�����Զ�
echo Ĭ��ֵ3��Diagnostic Policy Service(DPS)�����Զ�
echo Ĭ��ֵ4��Diagnostic Service Host(WdiServiceHost)�����Զ�
echo Ĭ��ֵ5��Diagnostic System Host(WdiSystemHost)�����Զ�
echo Ĭ��ֵ6��Windows Error Reporting Service(WerSvc)�����Զ�
echo �趨ֵ������
echo λ�ã����С�������(services.msc)
echo.
echo ��������Windows����
echo Ĭ��ֵ��Windows Search(WSearch)�����Զ�
echo �趨ֵ������
echo λ�ã����С�������(services.msc)
echo.
echo ���������Զ�����
echo Ĭ��ֵ��Shell Hardware Detection(ShellHWDetection)�����Զ�
echo �趨ֵ������
echo λ�ã����С�������(services.msc)
)>%userprofile%\Desktop\�Ż�����.txt
start "" %userprofile%\Desktop\�Ż�����.txt
echo  ==================================================================================================
echo.
echo  �ѳ��Խ��Ż������ļ��������沢�Զ���
echo.
echo  ��δ�Զ����볢���ֶ�����
echo.
echo  1.�������˵���
echo.
echo  2.����ҳ�˵���
echo.
echo  3.���˳����ߡ�
echo.
echo  ==================================================================================================
echo.
choice /c 123 /n /m "��ѡ��"
if "%errorlevel%"=="1" goto help
if "%errorlevel%"=="2" goto Admin
if "%errorlevel%"=="3" exit
:helpTwo
cls
title title windows�Ż����ߡ��������Ż�˵��
(
echo.
echo +----------------------+
echo +                               +
echo +     �����Ż�˵��       +
echo +                               +
echo +----------------------+
echo.
echo Q:��Դ�ƻ��еĻ��Ѷ�ʱ����ʲô��
echo A:ָ���Ƿ�����ʱ�¼����������˯��״̬����
echo 	(�������������Զ����¡��Զ�����֮��ģ�����Ǹ�ʱ����Դ���˯��״̬�Ļ����ᱻ�Զ�����)
echo.
echo Q:��Դ�ƻ��е�USBѡ������ͣ��ʲô������ҵ�������ʲôӰ����
echo A:WindowsΪ�˸��ͺĺͻ�����һ������ģʽ����USB�����Ľӿ�Ĭ����һ��ʱ�䲻�û������������״̬��
echo 	�����߻������ӵ�Դ�ǽ��ø�ģʽ�����Բ�������U����Ӱ�죡
)>%userprofile%\Desktop\�����Ż�˵��.txt
start "" %userprofile%\Desktop\�����Ż�˵��.txt
echo  ==================================================================================================
echo.
echo  �ѳ��Խ��Ż�˵���ļ��������沢�Զ���
echo.
echo  ��δ�Զ����볢���ֶ�����
echo.
echo  1.�������˵���
echo.
echo  2.����ҳ�˵���
echo.
echo  3.���˳����ߡ�
echo.
echo  ==================================================================================================
echo.
choice /c 123 /n /m "��ѡ��"
if "%errorlevel%"=="1" goto help
if "%errorlevel%"=="2" goto Admin
if "%errorlevel%"=="3" exit