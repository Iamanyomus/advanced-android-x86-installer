@echo off
taskkill /IM "Paragon ExtFS for Windows.exe" /F >nul 2>&1
net stop ParagonMounter /y >nul 2>&1
net stop DokanMounter /y >nul 2>&1
echo Installing extFS mirror drivers for your system....
echo Please wait....
%temp%\_ir_sf_temp_0\extfs.msi /quiet /norestart
echo ..
echo Stabilizing....
TIMEOUT /t 5 >nul 2>&1
echo ..
echo Almost done....
taskkill /IM "Paragon ExtFS for Windows.exe" /F >nul 2>&1
net stop ParagonMounter /y >nul 2>&1
net stop DokanMounter /y >nul 2>&1
sc config ParagonMounter start=demand >nul 2>&1
sc config DokanMounter start=demand >nul 2>&1
