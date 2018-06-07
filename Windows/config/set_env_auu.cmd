:: ===================================================================
:: Config file for Work Environment (some Win Env Variable set)
:: D:\Tools\conf\set_env.cmd
::    This folder should be added to the %PATH% in order to allow 
::    running a set_env at any time from a terminal
:: ===================================================================
@echo off
set DRIVE=%~d0
set AUU=1
:: ----- Windows Env Variables ---------------------------------------
:: R_HOME=C:\Tools\R\R-3.2.5
:: R_HOME_bin=C:\Tools\R\R-3.2.5\bin
:: PYTHONHOME=C:\Tools\Python\WinPython-64bit-3.5.2.3\python-3.5.2.amd64
:: R_LIBS=C:\Tools\R\RLibs-3.2.5
:: %PATH% : add config/utility batch scripts and bin in %PATH% (.bat, .cmd), GrepWin
:: Path=D:\Tools\conf; %R_HOME_bin%; %PATH%
set PATH=D:\Tools\conf\Grep;%PATH%
:: ------------------------------------------------------------------
If DEFINED CMDER GoTo doskey_cmder
DOSKEY ls=dir /B
DOSKEY ll=dir
DOSKEY pwd=cd
:doskey_cmder
DOSKEY cdd=cd /d $*
DOSKEY clear=cls
DOSKEY q=exit
DOSKEY date=date /t
DOSKEY time=time /t
DOSKEY man=help
DOSKEY ifconfig=ipconfig
DOSKEY mv=move $*
DOSKEY cp=copy $*
DOSKEY cat=type $*
DOSKEY e=explorer
DOSKEY e.=explorer .
DOSKEY ee=explorer /e
:: ipython notebook --> jupyter notebook
DOSKEY nbd=ipython notebook --notebook-dir $*
DOSKEY nb=ipython notebook $*
DOSKEY ne=%DRIVE%\Tools\Notepad++\current\notepad++.exe $*
DOSKEY np=%DRIVE%\Tools\Notepad++\current\notepad++.exe -multiInst $*
DOSKEY sp=sqlplus $*
DOSKEY sqlplusc=D:\Tools\cmder\vendor\conemu-maximus5\ConEmu.exe -run sqlplus.exe
REM DOSKEY setenv=set > D:\Tools\conf\env_vars

:: ----- Cmder ---------------------------------------------
:: Cmder config D:\Tools\cmder\config\user-aliases.cmd, user-profile.cmd
:: cmder binary : grep, egrep, du, df, ps, cat, awk, sed, cut, touch 

:: ----- Cmd wrapper----------------------------------------
:: cmd2.bat: to start    cmd/terminal with config set
:: Cmd windows shortcut -Target:   C:\Windows\System32\cmd.exe /k "D:\Tools\conf\set_env.cmd"
::                      -Start in: %userprofile%
:: ---------------------------------------------------------

:: ----- Python --------------------------------------  
set PYTHONHOME=C:\Tools\Python\WinPython-64bit-3.5.2.3\python-3.5.2.amd64
set PATH=%PYTHONHOME%;%PATH%
DOSKEY spyder=C:\Tools\Python\WinPython-64bit-3.5.2.3\Spyder.exe
DOSKEY nb="C:\Tools\Python\WinPython-64bit-3.5.2.3\Jupyter Notebook.exe" $*

:: PyScripter init %PYSCRIPTER_DIR%\python_init.py
:: ---------------------------------------------------------

:: ----- SQL*Plus, SQLcl -----------------------------------  
REM set PATH=C:\Oracle\instantclient_11_2_64b;D:\Tools\SQLDev\sqlcl\bin;%PATH%
set PATH=C:\Oracle\instantclient_11_2_x64;D:\Tools\SQLDev\sqlcl\bin;%PATH%
:: ---------------------------------------------------------

:: ----- R ------------------------------------------------- 
:: R config file : %R_HOME%\etc\Rprofile.site -> set %R_LIBS%

:: setup (since R3.2 need to tweak to point correct version i386/x64)
REM set R_HOME=C:\Tools\R\R-3.2.5
REM set R_LIBS=C:\Tools\R\RLibs-3.2.5
REM IF "%PROCESSOR_ARCHITECTURE%"=="x86" (set R_HOME_bin=%R_HOME%\bin\i386) else (set R_HOME_bin=%R_HOME%\bin\x64)
REM set PATH=%R_HOME_bin%;%PATH%
:: ---------------------------------------------------------

REM add grep(packaged into RStudio)
REM set R_STUDIO=%DRIVE%\PortableApps\RStudio
REM PATH=%R_STUDIO%\bin\gnugrep;%PATH%

:: ----- GIT ----------------------------------------------- 
REM set GIT_HOME=%DRIVE%\PortableApps\GIT
REM  set PATH=%GIT_HOME%\cmd;%PATH%
