@echo off
set /p filesize=������ը���ļ���С����λGB����
::��λ��MBytes/GBytes�����Bytes
for /f %%i in ('powershell -c "%filesize%*1024*1024*1024"') do (
    set filesize2=%%i
)
set filename2=%filesize%
fsutil file createnew "%filename2%" %filesize2%