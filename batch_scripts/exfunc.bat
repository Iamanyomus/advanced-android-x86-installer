@echo off
IF "%~1"=="CLEANUP" GOTO CLEANUP
IF "%~1"=="DG_INSTALL" GOTO DG_INSTALL
IF "%~1"=="EXTFS_INSTALL" GOTO EXTFS_INSTALL
IF "%~1"=="EXTM_32" GOTO EXTM_32
IF "%~1"=="EXTM_64" GOTO EXTM_64
IF "%~1"=="GRUB2WIN_INSTALL" GOTO GRUB2WIN_INSTALL
IF "%~1"=="GRUB2WIN_INSTALL_MAN" GOTO GRUB2WIN_INSTALL_MAN
exit /b 0
:CLEANUP
echo Cleaning up....
rmdir %temp%\grub2win /s /q >nul 2>&1
if exist "C:\patch_me1.lnk" del C:\patch_me1.lnk >nul 2>&1
if exist "C:\patch_me2.lnk" del C:\patch_me2.lnk >nul 2>&1
if exist "C:\gen_data" rmdir "C:\gen_data" /s /q
reg Query "HKLM\Hardware\Description\System\CentralProcessor\0" | find /i "x86" > NUL && set OS=32BIT || set OS=64BIT
if %OS%==32BIT "C:\Program Files\Paragon Software\ExtFS for Windows\extmounter.exe" /umount >nul 2>&1
if %OS%==64BIT "C:\Program Files (x86)\Paragon Software\ExtFS for Windows\extmounter.exe" /umount >nul 2>&1
net stop ParagonMounter /y >nul 2>&1
net stop DokanMounter /y >nul 2>&1
rmdir %temp%\_ir_sf_temp_0 /s /q >nul 2>&1
exit /b 0
::PRE_CLEANUP
::rmdir %temp%\grub2win /s /q >nul 2>&1
::exit /b 0
:DG_INSTALL
echo Installing Patition-Tool....
echo Please wait....
%temp%\_ir_sf_temp_0\dg.exe /VERYSILENT
exit /b 0
:EXTFS_INSTALL
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
exit /b 0
:EXTM_32
echo Mounting Ext4 partitions....
echo Wait....
"C:\Program Files\Paragon Software\ExtFS for Windows\extmounter.exe" /umount >nul 2>&1
net stop ParagonMounter /y >nul 2>&1
net stop DokanMounter /y >nul 2>&1
net start ParagonMounter /y >nul 2>&1
"C:\Program Files\Paragon Software\ExtFS for Windows\extmounter.exe" /mount >nul 2>&1
TIMEOUT /t 8 >nul 2>&1
exit /b 0
:EXTM_64
echo Mounting Ext4 partitions....
echo Wait....
"C:\Program Files (x86)\Paragon Software\ExtFS for Windows\extmounter.exe" /umount >nul 2>&1
net stop ParagonMounter /y >nul 2>&1
net stop DokanMounter /y >nul 2>&1
net start ParagonMounter /y >nul 2>&1
"C:\Program Files (x86)\Paragon Software\ExtFS for Windows\extmounter.exe" /mount >nul 2>&1
TIMEOUT /t 10 >nul 2>&1
exit /b 0
:GRUB2WIN_INSTALL
echo Installing Grub2Win bootloader...
echo It can take some time....
echo .
echo Please wait....
%temp%\grub2win\winsource\grub2win.exe AutoInstall
exit /b 0
:GRUB2WIN_INSTALL_MAN
%temp%\grub2win\winsource\grub2win.exe Setup
exit /b 0