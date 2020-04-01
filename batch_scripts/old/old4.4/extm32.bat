@echo off
echo Mounting Ext4 partitions....
echo Wait....
"C:\Program Files\Paragon Software\ExtFS for Windows\extmounter.exe" /umount >nul 2>&1
net stop ParagonMounter /y >nul 2>&1
net stop DokanMounter /y >nul 2>&1
net start ParagonMounter /y >nul 2>&1
"C:\Program Files\Paragon Software\ExtFS for Windows\extmounter.exe" /mount >nul 2>&1
TIMEOUT /t 8 >nul 2>&1