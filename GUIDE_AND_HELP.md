# Prerequisites and Guide for running assembly programs in VS Code with MASM

1. Visual Studio Build Tools 2022
    - Download [Build Tools for Visual Studio 2022](https://visualstudio.microsoft.com/downloads/#build-tools-for-visual-studio-2022)
    - Run the installer that you just downloaded
    - During installation select **Desktop development with C++** (everything else is not necessary)
    - Click the *install* button on the bottom right of the screen (should be ~5GB)

2. Install Visual Studio Code
    - [Download here](https://code.visualstudio.com/download)
3. Install the C/C++ extension by Microsoft
    - Click the **Extensions** button on the vertical sidebar inside VS Code, or press CTRL+SHIFT+X while in VS CODE
    - Search for C/C++ and install the extension

## build32.bat

- This batch file locates the Developer Command Prompt bootstrapper, loads the
 MSVC/MASM environment, assembles the active .asm file, and links it with Irvine and
  the Windows SDK.

  ## tasks.json

- This file forces VS Code to use cmd.exe (not PowerShell) and invokes the build script with the
  currently open .asm file.
- **Important**: Students must have the .asm file active in the editor when they press Ctrl+Shift+B. VS Code
 substitutes ${file} with the active file; if a JSON file is active, it will try to assemble that instead.

## Building and running

- To build and assemble .asm files
    -- Open the desired file in VS Code
    -- Press CTRL+SHIFT+B
    -- From the drop down menu, select **Build Active ASM (MASM32 + Irvine32)**
    -- The terminal should open on the bottom of the screen and show the status of the build.

- To run the newly-created .exe file:
    -- From the terminal:
        --- If the terminal is not open, click the three dots (...) at the top
        of the screen, in VS  Code, near where it says "Go"
        --- Press "Terminal" -> "New Terminal
        --- You should see a command prompt that says something like
        "PS C:\Assembly_Class>". The "Assembly_Class" name is custom and
        you may have a different directory name here. What matters is that your
        terminal is in the same folder that your VS Code material is in
        --- Enter into the command prompt "./" and the desired name of the exe
            ---- For example, if the file you want to run is named "my_file.exe",
            you would enter `./my_file.exe` into the command prompt
    -- Running by double-clicking the executable in, say, the file explorer
    does run them, but this is not advised, as the output terminal that spawns
    will close immediately and will not stay open unless it is explicitly added
    in the assembly program that it should. Stick to running it from an
    already-open terminal.

## Calming down Windows Defender

Windows defender will probably have an issue with you running raw, barebones
executables with almost no metadata and no signature. This is not acceptable in
a development environment. In order to solve this issue, follow these steps:

1. Open Windows Defender
2. From the vertical side menu, press the **Virus & threat protection** button
3. Look for the section that says **Virus & threat protection settings**
    - Click on the **Manage settings** button
4. Scroll all the way to the bottom where it says **Exclusions**
    - Click on **Add or remove exclusions**
    - Click **Yes** when it asks to make changes to your device;
5. Click on the **Add an exclusion** button, and then click on the **Folder**
button in the drop-down menu;
6. From here, find the folder where your assembly project and files are located.
This is going to be the folder that Windows Defender turns a blind eye to. This
makes it so you do not get any antivirus warnings from anything that executes from
that folder and any subfolders within it.

- **CAUTION**: Most malware executed in the folder you select, and all folders within
it, will have NO PROTECTION FROM YOUR SYSTEM. DO **NOT** place any executables
or suspicious files into your selected folder! It is *highly recommended* that you
remove this exclusion from Windows Defender once the course is completed and you
have no more need to use the working folder. If you are not comfortable with
excluding a folder with Windows Defender, you can instead exclude the executable
files you make individually by doing the same thing you did for the folder, but
this time pressing the **File** button from the dropdown and finding your
desired executable.

- As long as you don't place anything that is downloaded from the internet
into your working folder, or that you know for *sure* that what you put in
there is not malware, your system will be fine. Always make sure that you
are not downloading viruses and malware from the internet, and certainly do
not turn off Windows Defender or other antivirus software that you have
unless you absolutely need to, such as in this instance (a dev environment).
