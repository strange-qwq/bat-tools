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


title FBI WARNING !��1/4��
color 70
mode con lines=30 cols=101
ver
echo=
echo. ==================================================================================================
echo.
echo.                                             FBI WARNING !
echo.
echo.                                                ���棡
echo.
echo. ����360�����ԹܼҵȰ�ȫ������ѣ��빴ѡ��������Ͳ������ѣ�
echo.
echo. �����߽�Windows 7�����Ͽ��ã�Windows XP��ο��ĵ�2
echo.
echo. �˹��߽�������Windows���¿��ڳ�ʼ���׶ε��޸������ܶ��������´���Ҳ���ã�
echo.
echo. ִ�д˹��� ������update���񽫱����ã�
echo.
echo. �˹��߻���Microsoft��Windows ֧���ĵ�����
echo.
echo. �ĵ�1��https://answers.microsoft.com/zh-hans/insider/forum/insider_wintp-insider_install/win10%E7%B3%BB%E7%BB%9F%E6%9B%B4%E6%96%B0%E4%B8%80/a9303d48-2246-48ec-b809-2e6aa2d16e17?auth=1
echo.
echo. �ĵ�2��https://support.microsoft.com/zh-cn/help/971058/how-do-i-reset-windows-update-components
echo.
echo. ==================================================================================================
echo.
echo. �����������
pause >nul
CLS
title ����˵�� ��2/4��
echo. ==================================================================================================
echo.
echo.                                            ����˵��
echo. 
echo. ����ǰ�볢����ͨ�޸����ߡ�1��
echo.
echo. �����ͨ�޸���Ч�ٳ�������޸����ߡ�2��
echo.
echo. �˹��߻���Microsoft��Windows ֧���ĵ�����
echo.
echo. �ĵ�1��https://answers.microsoft.com/zh-hans/insider/forum/insider_wintp-insider_install/win10%E7%B3%BB%E7%BB%9F%E6%9B%B4%E6%96%B0%E4%B8%80/a9303d48-2246-48ec-b809-2e6aa2d16e17?auth=1
echo.
echo. �ĵ�2��https://support.microsoft.com/zh-cn/help/971058/how-do-i-reset-windows-update-components
echo.
echo. ==================================================================================================
echo.
set /p ID=������ѡ����Ŀ����ţ�
if "%id%"=="1" goto ��ͨ�޸�����
if "%id%"=="2" goto ����޸�����
IF "%id%"=="3" exit

:��ͨ�޸�����
title ��ͨ�޸����ߣ�3/4��
CLS
echo. ==================================================================================================
echo.
echo.                                            ʹ��˵��
echo. 
echo. �˽׶ν��ṩɾ�����»������
echo.
echo. �޸���ɺ���Զ�����Windows�����û�����ֶ�����������ע�Ᵽ���Լ��Ĺ���
echo.
echo. �������볢�����¸��£�ʧ������Լ��Σ��������ǲ��У��볢���������б����߲���������޸��׶�
echo. 
echo. ==================================================================================================
echo.
echo. �����������
pause >nul
CLS
title ��ͨ�޸����ߣ�4/4��
echo. ==================================================================================================
echo.
echo.                                            ��ʼ�޸�
echo. 
net stop wuauserv
net stop BITS
del /s /f /q C:\Windows\SoftwareDistribution\DataStore
del /s /f /q C:\Windows\SoftwareDistribution\Download
net start wuauserv
net start BITS
shutdown -r -t 60
mshta vbscript:msgbox("��ͨ���޸���ɣ�windows����60�����������ע�Ᵽ���Լ��Ĺ���Ŷ��",64,"tips")(window.close)
cmd /k

:����޸�����
title ����޸����ߣ�3/4��
CLS
echo. ==================================================================================================
echo.
echo.                                            ʹ��˵��
echo. 
echo. �˽׶ν���ȫ����update���
echo.
echo. �޸���ɺ���Զ�����Windows�����û�����ֶ�����������ע�Ᵽ���Լ��Ĺ���
echo.
echo. �������볢�����¸��£�ʧ������Լ��Σ��������ǲ��У��볢�Է����ĵ�2
echo. 
echo. ==================================================================================================
echo.
echo. �����������
pause >nul
CLS
title ����޸����ߣ�4/4��
echo. ==================================================================================================
echo.
echo.                                            ��ʼ�޸�
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
echo.                                            �������
echo. 
echo. �޸��ɹ����롾1�������湤��������
echo.
echo. �޸�ʧ�����롾2��������ģʽ2�����޸�
echo.
echo. �Ժ��ֶ��������롾3��
echo.
echo. ==================================================================================================
echo.
set /p ID=��ѡ��
if "%id%"=="1" goto ����
if "%id%"=="2" goto ģʽ2
IF "%id%"=="3" exit

:ģʽ2
CLS
title ����޸����ߣ�5/5��
echo. ==================================================================================================
echo.
echo.                                            ��ʼģʽ2�޸��׶�
echo. 
Ren %systemroot%\SoftwareDistribution SoftwareDistribution.bak
Ren %systemroot%\system32\catroot2 catroot2.bak
sc.exe sdset bits D:(A;;CCLCSWRPWPDTLOCRRC;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;BA)(A;;CCLCSWLOCRRC;;;AU)(A;;CCLCSWRPWPDTLOCRRC;;;PU)
sc.exe sdset wuauserv D:(A;;CCLCSWRPWPDTLOCRRC;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;BA)(A;;CCLCSWLOCRRC;;;AU)(A;;CCLCSWRPWPDTLOCRRC;;;PU)
echo. ==================================================================================================
echo.
echo.                                            �޸����
echo. 
echo. �޸��ɹ����롾1�������湤��������
echo.
echo. �޸�ʧ�����롾2�������������ĵ�2�ֶ�ִ��
echo.
echo. �Ժ��ֶ��������롾3��
echo.
echo. ==================================================================================================
echo.
set /p ID=��ѡ��
if "%id%"=="1" goto ����
if "%id%"=="2" goto �̳�
IF "%id%"=="3" exit

:����
shutdown -r -t 60
mshta vbscript:msgbox("����޸�����ɣ�windows����60�����������ע�Ᵽ���Լ��Ĺ���Ŷ��",64,"tips")(window.close)
exit

:�̳�
echo. ==================================================================================================
echo.
echo.                                            ���ڴ���ҳ
echo. 
echo. ����������Ƿ��Ѿ���
echo.
echo. δ���볢���ֶ����ʣ�
echo.https://support.microsoft.com/zh-cn/help/971058/how-do-i-reset-windows-update-components
echo.
echo. ==================================================================================================
echo.
explorer "https://support.microsoft.com/zh-cn/help/971058/how-do-i-reset-windows-update-components"
echo. ��������˳�
pause >nul
exit