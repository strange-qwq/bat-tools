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
title FBI WARNING !��1/4��
color 70
mode con lines=30 cols=101
setlocal enabledelayedexpansion
del shutdown.vbs
cls
echo.
echo ��������
echo.
echo ==================================================================================================
echo.
echo.                                             FBI WARNING !
echo.
echo.                                                ���棡
echo.
echo  ����360�����ԹܼҵȰ�ȫ������ѣ��빴ѡ��������Ͳ������ѣ�
echo.
echo  ������ͨ���޸�ע������ʽ�ﵽ��ʾĿ��
echo.
echo  �޸���ɺ���Զ�����Windows�������ӣ����������޷������Ƿ��޸ĳɹ���
echo.
echo  ת���뱣��������Ϣ��Ҳ����ѡ��4��
echo.
echo ��1������
echo.
echo ��2���ܾ�
echo.
echo ��4������
echo.
echo ==================================================================================================
echo.
choice /c 1234 /n /m "��ѡ��"
if "%errorlevel%"=="1" goto 1
if "%errorlevel%"=="2" exit
if "%errorlevel%"=="3" goto del
if "%errorlevel%"=="4" goto help

:1
cls
title �����������steam��ݷ�ʽ By.QWQ��1/4��
echo.
echo.
echo.
echo ==================================================================================================
echo.
echo  ��Ȼ���Ѿ�ͬ��Э�飬��ô���Ǽ���
echo.
echo  ����ϵͳ�汾�����ǵ�ʵ�ַ�ʽ���в�ͬ
echo.
echo  bat���Զ��ж�����ϵͳ�汾
echo.
echo  �����߽�֧������Windows
echo.
echo  1.Windows XP
echo.
echo  2.Windows Vista
echo.
echo  3.Windows 7������
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
echo ���û���Զ���ת��ȷ�����Ƿ������ϲ���ϵͳ����

:win
cls
title ��ѡ������ϵͳ�汾��2.5/4��
echo.
echo.
echo ==================================================================================================
echo.
echo  ��ѡ������ϵͳ�汾������
echo.
echo  1.Windows XP
echo.
echo  2.Windows Vista
echo.
echo  3.Windows 7������
echo.
echo ==================================================================================================
echo.
choice /c 123 /n /m "��ѡ��"
if "%errorlevel%"=="1" goto XP
if "%errorlevel%"=="2" goto Vista
if "%errorlevel%"=="3" goto 7

:XP
cls
title �����������steam��ݷ�ʽ By.QWQ��2/4��
echo.
echo.
echo ==================================================================================================
echo.
echo  ����ϵͳ��Windows XP
echo.
echo  ��ȷ�밴��1��
echo.
echo  �����밴��2��
echo.
echo ==================================================================================================
echo.
choice /c 12 /n /m "��ѡ��"
if "%errorlevel%"=="1" goto XP_start
if "%errorlevel%"=="2" goto win

:Vista
cls
title �����������steam��ݷ�ʽ By.QWQ��2/4��
echo.
echo.
echo ==================================================================================================
echo.
echo  ����ϵͳ��Windows Vista
echo.
echo  ��ȷ�밴��1��
echo.
echo  �����밴��2��
echo.
echo ==================================================================================================
echo.
choice /c 12 /n /m "��ѡ��"
if "%errorlevel%"=="1" goto Vista_start
if "%errorlevel%"=="2" goto win

:7
cls
title �����������steam��ݷ�ʽ By.QWQ��2/4��
echo.
echo.
echo ==================================================================================================
echo.
echo  ����ϵͳ��Windows 7������
echo.
echo  ��ȷ�밴��1��
echo.
echo  �����밴��2��
echo.
echo ==================================================================================================
echo.
choice /c 12 /n /m "��ѡ��"
if "%errorlevel%"=="1" goto 7_start
if "%errorlevel%"=="2" goto win

:XP_start
cls
title �����������steam��ݷ�ʽ By.QWQ��Windows XP_3/4��
echo.
echo ��һ��������steam·��
echo.
echo ==================================================================================================
echo.
echo  ��ʼ����
echo.
set /p steam1=������steam��Ŀ¼·��(G:\steam\steam.exe������дG:\steam)��
set steam2=%steam1:\=\\%
cls
echo.
echo �ڶ���������ע����ļ�
echo.
echo ==================================================================================================
echo.
echo Windows Registry Editor Version 5.00>steam.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel\NameSpace\{b74436e4-f4de-43b4-9363-ac7041edc88b}]>>steam.reg
echo @="�ر��ƹ���">>steam.reg
echo ;By.QWQ>>steam.reg
echo [HKEY_CLASSES_ROOT\CLSID\{b74436e4-f4de-43b4-9363-ac7041edc88b}]>>steam.reg
echo @="steam">>steam.reg
echo "InfoTip"="G�ֵĻ������㳨����">>steam.reg
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
echo �����������
echo.
echo ==================================================================================================
echo.
echo ���������Ĳ�������װ�Ѿ����
echo.
echo ���ס�������˵���Ҳ���ǵ�һ��ҳ�棩��3��ж�ش˹���
echo.
echo 10����Զ������������Թرմ�����ֹ������
echo.
for /L %%a in ( 
10,-1,0 
) do ( 
cls
echo.
echo �����������
echo.
echo ==================================================================================================
echo.
echo ���������Ĳ�������װ�Ѿ����
echo.
echo ���ס�������˵���Ҳ���ǵ�һ��ҳ�棩��3��ж�ش˹���
echo.
echo.
echo %%a����Զ������������Թرմ�����ֹ������ 
echo.
ping -n 2 localhost 1>nul 2>nul 
)
wscript.exe shutdown.vbs
del shutdown.vbs

:Vista_start
cls
title �����������steam��ݷ�ʽ By.QWQ��Windows Vista_3/4��
echo.
echo ��һ��������steam·��
echo.
echo ==================================================================================================
echo.
echo  ��ʼ����
echo.
set /p steam1=������steam��Ŀ¼·��(G:\steam\steam.exe������дG:\steam)��
set steam2=%steam1:\=\\%
cls
echo �ڶ���������ע����ļ�
echo.
echo ==================================================================================================
echo.
echo Windows Registry Editor Version 5.00>steam.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel\NameSpace\{b74436e4-f4de-43b4-9363-ac7041edc88b}]>>steam.reg
echo @="�ر��ƹ���">>steam.reg
echo ;By.QWQ>>steam.reg
echo [HKEY_CLASSES_ROOT\CLSID\{b74436e4-f4de-43b4-9363-ac7041edc88b}]>>steam.reg
echo @="steam">>steam.reg
echo "InfoTip"="G�ֵĻ������㳨����">>steam.reg
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
echo �����������
echo.
echo ==================================================================================================
echo.
echo ���������Ĳ�������װ�Ѿ����
echo.
echo ���ס�������˵���Ҳ���ǵ�һ��ҳ�棩��3��ж�ش˹���
echo.
echo 10����Զ������������Թرմ�����ֹ������
echo.
for /L %%a in ( 
10,-1,0 
) do ( 
cls
echo.
echo �����������
echo.
echo ==================================================================================================
echo.
echo ���������Ĳ�������װ�Ѿ����
echo.
echo ���ס�������˵���Ҳ���ǵ�һ��ҳ�棩��3��ж�ش˹���
echo.
echo.
echo %%a����Զ������������Թرմ�����ֹ������ 
echo.
ping -n 2 localhost 1>nul 2>nul 
)
wscript.exe shutdown.vbs
del shutdown.vbs

:7_start
cls
title �����������steam��ݷ�ʽ By.QWQ��Windows 7_3/4��
echo.
echo ��һ��������steam·��
echo.
echo ==================================================================================================
echo.
echo  ��ʼ����
echo.
set /p steam1=������steam��Ŀ¼·��(G:\steam\steam.exe������дG:\steam)��
set steam2=%steam1:\=\\%
cls
echo �ڶ���������ע����ļ�����װ
echo.
echo ==================================================================================================
echo.
echo Windows Registry Editor Version 5.00>steam.reg
echo.>>steam.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel\NameSpace\{b74436e4-f4de-43b4-9363-ac7041edc88b}]>>steam.reg
echo @="�ر��ƹ���">>steam.reg
echo ;By.QWQ>>steam.reg
echo.>>steam.reg
echo [HKEY_CLASSES_ROOT\CLSID\{b74436e4-f4de-43b4-9363-ac7041edc88b}]>>steam.reg
echo @="steam">>steam.reg
echo "InfoTip"="G�ֵĻ������㳨����">>steam.reg
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
echo �����������
echo.
echo ==================================================================================================
echo.
echo ���������Ĳ�������װ�Ѿ����
echo.
echo ���ס�������˵���Ҳ���ǵ�һ��ҳ�棩��3��ж�ش˹���
echo.
echo 10����Զ������������Թرմ�����ֹ������
echo.
for /L %%a in ( 
10,-1,0 
) do ( 
cls
echo.
echo �����������
echo.
echo ==================================================================================================
echo.
echo ���������Ĳ�������װ�Ѿ����
echo.
echo ���ס�������˵���Ҳ���ǵ�һ��ҳ�棩��3��ж�ش˹���
echo.
echo.
echo %%a����Զ������������Թرմ�����ֹ������ 
echo.
ping -n 2 localhost 1>nul 2>nul 
)
wscript.exe shutdown.vbs
del shutdown.vbs

:del
cls
title ж�س��� By.QWQ
echo.
echo.
echo.
echo ==================================================================================================
echo.
echo �����ڳ���ж�ؿ�������steamѡ�����ȷ���Ƿ������
echo.
echo  ��1������
echo.
echo  ��2��ȡ��
echo.
echo ==================================================================================================
echo.
choice /c 1234 /n /m "��ѡ��"
if "%errorlevel%"=="1" goto del_1
if "%errorlevel%"=="2" goto Admin

:del_1
echo.
echo  steamж�س����ֶ�������
echo.
echo ==================================================================================================
echo.
ceho  ��ʼ�����������ʲô������������������������仰����������
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
echo ж�����
echo.
echo ==================================================================================================
echo.
echo 10����Զ������������Թرմ�����ֹ������
echo.
for /L %%a in ( 
10,-1,0 
) do ( 
cls
echo.
echo ж�����
echo.
echo ==================================================================================================
echo.
echo 10����Զ������������Թرմ�����ֹ������
echo.
ping -n 2 localhost 1>nul 2>nul 
)
wscript.exe shutdown.vbs
del shutdown.vbs

:help
cls
title ���� By.QWQ
ver
echo.
echo ==================================================================================================
echo.
echo.                                             ����
echo.
echo  ������Ϊ@QWQ��������̳�����
echo.
echo  ͨ���޸�ע������ʽ�ﵽ��ʾĿ��
echo.
echo  ת���뱣����������֣�лл
echo.
echo ��1���ص���ҳ
echo.
echo ��2��֧���ĵ�
echo.
echo ==================================================================================================
echo.
choice /c 12 /n /m "��ѡ��"
if "%errorlevel%"=="1" goto Admin
if "%errorlevel%"=="2" goto Support

:Support
cls
title ֧�� By.QWQ
ver
echo.
echo ==================================================================================================
echo.
echo.                                             ֧��
echo.
echo  ԭ��
echo.
echo  ������λ�����ע�������{b74436e4-f4de-43b4-9363-ac7041edc88b}��
echo.
echo  ��A��HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel\NameSpace
echo.
echo  ��B��HKEY_CLASSES_ROOT\CLSID
echo.
echo  �ڡ�B����λ���������Ϣ��
echo.
echo  Ĭ��ֵΪ���֣�
echo.
echo  InfoTipΪ�����������
echo.
echo  System.ControlPanel.CategoryΪ�ڿ��������Щ�ط���ʾ
echo.
echo �ڡ�B����λ�����½�����"DefaultIcon"��"Shell\Open\command"
echo.
echo  ����ͼ������������Ӧ�������ļ���)
echo.
echo ��1���ص���ҳ
echo.
echo ��2���˳�
echo.
echo ==================================================================================================
echo.
choice /c 12 /n /m "��ѡ��"
if "%errorlevel%"=="1" goto Admin
if "%errorlevel%"=="2" exit