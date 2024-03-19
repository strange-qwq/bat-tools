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
title FBI WARNING !
color 70
mode con lines=35 cols=120
setlocal enabledelayedexpansion
cls
echo.
echo                                             使用声明
echo.
echo  ==================================================================================================
echo.
echo.                                             Tips
echo.
echo   如有360、电脑管家等安全软件提醒，请勾选信任，允许和不再提醒！
echo.
echo   本工具通过修改注册表的形式达到显示目的，所以报毒是正常的，属于误报
echo.
echo   若实在不放心可解包查看源码，绝无有害代码
echo.
echo   【1】继续
echo.
echo   【2】拒绝
echo.
echo  ==================================================================================================
echo.
choice /c 12 /n /m "请选择"
if "%errorlevel%"=="1" goto menu
if "%errorlevel%"=="2" exit

:menu
cls
title 欢迎使用控制面板添加快捷方式工具（By.QWQ）
echo.
echo                                              主菜单
echo.
echo  ==================================================================================================
echo.
echo   注意：选项1只能添加一次，若多次添加则可能会覆盖或引发未知错误
echo.
echo  【1】仅添加一个快捷方式
echo.
echo  【2】添加多个快捷方式
echo.
echo  【3】删除一个快捷方式
echo.
echo  【4】关于
echo.
echo  ==================================================================================================
echo.
choice /c 1234 /n /m "请选择"
if "%errorlevel%"=="1" goto fast
if "%errorlevel%"=="2" goto senior
if "%errorlevel%"=="3" goto del
if "%errorlevel%"=="4" goto help

:senior
cls
title 向控制面板添加某程序快捷方式 By.QWQ（senior_1/8）
echo.
echo 第一步：输入GUID
echo.
echo ==================================================================================================
echo.
echo  三秒后将自动打开系统默认浏览器并进入指定网页生成GUID
echo.
echo  如生成:5409ced9-4506-4a2e-9cbd-5cb22be7e5d6
echo.
echo  则输入:5409ced9-4506-4a2e-9cbd-5cb22be7e5d6
echo.
echo  请记住这个GUID，删除时需要此GUID
echo.
ping -n 3 127.0.0.1>nul
start https://www.guidgen.com/
echo https://www.guidgen.com/ >copy.txt
clip < copy.txt
del copy.txt
echo 工具已将网址复制至剪切板，请确认网页是否已经打开，如未打开请手动打开浏览器并粘贴网址
echo.
echo 若剪切板内无任何数据，请手动复制打开：https://www.guidgen.com/
echo.
set /p guid=请指定该程序的GUID：
cls
title 向控制面板添加某程序快捷方式 By.QWQ（senior_2/8）
echo.
echo 第二步：导入程序路径
echo.
echo ==================================================================================================
echo.
echo.
echo.
set /p path1=请输入该程序所在路径(如："C:\Windows\explorer.exe"，不用引号)：
set path2=%path1:\=\\%
cls
title 向控制面板添加某程序快捷方式 By.QWQ（senior_3/8）
echo.
echo 第三步：输入名称
echo.
echo ==================================================================================================
echo.
echo.
echo.
set /p name=请输入快捷方式的名字：
cls
title 向控制面板添加某程序快捷方式 By.QWQ（senior_4/8）
echo.
echo 第四步：输入鼠标悬浮显示文字
echo.
echo ==================================================================================================
echo.
echo tips：鼠标悬浮文字指鼠标指向快捷方式但不点击，等候几秒才显示的文字
echo.
set /p info=请输入鼠标悬浮文字：
cls
title 向控制面板添加某程序快捷方式 By.QWQ（senior_5/8）
echo.
echo 第五步：选择显示位置（分类）
echo.
echo   ==================================================================================================
echo.
echo   ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo   +ID +          Windows XP        +     Windows Vista      +         Windows 7或更高          +
echo   ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo   + 0 +      其它控制面板选项      +        附加选项        +        所有控制面板项目          +
echo   ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo   + 1 +         外观和主题         +      外观和个性化      +          外观和个性化            +
echo   ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo   + 2 +      打印机和其它硬件      +       硬件和声音       +           硬件和声音             +
echo   ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo   + 3 +     网络和Internet连接     +     网络和Internet     +         网络和Internet           +
echo   ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo   + 4 +    声音、语音和音频设备    +        与2合并         +            与2合并               +
echo   ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo   + 5 +         性能和维护         +       系统和维护       +           系统和安全             +
echo   ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo   + 6 + 日期、时间、语言和区域设置 +    时间、语言和区域    + 时间、语言和区域（或时间和区域） +
echo   ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo   + 7 +        辅助功能选项        +        轻松访问        +            轻松访问              +
echo   ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo   + 8 +       添加或删除程序       +          程序          +              程序                +
echo   ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo   + 9 +          用户账户          +        用户账户        +            用户账户              +
echo   ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo   +10 +          安全中心          +          安全          +            与5合并               +
echo   ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo   +11 +             无             +    Windows移动中心     +            与0合并               +
echo   ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo.
set /p position=请输入显示位置（请输入0~9的纯数字，如有多个请用英语逗号(,)隔开）：
cls
title 向控制面板添加某程序快捷方式 By.QWQ（senior_6/8）
echo.
echo 第六步：生成注册表文件
echo.
echo ==================================================================================================
echo.
echo.
echo.
echo Windows Registry Editor Version 5.00>addShortcuts.reg
echo.>>addShortcuts.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel\NameSpace\{%guid%}]>>addShortcuts.reg
echo @="特别定制功能">>addShortcuts.reg
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
title 向控制面板添加某程序快捷方式 By.QWQ（senior_7/8）
echo.
echo 第七步：加入注册表
echo.
echo ==================================================================================================
echo.
echo.
echo.
regedit /s addShortcuts.reg
del addShortcuts.reg
cls
title 向控制面板添加某程序快捷方式 By.QWQ（senior_8/8）
echo.
echo 第八步：完成
echo.
echo ==================================================================================================
echo.
echo 已经完成添加并显示控制面板，若仍未显示请重启电脑
echo.
echo  【1】立即重启
echo.
echo  【2】继续添加
echo.
echo  【3】返回主页
echo.
echo ==================================================================================================
echo.
start C:\WINDOWS\system32\control.exe
choice /c 123 /n /m "请选择"
if "%errorlevel%"=="1" goto reboot
if "%errorlevel%"=="2" goto senior
if "%errorlevel%"=="3" goto menu

:reboot
shutdown /r /t 0
exit

:fast
cls
title 向控制面板添加某程序快捷方式 By.QWQ（fast_1/4）
echo.
echo  判断系统版本中。。。
echo.
echo ==================================================================================================
echo.
echo  跟据系统版本，我们的实现方式稍有不同
echo.
echo  bat将自动判断您的系统版本
echo.
echo  本工具仅支持以下Windows版本：
echo.
echo  Windows XP
echo.
echo  Windows Vista
echo.
echo  Windows 7及以上
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
echo 如果没有自动跳转请确认您是否在以上操作系统当中

:XP_start
cls
title 向控制面板添加某程序快捷方式 By.QWQ（fast_Windows XP_3/4）
echo.
echo 第一步：导入程序路径
echo.
echo ==================================================================================================
echo.
echo.
echo.
set /p exe1=请输入该程序所在路径(如："C:\Windows\explorer.exe"，不用引号)：
set path2=%path1:\=\\%
cls
echo.
echo 第二步：输入名称
echo.
echo ==================================================================================================
echo.
echo.
echo.
set /p name=请输入快捷方式的名字：
cls
echo.
echo 第三步：输入鼠标悬浮显示文字
echo.
echo ==================================================================================================
echo.
echo tips：鼠标悬浮文字指鼠标指向快捷方式但不点击，等候几秒才显示的文字
echo.
set /p info=请输入鼠标悬浮文字：
cls
echo.
echo 第三步：生成注册表文件
echo.
echo ==================================================================================================
echo.
echo.
echo.
echo Windows Registry Editor Version 5.00>addShortcuts.reg
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel\NameSpace\{a199f672-057d-4b0e-b169-d0b2b10fc0f2}]>>addShortcuts.reg
echo @="特别定制功能">>addShortcuts.reg
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
echo 第四步：加入注册表
echo.
echo ==================================================================================================
echo.
echo.
echo.
regedit /s addShortcuts.reg
del addShortcuts.reg
cls
echo.
echo 第五步：完成
echo.
echo ==================================================================================================
echo.
echo 已经完成添加并显示控制面板，若仍未显示请重启电脑
echo.
echo  【1】立即重启
echo.
echo  【2】返回主页
echo.
echo ==================================================================================================
echo.
start C:\WINDOWS\system32\control.exe
choice /c 12 /n /m "请选择"
if "%errorlevel%"=="1" goto reboot
if "%errorlevel%"=="2" goto menu

:Vista_start
cls
title 向控制面板添加某程序快捷方式 By.QWQ（fast_Windows Vista_3/4）
echo.
echo 第一步：导入程序路径
echo.
echo ==================================================================================================
echo.
echo.
echo.
set /p path1=请输入该程序所在路径(如："C:\Windows\explorer.exe"，不用引号)：
set path2=%path1:\=\\%
cls
echo.
echo 第二步：输入名称
echo.
echo ==================================================================================================
echo.
echo.
echo.
set /p name=请输入快捷方式的名字：
cls
echo.
echo 第三步：输入鼠标悬浮显示文字
echo.
echo ==================================================================================================
echo.
echo tips：鼠标悬浮文字指鼠标指向快捷方式但不点击，等候几秒才显示的文字
echo.
set /p info=请输入鼠标悬浮文字：
cls
echo.
echo 第三步：生成注册表文件
echo.
echo ==================================================================================================
echo.
echo Windows Registry Editor Version 5.00>addShortcuts.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel\NameSpace\{a199f672-057d-4b0e-b169-d0b2b10fc0f2}]>>addShortcuts.reg
echo @="特别定制功能">>addShortcuts.reg
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
echo 第四步：加入注册表
echo.
echo ==================================================================================================
echo.
echo.
echo.
regedit /s addShortcuts.reg
del addShortcuts.reg
cls
echo.
echo 第五步：完成
echo.
echo ==================================================================================================
echo.
echo 已经完成添加并显示控制面板，若仍未显示请重启电脑
echo.
echo  【1】立即重启
echo.
echo  【2】返回主页
echo.
echo ==================================================================================================
echo.
start C:\WINDOWS\system32\control.exe
choice /c 12 /n /m "请选择"
if "%errorlevel%"=="1" goto reboot
if "%errorlevel%"=="2" goto menu

:7_start
cls
title 向控制面板添加某程序快捷方式 By.QWQ（fast_Windows 7_3/4）
echo.
echo 第一步：导入程序路径
echo.
echo ==================================================================================================
echo.
echo.
echo.
set /p path1=请输入该程序所在路径(如："C:\Windows\explorer.exe"，不用引号)：
set path2=%path1:\=\\%
cls
echo.
echo 第二步：输入名称
echo.
echo ==================================================================================================
echo.
echo.
echo.
set /p name=请输入快捷方式的名字：
cls
echo.
echo 第三步：输入鼠标悬浮显示文字
echo.
echo ==================================================================================================
echo.
echo tips：鼠标悬浮文字指鼠标指向快捷方式但不点击，等候几秒才显示的文字
echo.
set /p info=请输入鼠标悬浮文字：
cls
echo.
echo 第三步：生成注册表文件
echo.
echo ==================================================================================================
echo.
echo Windows Registry Editor Version 5.00>addShortcuts.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel\NameSpace\{a199f672-057d-4b0e-b169-d0b2b10fc0f2}]>>addShortcuts.reg
echo @="特别定制功能">>addShortcuts.reg
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
echo 第四步：加入注册表
echo.
echo ==================================================================================================
echo.
echo.
echo.
regedit /s addShortcuts.reg
del addShortcuts.reg
cls
echo.
echo 第五步：完成
echo.
echo ==================================================================================================
echo.
echo 已经完成添加并显示控制面板，若仍未显示请重启电脑
echo.
echo  【1】立即重启
echo.
echo  【2】返回主页
echo.
echo ==================================================================================================
echo.
start C:\WINDOWS\system32\control.exe
choice /c 12 /n /m "请选择"
if "%errorlevel%"=="1" goto reboot
if "%errorlevel%"=="2" goto menu

:del
cls
title 删除快捷方式 By.QWQ
echo.
echo  删除快捷方式
echo.
echo ==================================================================================================
echo.
echo 请选择安装时选择的方式：
echo.
echo  【1】仅添加一个快捷方式
echo.
echo  【2】添加多个快捷方式
echo.
echo  【3】取消
echo.
echo ==================================================================================================
echo.
choice /c 12 /n /m "请选择"
if "%errorlevel%"=="1" goto fast_del
if "%errorlevel%"=="2" goto senior_del

:fast_del
cls
echo.
echo  删除快捷方式
echo.
echo ==================================================================================================
echo.
echo  开始操作（你可能什么都看不到，正常情况你可能这句话都看不到）
echo Windows Registry Editor Version 5.00>delShortcuts.reg
echo [-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel\NameSpace\{a199f672-057d-4b0e-b169-d0b2b10fc0f2}]>>delShortcuts.reg
echo [-HKEY_CLASSES_ROOT\CLSID\{a199f672-057d-4b0e-b169-d0b2b10fc0f2}]>>delShortcuts.reg
regedit /s delShortcuts.reg
del delShortcuts.reg
cls
title 删除快捷方式完成 By.QWQ
echo.
echo 删除快捷方式完成
echo.
echo ==================================================================================================
echo.
echo 删除快捷方式完成，请检查控制面板，可能需要重启电脑才能生效
echo.
echo  【1】重启电脑
echo.
echo  【2】返回主页
echo.
echo ==================================================================================================
echo.
start C:\WINDOWS\system32\control.exe
choice /c 12 /n /m "请选择"
if "%errorlevel%"=="1" goto reboot
if "%errorlevel%"=="2" goto menu

:senior_del
cls
echo.
echo  删除快捷方式
echo.
echo 第一步：输入GUID
echo.
echo ==================================================================================================
echo.
echo  请输入你安装时输入的GUID
echo.
echo  请勿乱填
echo.
echo  若删到系统的GUID后果自负
echo.
set /p del_guid=请输入GUID：
cls
echo.
echo  删除快捷方式 By.QWQ
echo.
echo ==================================================================================================
echo.
echo  开始操作（你可能什么都看不到，正常情况你可能这句话都看不到）
echo Windows Registry Editor Version 5.00>delShortcuts.reg
echo.>>delShortcuts.reg
echo [-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel\NameSpace\{%del_guid%}]>>delShortcuts.reg
echo.>>delShortcuts.reg
echo [-HKEY_CLASSES_ROOT\CLSID\{%del_guid%}]>>delShortcuts.reg
echo.>>delShortcuts.reg
regedit /s delShortcuts.reg
del delShortcuts.reg
cls
title 删除快捷方式完成 By.QWQ
echo.
echo  删除快捷方式
echo.
echo ==================================================================================================
echo.
echo 删除快捷方式完成，请检查控制面板，可能需要重启电脑才能生效
echo.
echo  【1】立即重启
echo.
echo  【2】删除其它
echo.
echo  【3】返回主页
echo.
echo ==================================================================================================
echo.
start C:\WINDOWS\system32\control.exe
choice /c 123 /n /m "请选择"
if "%errorlevel%"=="1" goto reboot
if "%errorlevel%"=="2" goto senior_del
if "%errorlevel%"=="3" goto menu

:help
cls
title 关于 By.QWQ
ver
echo.
echo ==================================================================================================
echo.
echo.                                             关于
echo.
echo  作者QQ：1456158721
echo.
echo  工具通过修改注册表以达到显示目的
echo.
echo  请勿二次售卖
echo.
echo 【1】回到主页
echo.
echo 【2】退出
echo.
echo ==================================================================================================
echo.
choice /c 12 /n /m "请选择"
if "%errorlevel%"=="1" goto menu
if "%errorlevel%"=="2" exit