chcp 437
if "%1"=="" (
  for %%a in (  FontSize:00080008
                FontFamily:00000030
                WindowSize:003d0050
                ScreenColors:0000000f
                CodePage:000001b5
                ScreenBufferSize:003d0050
  ) do for /f "tokens=1,2 delims=:" %%b in ("%%a") do (
    >nul reg add HKCU\Console\DosBatch_3D_Engine /v %%b /t reg_dword /d 0x%%c /f 
  )
  start "DosBatch_3D_Engine" /max "%ComSpec%" /c "%~s0" 1&goto:eof
 
) else ( >nul reg delete HKCU\Console\DosBatch_3D_Engine /f )
 
@echo off & setlocal & title Sphere 3D & set /a cols=100, lines=70 & goto :Init_system
 
:Main
 
set /a ar=100, rt=0, ds=0, cx=cols/2, cz=4000, cY=lines/2
 
(
  set SIN=
  set _PLOT$_=
  set _$PLOT_=
  set _empty=
  set lines=
  set cols=
 
  for /L %%\ in (1000,-1,0) do (
 
   set /a "rt+=31416/60"
   if !ds! lss 1000 set /a ds+=10
 
   setlocal
 
   set /a "a=(15708-rt) %% 62832, c=(a>>31|1)*a"
   if !c! gtr 47124 (set /a "a=a-(a>>31|1)*62832, b=%SIN%, a=rt %% 62832, c=(a>>31|1)*a")  else (if !c! gtr 15708 (set /a "a=(a>>31|1)*31416-a, b=%SIN%, a=rt %% 62832, c=(a>>31|1)*a") else set /a "b=%SIN%, a=rt %% 62832, c=(a>>31|1)*a")
   if !c! gtr 47124 (set /a "a=a-(a>>31|1)*62832, a=%SIN%")  else (if !c! gtr 15708 (set /a "a=(a>>31|1)*31416-a, a=%SIN%") else set /a "a=%SIN%")
 
   for %%f in ("0 9999" "-5000 8661" "-8661 5000" "-9999 0" "-8661 -5000" "-5000 -8661" "0 -9999" "5000 -8661" "8661 -5000" "9999 0" "8661 5000" "5000 8661") do for /f "tokens=1,2" %%g in (%%f) do (
 
   for %%t in ("3827 9239" "7071 7071" "9239 3827" "9999 0" "9239 -3827" "7071 -7071" "3827 -9239") do for /f "tokens=1,2" %%u in (%%t) do (
 
     set /a "ax=ar*%%h/10000*%%u/10000, az=ar*%%g/10000*%%u/10000, ay=ar*%%v/10000, aax=(ax*b/10000-(ay*a/10000+az*b/10000)*a/10000)*b/10000-(ay*b/10000-az*a/10000)*a/10000, aay=(ax*b/10000-(ay*a/10000+az*b/10000)*a/10000)*a/10000+(ay*b/10000-az*a/10000)*b/10000, e=ax*a/10000+(ay*a/10000+az*b/10000)*b/10000, c=ds*aax/(e-cz)+cx, d=ds*aay/(e-cz)+cy" 
 
     if not defined L!d! set L!d!=%_empty%
   
     if !e! lss 0 (%_$PLOT_% !c! !d! 1 %_PLOT$_%) else %_$PLOT_% !c! !d! 4 %_PLOT$_%
 
    )   
   )
 
   if not "!OT!"=="!time:~-1!" (
     cls & (For /L %%l in (1,1,%lines%) do if not defined L%%l (echo() else echo( !L%%l!)>CON
     if "!OT!"=="0" title Sphere 3D [%%\]
     endlocal
     set OT=!time:~-1!
   ) else endlocal
 
  )
)
goto :eof
 
 
:Init_system
 
  setlocal DisableDelayedExpansion
 
  set /a cc=cols+2, ll=lines+2
(  
  mode %cc%,%ll% & cls
  for /F "Tokens=1 delims==" %%v in ('set') do set "%%v="
  set /a cols=%cols%, lines=%lines%
)
  set "_$PLOT_=For /F usebackq^ tokens^=1-3 %%x in ('"
  set "_PLOT$_=') do set /a f=%%x+1 & For %%w in (!f!) do set L%%y=!L%%y:~0,%%x!!g:~%%z,1!!L%%y:~%%w!"
 
  set "SIN=(a-a*a/1920*a/312500+a*a/1920*a/15625*a/15625*a/2560000-a*a/1875*a/15360*a/15625*a/15625*a/16000*a/44800000)"
 
  setlocal EnableDelayedExpansion
  color 0a
  For /L %%l in (1,1,%cols%) do set "_empty=!_empty! "
 
  set g= .±2@"
Goto :Main