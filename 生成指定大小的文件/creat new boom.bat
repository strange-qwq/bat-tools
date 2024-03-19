@echo off
set /p filesize=请输入炸弹文件大小（单位GB）：
::单位从MBytes/GBytes换算成Bytes
for /f %%i in ('powershell -c "%filesize%*1024*1024*1024"') do (
    set filesize2=%%i
)
set filename2=%filesize%
fsutil file createnew "%filename2%" %filesize2%