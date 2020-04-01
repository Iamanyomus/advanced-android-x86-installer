@echo off
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