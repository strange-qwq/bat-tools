@echo off & setlocal enabledelayedexpansion
ver
title Windows 10/11 ����tpm���Ʋ�ǿ�ƽ���Devͨ����By.QWQ��
color 70
mode con lines=30 cols=101
cls
echo.
echo.
echo ==================================================================================================
echo.
echo.                                          QWQ��������ʾ
echo.
echo                                    ��������Ҫ�Թ���ԱȨ������
echo.
echo                  ����һ��֮ǰ��Ҫ�˳�ֱ�ӵ�����Ͻǹرռ��ɣ��ű��������κβ���
echo.
echo.                  Devͨ����bug�϶࣬���Ұ����������գ����鲻Ҫʹ������������
echo.
echo                 �������������ͨ���ȵ�ǰ�汾�����װϵͳ�������޷��л�������ͨ��
echo.
echo                                          ��ȷ��Ҫ������
echo.
echo ==================================================================================================
echo.
pause

cd %~dp0
cls
echo.
echo ���� TPM ���
echo.
echo ==================================================================================================
echo.
echo  ��ʼ����
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
echo ����ע����ļ����Զ�����
echo.
echo ==================================================================================================
echo.
echo  ��ʼ����
echo.
echo Windows Registry Editor Version 5.00>ǿ�ƽ���Devͨ��.reg
echo. >>ǿ�ƽ���Devͨ��.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsSelfHost\Applicability]>>ǿ�ƽ���Devͨ��.reg
echo "BranchName"="Dev">>ǿ�ƽ���Devͨ��.reg
echo "ContentType"="Mainline">>ǿ�ƽ���Devͨ��.reg
echo. >>ǿ�ƽ���Devͨ��.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsSelfHost\UI\Selection]>>ǿ�ƽ���Devͨ��.reg
echo "UIBranch"="Dev">>ǿ�ƽ���Devͨ��.reg
echo "UIContentType"="Mainline">>ǿ�ƽ���Devͨ��.reg
regedit /s ǿ�ƽ���Devͨ��.reg
del ǿ�ƽ���Devͨ��.reg

cls
echo
echo.
echo ==================================================================================================
echo.
echo.                                             ���
echo.
echo.                                �� ���� - Windows���� �����ɣ�
echo.
echo.                �������ʾ������PC������Windows 11�����Ӳ��Ҫ�����ʾ����CPU̫����
echo.
echo                     ����ʾ����Ӱ�첹�����£������ܻᵼ���ղ��� Windows �汾����
echo.
echo                                           ���������
echo.
echo                                    1����������Ԥ������
echo.
echo                    2����ѹ��ɾ��sources\appraiserres.dll�ļ�Ȼ���setup.exe
echo.
echo                                      3����setup.exe
echo.
echo                               4����������İ�װ�������ظ��µķ�ʽ��
echo.
echo                                     5���޸�Ϊ���������ڡ�
echo.
echo                                   6��һֱ��һ����ʼ��װ����
echo.
echo ==================================================================================================
echo.
pause
