@echo off
setlocal

REM --- Require an .asm file (VS Code passes ${file}) ---
for %%X in ("%~1") do if /I not "%%~xX"==".asm" (
  echo [ERROR] Please pass an .asm file. You gave: "%~1"
  echo Open your .asm in VS Code and run the task again.
  exit /b 2
)

REM --- Prefer the (x86) BuildTools path you verified ---
set "VSCMD=%ProgramFiles(x86)%\Microsoft Visual Studio\2022\BuildTools\Common7\Tools\VsDevCmd.bat"
if not exist "%VSCMD%" set "VSCMD=%ProgramFiles%\Microsoft Visual Studio\2022\BuildTools\Common7\Tools\VsDevCmd.bat"
if not exist "%VSCMD%" set "VSCMD=%ProgramFiles(x86)%\Microsoft Visual Studio\2022\Community\Common7\Tools\VsDevCmd.bat"
if not exist "%VSCMD%" set "VSCMD=%ProgramFiles%\Microsoft Visual Studio\2022\Community\Common7\Tools\VsDevCmd.bat"
if not exist "%VSCMD%" (
  echo [ERROR] Can't find VsDevCmd.bat.
  exit /b 3
)

call "%VSCMD%" -arch=x86 || exit /b 4

set "ASM=%~f1"
set "OUT=%~dpn1"

REM --- Adjust Irvine folder if yours differs ---
ml /c /Zi /Zd /safeseh /coff /I "%~dp0lib\Irvine" "%ASM%" || exit /b 5
link /DEBUG /SUBSYSTEM:CONSOLE "%OUT%.obj" /LIBPATH:"%~dp0lib\Irvine" Irvine32.lib kernel32.lib user32.lib || exit /b 6

echo Built: "%OUT%.exe"
