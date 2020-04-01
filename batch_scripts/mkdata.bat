@echo off
color 0B
mode con:cols=73 lines=10
cls
set BD=%temp%\_ir_sf_temp_0
set TINFO=It can take upto 10 minutes depending on your data size
set TINFO2=Wait patiently and dont close this window or dont do anything else
echo.
if not exist "C:\gen_data" md "C:\gen_data"
echo %TINFO% && echo %TINFO2% && echo. && echo Generating a %~1 GB data image. && %BD%\mkext4fs.exe -l %~2 -b 4096 -a /data "C:\gen_data\data.img" >nul 2>&1 && echo Returning back to installer... && TIMEOUT /t 4 >nul 2>&1 && exit