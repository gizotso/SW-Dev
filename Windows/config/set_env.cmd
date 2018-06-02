@echo off
set DRIVE=%~d0
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
DOSKEY set_python=dir %DRIVE%\PortableApps\Scripts\set* /b
REM ------ Ipython Notebook -----------------------------------
DOSKEY nb=ipython notebook $*
DOSKEY nbd=ipython notebook --notebook-dir $*
REM ----- Notepad++ -------------------------------------------
DOSKEY ne=%DRIVE%\PortableApps\PortableApps\Notepad++Portable\Notepad++Portable.exe $*
DOSKEY np=%DRIVE%\PortableApps\PortableApps\Notepad++Portable\Notepad++Portable.exe -multiInst $*
DOSKEY setenv=set > %DRIVE%\PortableApps\Scripts\env_vars
REM Path to Scripts (.bat, .cmd)
set PATH=%DRIVE%\PortableApps\Scripts;%PATH%

REM ----- Default Python --------------------------------------
call %~dp0set_py34.bat"
set PYTHON_iNB_PATH = "%DRIVE%\SW Dev\R project\iNotebooks"

REM ----- R --------------------------------------
REM R setup (since R3.2 need to tweak to point correct version i386/x64)
set R_HOME=%DRIVE%\PortableApps\R\R_32
IF "%PROCESSOR_ARCHITECTURE%"=="x86" (set R_HOME_bin=%R_HOME%\bin\i386) else (set R_HOME_bin=%R_HOME%\bin\x64)
set PATH=%R_HOME_bin%;%PATH%
REM Rstudio : RStudio\bin\rstudio.exe

REM add grep(packaged into RStudio) : grep.exe, egrep.exe, fgrep.exe
set R_STUDIO=%DRIVE%\PortableApps\RStudio
PATH=%R_STUDIO%\bin\gnugrep;%PATH%
REM T:\PortableApps\RStudio\bin\gnudiff : diff.exe, diff3.exe, sdiff.exe

REM 
REM T:\PortableApps\PortableApps\grepWinPortable\App\GrepWin

REM GIT
REM set GIT_HOME=%DRIVE%\PortableApps\GIT
REM  set PATH=%GIT_HOME%\cmd;%PATH%
