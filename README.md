# MASM in Visual Studio Code -- Classroom Starter

This repository provides a clean, repeatable way to write, assemble, link,
and debug MASM programs entirely in Visual Studio Code---no Visual Studio IDE required.
It supports both: - 32-bit MASM + Kip Irvine’s library, and - 64-bit MASM (no C runtime), using direct WinAPI calls for minimal, modern x64 examples. Students get “one-button build” via VS Code tasks, optional F5 debugging, and a self-contained project layout that works well on lab machines and personal laptops.

## What’s included

- `build32.bat` — assembles/links 32-bit programs with Irvine32 (x86).
- `build64.bat` — assembles/links x64 programs (no CRT; WinAPI only).
- `.vscode/tasks.json` — two tasks: Build (MASM 32 + Irvine32) and Build (MASM 64).
- `.vscode/launch.json` — optional VS Code debug configuration (F5).
- `hello32.asm` — minimal Irvine “Hello” (x86).
- `hello64.asm` — minimal x64 “Hello” using GetStdHandle + WriteFile (no printf).

## Prerequisites

- Visual Studio 2022 Build Tools (not the IDE) with:
- MSVC v143 build tools (x86/x64) - Windows 10/11 SDK - VS Code with the C/C++ extension (Microsoft).
- Kip Irvine’s files

Make sure to download the zip file of the repo by clicking on the green "Code" button,
click "Download ZIP", extract the .zip file (preferably in C:\), then open that folder
in VS Code by opening VS Code, clicking the "File" button at the top left, then click
"Open Folder", and select the extracted folder.

## Troubleshooting

- **A1000: cannot open file : SmallWin.inc**: Ensure all Irvine .inc files are present in lib\Irvine\ and that the 32-bit task adds /I lib\Irvine.
- **ml not found / dev cmd not set**: Confirm VsDevCmd.bat exists (often under Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\Common7\Tools\). The batch scripts call it automatically with the correct -arch.
- **Windows Defender blocks new EXEs**: Consider a per-project exclusion for the bin\ folder (Windows Security -> Virus & threat protection -> Manage settings -> Exclusions). Keep protections enabled elsewhere. See the `GUIDE_AND_HELP.md` file for more info.
- **Assembling the wrong file**: VS Code builds the active editor file. Make sure the .asm tab is selected before building.

### Acknowledgments

- Kip Irvine, for the Irvine32 package used in many assembly courses.
- Microsoft Visual C++ and MASM toolchains.
- ChatGPT for most of the info and for the .json files

All files from the Kip Irvine library are the sole property of the author, Kip Irvine, and may only be used for educational purposes. The Irvine library files may NOT be sold, licensed, or have their ownership claimed by another party. The rest of the code in this repo is under the MIT license.

### Repo created by L. Brandon Magoni for Johnson & Wales University in Providence, Rhode Island, U.S.A.; September, 2025
