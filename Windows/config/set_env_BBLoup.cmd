:: =============================================================
:: Config file for Desktop Environment (some env variables are set)
:: D:\PortableApps\Scripts\set_env.cmd (%PAPPS_SCRIPT%)
:: =============================================================
:: Windows env variables
:: --------------------------
:: %PYTHONHOME%=D:\PortableApps\Python\WinPython-64bit-3.5.3.0Qt5\python-3.5.3.amd64
:: %R_HOME%=R_HOME=D:\PortableApps\R\R-3.4.1
:: %R_HOME_bin%=D:\PortableApps\R\R-3.4.1\bin
:: %PATH%=%PYTHONHOME%;%R_HOME_bin%;D:\PortableApps\Scripts;%PATH%

@echo off
set AUU=1
set DRIVE=%~d0
set SET_ENV_FILE=%~0
:: ----- %PATH% -------------------------------------------
set PAPPS_ROOT=%DRIVE%\PortableApps
:: PAPPS_SCRIPTS: Central Script directory (%DRIVE%\PortableApps\Scripts\)
set PAPPS_SCRIPTS=%~dp0
:: Add Script directory (.bat, .cmd) to %PATH%
set PATH=%PAPPS_SCRIPTS%;%PATH%
set PATH=%DRIVE%\PortableApps\Scripts\DU;%PATH%
:: %DRIVE%\PortableApps\miktex\miktex\bin
DOSKEY clear=cls
DOSKEY q=exit
DOSKEY date=date /t
DOSKEY time=time /t
DOSKEY man=help
DOSKEY ifconfig=ipconfig
DOSKEY pwd=cd
DOSKEY ls=dir /B
DOSKEY ll=dir
DOSKEY mv=move $*
DOSKEY cp=copy $*
DOSKEY cat=type $*
DOSKEY e=explorer
DOSKEY ee=explorer /e
DOSKEY setenv=set $*
:: Ipython Notebook
DOSKEY ipnb=jupyter notebook $*
DOSKEY ipnbd=jupyter notebook --notebook-dir $*

:: ----- Notepad++ -------------------------------------------
DOSKEY ne="%ProgramFiles(x86)%\Notepad++\notepad++.exe" $*
::DOSKEY ne=%DRIVE%\PortableApps\PortableApps\Notepad++Portable\Notepad++Portable.exe $*
::DOSKEY np=%DRIVE%\PortableApps\PortableApps\Notepad++Portable\Notepad++Portable.exe -multiInst $*

:: ----- Python --------------------------------------
:: %PYTHONHOME%: %DRIVE%\PortableApps\Python\WinPython-64bit-3.5.3.0Qt5\python-3.5.3.amd64
:: > included in %PATH% 
SET WINPYTHONDIR=%PYTHONHOME%\..
:: adds %WINPYTHONDIR% to the %PATH% > PyScripter
set PATH=%WINPYTHONDIR%;%PATH%
:: load env file using WinPython env setter
::call %WINPYTHONDIR%\scripts\env.bat
set PYTHONPATH=%WINPYDIR%\Lib

:: set Python using multiple Python version launcher (works best)
set_py 3.5
:: > jupyter notebook
:: > jupyter console --kernel=ir


:: ----- R ---------------------------------------------------
REM R setup (since R3.2 need to tweak to point correct version i386/x64)
set R_HOME=%DRIVE%\PortableApps\R\R-3.4.1
IF "%PROCESSOR_ARCHITECTURE%"=="x86" (set R_HOME_bin=%R_HOME%\bin\i386) else (set R_HOME_bin=%R_HOME%\bin\x64)
set PATH=%R_HOME_bin%;%PATH%

set R_STUDIO=%DRIVE%\PortableApps\R\RStudio-1.1.453
DOSKEY Rstudio=%R_STUDIO%\bin\rstudio.exe $*s
REM add grep and pandoc (packaged into RStudio)
PATH=%R_STUDIO%\bin\gnugrep;%R_STUDIO%\bin\pandoc;%PATH%

:: ----- GIT -------------------------------------------------
REM set GIT_HOME=%DRIVE%\PortableApps\GIT
REM  set PATH=%GIT_HOME%\cmd;%PATH%


:: to add shortcut to Cmder with env sourcing