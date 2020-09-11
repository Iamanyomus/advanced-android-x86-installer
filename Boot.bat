@echo off
color 0B
mode con:cols=100 lines=15
cls
type "C:\Program Files\Android-x86-ASG\src"
echo If your PC use *Uefi* then open your BIOS menu.
echo Rebooting in 10 seconds
TIMEOUT /t 9 >nul 2>&1
shutdown /r /f /t 1