::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFEoAGVLTAFuzBaEJ+u3o0298fMvds948dYuV07eBQA==
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSDk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSTk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+IeA==
::cxY6rQJ7JhzQF1fEqQJiZksaHErQXA==
::ZQ05rAF9IBncCkqN+0xwdVsGAlTMbCXoZg==
::ZQ05rAF9IAHYFVzEqQK2xtzRpNILwak8+2qaPzN+BSoCfYabuTW5jlZeBlsL9yWWD5KE
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDCWGOCuJDroO/Ovu+4o=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWNxpA8fVzZ6Lr4Fo9Ox99zP2CIg=
::YQ03rBFzNR3SWATEca/Hrf6xydthuYFygXLtbgIbjw==
::dhAmsQZ3MwfNWATEca/Hrf6xydthuYFygXLtbgIbjw==
::ZQ0/vhVqMQ3MEVWAtB9wGSxlLA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFEoAGVLTAE+1BaAR7ebv/Najp1sYWO0vdYrVzogIyTmWLqFjhXARU4qrHiXLifOO9+9p6PLrL7mZM45FsA93NtUOz5dCYKbnnZOtAr8/sK7LkVWGXUbrBalDPssCQCPHCv0Vni7G/uY7Lim380/tKoxCscwUdf1QUvOO
::YB416Ek+ZW8=
::
::
::978f952a14a936cc963da21a135fa983
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
title FBI WARNING !
color 70
mode con lines=35 cols=120
setlocal enabledelayedexpansion
cls
echo.
echo                                             ʹ������
echo.
echo  ==================================================================================================
echo.
echo.                                             Tips
echo.
echo   ����360�����ԹܼҵȰ�ȫ������ѣ��빴ѡ���Σ�����Ͳ������ѣ�
echo.
echo   ������ͨ���޸�ע������ʽ�ﵽ��ʾĿ�ģ����Ա����������ģ�������
echo.
echo   ��ʵ�ڲ����Ŀɽ���鿴Դ�룬�����к�����
echo.
echo   ��1������
echo.
echo   ��2���ܾ�
echo.
echo  ==================================================================================================
echo.
choice /c 12 /n /m "��ѡ��"
if "%errorlevel%"=="1" goto menu
if "%errorlevel%"=="2" exit

:menu
cls
title ��ӭʹ�ÿ��������ӿ�ݷ�ʽ���ߣ�By.QWQ��
echo.
echo                                              ���˵�
echo.
echo  ==================================================================================================
echo.
echo   ע�⣺ѡ��1ֻ�����һ�Σ�������������ܻḲ�ǻ�����δ֪����
echo.
echo  ��1�������һ����ݷ�ʽ
echo.
echo  ��2����Ӷ����ݷ�ʽ
echo.
echo  ��3��ɾ��һ����ݷ�ʽ
echo.
echo  ��4������
echo.
echo  ==================================================================================================
echo.
choice /c 1234 /n /m "��ѡ��"
if "%errorlevel%"=="1" goto fast
if "%errorlevel%"=="2" goto senior
if "%errorlevel%"=="3" goto del
if "%errorlevel%"=="4" goto help

:senior
cls
title �����������ĳ�����ݷ�ʽ By.QWQ��senior_1/8��
echo.
echo ��һ��������GUID
echo.
echo ==================================================================================================
echo.
echo  ������Զ���ϵͳĬ�������������ָ����ҳ����GUID
echo.
echo  ������:5409ced9-4506-4a2e-9cbd-5cb22be7e5d6
echo.
echo  ������:5409ced9-4506-4a2e-9cbd-5cb22be7e5d6
echo.
echo  ���ס���GUID��ɾ��ʱ��Ҫ��GUID
echo.
ping -n 3 127.0.0.1>nul
start https://www.guidgen.com/
echo https://www.guidgen.com/ >copy.txt
clip < copy.txt
del copy.txt
echo �����ѽ���ַ���������а壬��ȷ����ҳ�Ƿ��Ѿ��򿪣���δ�����ֶ����������ճ����ַ
echo.
echo �����а������κ����ݣ����ֶ����ƴ򿪣�https://www.guidgen.com/
echo.
set /p guid=��ָ���ó����GUID��
cls
title �����������ĳ�����ݷ�ʽ By.QWQ��senior_2/8��
echo.
echo �ڶ������������·��
echo.
echo ==================================================================================================
echo.
echo.
echo.
set /p path1=������ó�������·��(�磺"C:\Windows\explorer.exe"����������)��
set path2=%path1:\=\\%
cls
title �����������ĳ�����ݷ�ʽ By.QWQ��senior_3/8��
echo.
echo ����������������
echo.
echo ==================================================================================================
echo.
echo.
echo.
set /p name=�������ݷ�ʽ�����֣�
cls
title �����������ĳ�����ݷ�ʽ By.QWQ��senior_4/8��
echo.
echo ���Ĳ����������������ʾ����
echo.
echo ==================================================================================================
echo.
echo tips�������������ָ���ָ���ݷ�ʽ����������Ⱥ������ʾ������
echo.
set /p info=����������������֣�
cls
title �����������ĳ�����ݷ�ʽ By.QWQ��senior_5/8��
echo.
echo ���岽��ѡ����ʾλ�ã����ࣩ
echo.
echo   ==================================================================================================
echo.
echo   ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo   +ID +          Windows XP        +     Windows Vista      +         Windows 7�����          +
echo   ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo   + 0 +      �����������ѡ��      +        ����ѡ��        +        ���п��������Ŀ          +
echo   ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo   + 1 +         ��ۺ�����         +      ��ۺ͸��Ի�      +          ��ۺ͸��Ի�            +
echo   ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo   + 2 +      ��ӡ��������Ӳ��      +       Ӳ��������       +           Ӳ��������             +
echo   ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo   + 3 +     �����Internet����     +     �����Internet     +         �����Internet           +
echo   ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo   + 4 +    ��������������Ƶ�豸    +        ��2�ϲ�         +            ��2�ϲ�               +
echo   ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo   + 5 +         ���ܺ�ά��         +       ϵͳ��ά��       +           ϵͳ�Ͱ�ȫ             +
echo   ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo   + 6 + ���ڡ�ʱ�䡢���Ժ��������� +    ʱ�䡢���Ժ�����    + ʱ�䡢���Ժ����򣨻�ʱ������� +
echo   ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo   + 7 +        ��������ѡ��        +        ���ɷ���        +            ���ɷ���              +
echo   ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo   + 8 +       ��ӻ�ɾ������       +          ����          +              ����                +
echo   ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo   + 9 +          �û��˻�          +        �û��˻�        +            �û��˻�              +
echo   ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo   +10 +          ��ȫ����          +          ��ȫ          +            ��5�ϲ�               +
echo   ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo   +11 +             ��             +    Windows�ƶ�����     +            ��0�ϲ�               +
echo   ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo.
set /p position=��������ʾλ�ã�������0~9�Ĵ����֣����ж������Ӣ�ﶺ��(,)��������
cls
title �����������ĳ�����ݷ�ʽ By.QWQ��senior_6/8��
echo.
echo ������������ע����ļ�
echo.
echo ==================================================================================================
echo.
echo.
echo.
echo Windows Registry Editor Version 5.00>addShortcuts.reg
echo.>>addShortcuts.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel\NameSpace\{%guid%}]>>addShortcuts.reg
echo @="�ر��ƹ���">>addShortcuts.reg
echo ;By.QWQ>>addShortcuts.reg
echo.>>addShortcuts.reg
echo [HKEY_CLASSES_ROOT\CLSID\{%guid%}]>>addShortcuts.reg
echo @="%name%">>addShortcuts.reg
echo "InfoTip"="%info%">>addShortcuts.reg
echo "System.ControlPanel.Category"="%position%">>addShortcuts.reg
echo.>>addShortcuts.reg
echo [HKEY_CLASSES_ROOT\CLSID\{%guid%}\DefaultIcon]>>addShortcuts.reg
echo @="%path2%">>addShortcuts.reg
echo ;By.QWQ>>addShortcuts.reg
echo.>>addShortcuts.reg
echo [HKEY_CLASSES_ROOT\CLSID\{%guid%}\Shell\Open\command]>>addShortcuts.reg
echo @="%path2%">>addShortcuts.reg
cls
title �����������ĳ�����ݷ�ʽ By.QWQ��senior_7/8��
echo.
echo ���߲�������ע���
echo.
echo ==================================================================================================
echo.
echo.
echo.
regedit /s addShortcuts.reg
del addShortcuts.reg
cls
title �����������ĳ�����ݷ�ʽ By.QWQ��senior_8/8��
echo.
echo �ڰ˲������
echo.
echo ==================================================================================================
echo.
echo �Ѿ������Ӳ���ʾ������壬����δ��ʾ����������
echo.
echo  ��1����������
echo.
echo  ��2���������
echo.
echo  ��3��������ҳ
echo.
echo ==================================================================================================
echo.
start C:\WINDOWS\system32\control.exe
choice /c 123 /n /m "��ѡ��"
if "%errorlevel%"=="1" goto reboot
if "%errorlevel%"=="2" goto senior
if "%errorlevel%"=="3" goto menu

:reboot
shutdown /r /t 0
exit

:fast
cls
title �����������ĳ�����ݷ�ʽ By.QWQ��fast_1/4��
echo.
echo  �ж�ϵͳ�汾�С�����
echo.
echo ==================================================================================================
echo.
echo  ����ϵͳ�汾�����ǵ�ʵ�ַ�ʽ���в�ͬ
echo.
echo  bat���Զ��ж�����ϵͳ�汾
echo.
echo  �����߽�֧������Windows�汾��
echo.
echo  Windows XP
echo.
echo  Windows Vista
echo.
echo  Windows 7������
echo.
echo ==================================================================================================
echo.
ver | find "5.1." > NUL &&  goto XP_start
ver | find "5.2." > NUL &&  goto XP_start
ver | find "6.0." > NUL &&  goto Vista_start
ver | find "6.1." > NUL &&  goto 7_start
ver | find "6.2." > NUL &&  goto 7_start
ver | find "6.3." > NUL &&  goto 7_start
ver | find "10.0." > NUL &&  goto 7_start
echo ���û���Զ���ת��ȷ�����Ƿ������ϲ���ϵͳ����

:XP_start
cls
title �����������ĳ�����ݷ�ʽ By.QWQ��fast_Windows XP_3/4��
echo.
echo ��һ�����������·��
echo.
echo ==================================================================================================
echo.
echo.
echo.
set /p exe1=������ó�������·��(�磺"C:\Windows\explorer.exe"����������)��
set path2=%path1:\=\\%
cls
echo.
echo �ڶ�������������
echo.
echo ==================================================================================================
echo.
echo.
echo.
set /p name=�������ݷ�ʽ�����֣�
cls
echo.
echo ���������������������ʾ����
echo.
echo ==================================================================================================
echo.
echo tips�������������ָ���ָ���ݷ�ʽ����������Ⱥ������ʾ������
echo.
set /p info=����������������֣�
cls
echo.
echo ������������ע����ļ�
echo.
echo ==================================================================================================
echo.
echo.
echo.
echo Windows Registry Editor Version 5.00>addShortcuts.reg
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel\NameSpace\{a199f672-057d-4b0e-b169-d0b2b10fc0f2}]>>addShortcuts.reg
echo @="�ر��ƹ���">>addShortcuts.reg
echo ;By.QWQ>>addShortcuts.reg
echo.>>addShortcuts.reg
echo [HKEY_CLASSES_ROOT\CLSID\{a199f672-057d-4b0e-b169-d0b2b10fc0f2}]>>addShortcuts.reg
echo @="%name%">>addShortcuts.reg
echo "InfoTip"="%info%">>addShortcuts.reg
echo "System.ControlPanel.Category"="0,5">>addShortcuts.reg
echo.>>addShortcuts.reg
echo [HKEY_CLASSES_ROOT\CLSID\{a199f672-057d-4b0e-b169-d0b2b10fc0f2}\DefaultIcon]>>addShortcuts.reg
echo @="%path2%">>addShortcuts.reg
echo ;By.QWQ>>addShortcuts.reg
echo.>>addShortcuts.reg
echo [HKEY_CLASSES_ROOT\CLSID\{a199f672-057d-4b0e-b169-d0b2b10fc0f2}\Shell\Open\command]>>addShortcuts.reg
echo @="%path2%">>addShortcuts.reg
cls
echo.
echo ���Ĳ�������ע���
echo.
echo ==================================================================================================
echo.
echo.
echo.
regedit /s addShortcuts.reg
del addShortcuts.reg
cls
echo.
echo ���岽�����
echo.
echo ==================================================================================================
echo.
echo �Ѿ������Ӳ���ʾ������壬����δ��ʾ����������
echo.
echo  ��1����������
echo.
echo  ��2��������ҳ
echo.
echo ==================================================================================================
echo.
start C:\WINDOWS\system32\control.exe
choice /c 12 /n /m "��ѡ��"
if "%errorlevel%"=="1" goto reboot
if "%errorlevel%"=="2" goto menu

:Vista_start
cls
title �����������ĳ�����ݷ�ʽ By.QWQ��fast_Windows Vista_3/4��
echo.
echo ��һ�����������·��
echo.
echo ==================================================================================================
echo.
echo.
echo.
set /p path1=������ó�������·��(�磺"C:\Windows\explorer.exe"����������)��
set path2=%path1:\=\\%
cls
echo.
echo �ڶ�������������
echo.
echo ==================================================================================================
echo.
echo.
echo.
set /p name=�������ݷ�ʽ�����֣�
cls
echo.
echo ���������������������ʾ����
echo.
echo ==================================================================================================
echo.
echo tips�������������ָ���ָ���ݷ�ʽ����������Ⱥ������ʾ������
echo.
set /p info=����������������֣�
cls
echo.
echo ������������ע����ļ�
echo.
echo ==================================================================================================
echo.
echo Windows Registry Editor Version 5.00>addShortcuts.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel\NameSpace\{a199f672-057d-4b0e-b169-d0b2b10fc0f2}]>>addShortcuts.reg
echo @="�ر��ƹ���">>addShortcuts.reg
echo ;By.QWQ>>addShortcuts.reg
echo.>>addShortcuts.reg
echo [HKEY_CLASSES_ROOT\CLSID\{a199f672-057d-4b0e-b169-d0b2b10fc0f2}]>>addShortcuts.reg
echo @="%name%">>addShortcuts.reg
echo "InfoTip"="%info%">>addShortcuts.reg
echo "System.ControlPanel.Category"="0,5,7,8">>addShortcuts.reg
echo.>>addShortcuts.reg
echo [HKEY_CLASSES_ROOT\CLSID\{a199f672-057d-4b0e-b169-d0b2b10fc0f2}\DefaultIcon]>>addShortcuts.reg
echo @="%path2%">>addShortcuts.reg
echo ;By.QWQ>>addShortcuts.reg
echo.>>addShortcuts.reg
echo [HKEY_CLASSES_ROOT\CLSID\{a199f672-057d-4b0e-b169-d0b2b10fc0f2}\Shell\Open\command]>>addShortcuts.reg
echo @="%path2%">>addShortcuts.reg
cls
echo.
echo ���Ĳ�������ע���
echo.
echo ==================================================================================================
echo.
echo.
echo.
regedit /s addShortcuts.reg
del addShortcuts.reg
cls
echo.
echo ���岽�����
echo.
echo ==================================================================================================
echo.
echo �Ѿ������Ӳ���ʾ������壬����δ��ʾ����������
echo.
echo  ��1����������
echo.
echo  ��2��������ҳ
echo.
echo ==================================================================================================
echo.
start C:\WINDOWS\system32\control.exe
choice /c 12 /n /m "��ѡ��"
if "%errorlevel%"=="1" goto reboot
if "%errorlevel%"=="2" goto menu

:7_start
cls
title �����������ĳ�����ݷ�ʽ By.QWQ��fast_Windows 7_3/4��
echo.
echo ��һ�����������·��
echo.
echo ==================================================================================================
echo.
echo.
echo.
set /p path1=������ó�������·��(�磺"C:\Windows\explorer.exe"����������)��
set path2=%path1:\=\\%
cls
echo.
echo �ڶ�������������
echo.
echo ==================================================================================================
echo.
echo.
echo.
set /p name=�������ݷ�ʽ�����֣�
cls
echo.
echo ���������������������ʾ����
echo.
echo ==================================================================================================
echo.
echo tips�������������ָ���ָ���ݷ�ʽ����������Ⱥ������ʾ������
echo.
set /p info=����������������֣�
cls
echo.
echo ������������ע����ļ�
echo.
echo ==================================================================================================
echo.
echo Windows Registry Editor Version 5.00>addShortcuts.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel\NameSpace\{a199f672-057d-4b0e-b169-d0b2b10fc0f2}]>>addShortcuts.reg
echo @="�ر��ƹ���">>addShortcuts.reg
echo ;By.QWQ>>addShortcuts.reg
echo.>>addShortcuts.reg
echo [HKEY_CLASSES_ROOT\CLSID\{a199f672-057d-4b0e-b169-d0b2b10fc0f2}]>>addShortcuts.reg
echo @="%name%">>addShortcuts.reg
echo "InfoTip"="%info%">>addShortcuts.reg
echo "System.ControlPanel.Category"="0">>addShortcuts.reg
echo.>>addShortcuts.reg
echo [HKEY_CLASSES_ROOT\CLSID\{a199f672-057d-4b0e-b169-d0b2b10fc0f2}\DefaultIcon]>>addShortcuts.reg
echo @="%path2%">>addShortcuts.reg
echo ;By.QWQ>>addShortcuts.reg
echo.>>addShortcuts.reg
echo [HKEY_CLASSES_ROOT\CLSID\{a199f672-057d-4b0e-b169-d0b2b10fc0f2}\Shell\Open\command]>>addShortcuts.reg
echo @="%path2%">>addShortcuts.reg
cls
echo.
echo ���Ĳ�������ע���
echo.
echo ==================================================================================================
echo.
echo.
echo.
regedit /s addShortcuts.reg
del addShortcuts.reg
cls
echo.
echo ���岽�����
echo.
echo ==================================================================================================
echo.
echo �Ѿ������Ӳ���ʾ������壬����δ��ʾ����������
echo.
echo  ��1����������
echo.
echo  ��2��������ҳ
echo.
echo ==================================================================================================
echo.
start C:\WINDOWS\system32\control.exe
choice /c 12 /n /m "��ѡ��"
if "%errorlevel%"=="1" goto reboot
if "%errorlevel%"=="2" goto menu

:del
cls
title ɾ����ݷ�ʽ By.QWQ
echo.
echo  ɾ����ݷ�ʽ
echo.
echo ==================================================================================================
echo.
echo ��ѡ��װʱѡ��ķ�ʽ��
echo.
echo  ��1�������һ����ݷ�ʽ
echo.
echo  ��2����Ӷ����ݷ�ʽ
echo.
echo  ��3��ȡ��
echo.
echo ==================================================================================================
echo.
choice /c 12 /n /m "��ѡ��"
if "%errorlevel%"=="1" goto fast_del
if "%errorlevel%"=="2" goto senior_del

:fast_del
cls
echo.
echo  ɾ����ݷ�ʽ
echo.
echo ==================================================================================================
echo.
echo  ��ʼ�����������ʲô������������������������仰����������
echo Windows Registry Editor Version 5.00>delShortcuts.reg
echo [-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel\NameSpace\{a199f672-057d-4b0e-b169-d0b2b10fc0f2}]>>delShortcuts.reg
echo [-HKEY_CLASSES_ROOT\CLSID\{a199f672-057d-4b0e-b169-d0b2b10fc0f2}]>>delShortcuts.reg
regedit /s delShortcuts.reg
del delShortcuts.reg
cls
title ɾ����ݷ�ʽ��� By.QWQ
echo.
echo ɾ����ݷ�ʽ���
echo.
echo ==================================================================================================
echo.
echo ɾ����ݷ�ʽ��ɣ����������壬������Ҫ�������Բ�����Ч
echo.
echo  ��1����������
echo.
echo  ��2��������ҳ
echo.
echo ==================================================================================================
echo.
start C:\WINDOWS\system32\control.exe
choice /c 12 /n /m "��ѡ��"
if "%errorlevel%"=="1" goto reboot
if "%errorlevel%"=="2" goto menu

:senior_del
cls
echo.
echo  ɾ����ݷ�ʽ
echo.
echo ��һ��������GUID
echo.
echo ==================================================================================================
echo.
echo  �������㰲װʱ�����GUID
echo.
echo  ��������
echo.
echo  ��ɾ��ϵͳ��GUID����Ը�
echo.
set /p del_guid=������GUID��
cls
echo.
echo  ɾ����ݷ�ʽ By.QWQ
echo.
echo ==================================================================================================
echo.
echo  ��ʼ�����������ʲô������������������������仰����������
echo Windows Registry Editor Version 5.00>delShortcuts.reg
echo.>>delShortcuts.reg
echo [-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel\NameSpace\{%del_guid%}]>>delShortcuts.reg
echo.>>delShortcuts.reg
echo [-HKEY_CLASSES_ROOT\CLSID\{%del_guid%}]>>delShortcuts.reg
echo.>>delShortcuts.reg
regedit /s delShortcuts.reg
del delShortcuts.reg
cls
title ɾ����ݷ�ʽ��� By.QWQ
echo.
echo  ɾ����ݷ�ʽ
echo.
echo ==================================================================================================
echo.
echo ɾ����ݷ�ʽ��ɣ����������壬������Ҫ�������Բ�����Ч
echo.
echo  ��1����������
echo.
echo  ��2��ɾ������
echo.
echo  ��3��������ҳ
echo.
echo ==================================================================================================
echo.
start C:\WINDOWS\system32\control.exe
choice /c 123 /n /m "��ѡ��"
if "%errorlevel%"=="1" goto reboot
if "%errorlevel%"=="2" goto senior_del
if "%errorlevel%"=="3" goto menu

:help
cls
title ���� By.QWQ
ver
echo.
echo ==================================================================================================
echo.
echo.                                             ����
echo.
echo  ����QQ��1456158721
echo.
echo  ����ͨ���޸�ע����Դﵽ��ʾĿ��
echo.
echo  �����������
echo.
echo ��1���ص���ҳ
echo.
echo ��2���˳�
echo.
echo ==================================================================================================
echo.
choice /c 12 /n /m "��ѡ��"
if "%errorlevel%"=="1" goto menu
if "%errorlevel%"=="2" exit