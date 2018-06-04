:: set_env.cmd: Windows env
@echo off
set DRIVE=%~d0
set AUU=1
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
:: ipython notebook --> jupyter notebook
DOSKEY nbd=ipython notebook --notebook-dir $*
DOSKEY ne=%DRIVE%\Tools\Notepad++\current\notepad++.exe $*
DOSKEY np=%DRIVE%\Tools\Notepad++\current\notepad++.exe -multiInst $*
DOSKEY sp=sqlplus $*
DOSKEY sqlplusc=D:\Tools\cmder\vendor\conemu-maximus5\ConEmu.exe -run sqlplus.exe
REM DOSKEY setenv=set > D:\Tools\conf\env_vars

REM Path to Scripts (.bat, .cmd) + GrepWin
set PATH=D:\Tools\conf;D:\Tools\conf\Grep;%PATH%

:: Cmder config D:\Tools\cmder\config\user-aliases.cmd, user-profile.cmd

:: Cmd wrapper
:: Shorcut Target C:\Windows\System32\cmd.exe /k "D:\Tools\conf\set_env.cmd"
::         Start in: %userprofile%
  
  
:: Python :: ------------------------------------------------------
set PYTHONHOME=C:\Tools\Python\WinPython-64bit-3.5.2.3\python-3.5.2.amd64
set PATH=%PYTHONHOME%;%PATH%
DOSKEY spyder=C:\Tools\Python\WinPython-64bit-3.5.2.3\Spyder.exe
DOSKEY nb="C:\Tools\Python\WinPython-64bit-3.5.2.3\Jupyter Notebook.exe" $*
REM DOSKEY nb=ipython notebook $*

:: PyScripter init %PYSCRIPTER_DIR%\python_init.py


REM SQLPlus and SQLcl added to Path
::set PATH=C:\Oracle\instantclient_11_2_64b;D:\Tools\SQLDev\sqlcl\bin;%PATH%
set PATH=C:\Oracle\instantclient_11_2_x64;D:\Tools\SQLDev\sqlcl\bin;%PATH%

:: R :: ------------------------------------------------------
:: setup (since R3.2 need to tweak to point correct version i386/x64)
set R_HOME=C:\Tools\R\R-3.2.5
set R_LIBS=C:\Tools\R\RLibs-3.2.5
IF "%PROCESSOR_ARCHITECTURE%"=="x86" (set R_HOME_bin=%R_HOME%\bin\i386) else (set R_HOME_bin=%R_HOME%\bin\x64)
set PATH=%R_HOME_bin%;%PATH%
:: R config file : %R_HOME%\etc\Rprofile.site -> set %R_LIBS%
:: ---------------------------------------------------------

REM add grep(packaged into RStudio)
REM set R_STUDIO=%DRIVE%\PortableApps\RStudio
REM PATH=%R_STUDIO%\bin\gnugrep;%PATH%


REM GIT
REM set GIT_HOME=%DRIVE%\PortableApps\GIT
REM  set PATH=%GIT_HOME%\cmd;%PATH%

