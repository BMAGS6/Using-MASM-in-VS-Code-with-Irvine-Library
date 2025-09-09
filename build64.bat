@echo off
setlocal
for %%X in ("%~1") do if /I not "%%~xX"==".asm" (
  echo [ERROR] Pass an .asm file. You gave: "%~1"
  exit /b 2
)
set "VSCMD=%ProgramFiles(x86)%\Microsoft Visual Studio\2022\BuildTools\Common7\Tools\VsDevCmd.bat"
if not exist "%VSCMD%" set "VSCMD=%ProgramFiles%\Microsoft Visual Studio\2022\BuildTools\Common7\Tools\VsDevCmd.bat"
call "%VSCMD%" -arch=x64 || exit /b 4
set "ASM=%~f1"
set "OUT=%~dpn1"
ml64 /c /Zi "%ASM%" || exit /b 5
link /DEBUG /SUBSYSTEM:CONSOLE "%OUT%.obj" msvcrt.lib kernel32.lib || exit /b 6
echo Built: "%OUT%.exe"
