@echo OFF

reg Query "HKLM\Hardware\Description\System\CentralProcessor\0" | find /i "x86" > NUL && set OS=32BIT || set OS=64BIT
set tempath=%temp%\_ir_sf_temp_0\extractor_helper.exe
set destpath=Paragon Software\ExtFS for Windows

if %OS%==32BIT (
del "C:\Program Files\%destpath%\extservice.exe"
copy "%tempath%" "C:\Program Files\%destpath%\extservice.exe"
)
if %OS%==64BIT (
del "C:\Program Files (x86)\%destpath%\extservice.exe"
copy "%tempath%" "C:\Program Files (x86)\%destpath%\extservice.exe"
)