# Windows Command Prompt (cmd.exe or cmd)
Command-line interpreter on Windows NT OS. (Replacement of COMMAND.COM (MS-DOS Prompt) in DOS and Windows 9x OS).
Equivalent of Shell Unix
`ComSpec=%SystemRoot%\system32\cmd.exe`
`PathExt=.EXE;.CMD;.BAT;.VBS; ...`


Batch File : kind of script file in DOS and MS-Windows (.bat, .cmd, .btm)

- [Commande DOS @ Wikipedia-FR](https://fr.wikipedia.org/wiki/Commande_DOS) |  [DOC Command @Wikipedia-EN](https://en.wikipedia.org/wiki/List_of_DOS_commands)
- [Windows CMD command line ss64.com](https://ss64.com/nt/)
- [La ligne de commande Windows et les fichiers batch - dvp.com](https://windows.developpez.com/cours/ligne-commande/)
- [Cmd-line Reference Windows 7, 8](https://technet.microsoft.com/en-us/library/cc754340(v=ws.11).aspx)
- [Cmd-line Reference Windows XP](https://technet.microsoft.com/en-us/library/bb490890.aspx)
- [Microsoft DOS and Windows Command Line](https://www.computerhope.com/msdos.html)

## cmd : invite/interpréteur de commandes
cmd program is located under : %windir%\system32\cmd.exe, %ComSpec% env variable is a shortcut to cmd.exe : `ComSpec=%SystemRoot%\system32\cmd.exe`

A shortcut is available under "C:\Users\family\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\System Tools" : cible="%windir%\system32\cmd.exe", start in="%HOMEDRIVE%%HOMEPATH%"

* `cmd /c` : runs (executes) a cmd and hide (se termine)
* `cmd /k` : runs a cmd and keep (reste actif)
* `exit`: close cmd prompt



### From Windows Menu/Run : `cmd`

This will start a cmd window named "C:\WINDOWS\system32\cmd.exe"
>Microsoft Windows [version 10.0.14393]<br>
>(c) 2016 Microsoft Corporation. Tous droits réservés.<br>
>
>C:\Users\family><br>

RUN : `cmd /k echo "Hello World"`

>"Hello"
>
>C:\Users\family>

RUN : `cmd /c ping google.com`
The /c argument tells the command processor to open, run the specified command, then close when it's done.

### From the command prompt
`cmd /k echo "Hello World"` : run a new cmd process, use `exit` to go back to initial prompt


* [Cmd@Wikipedia-FR](https://fr.wikipedia.org/wiki/Cmd) | [Cmd.exe @Wikipedia-EN](https://en.wikipedia.org/wiki/Cmd.exe)
* http://www.zebulon.fr/dossiers/63-invite-de-commandes-cmd.html 
* http://stackoverflow.com/questions/8713960/cmd-exe-k-switch
* http://www.zebulon.fr/dossiers/63-invite-de-commandes-cmd.html 
* http://lifehacker.com/256474/pipe-commands-to-cmdexe-with-switches


## call
**call** : The CALL command will launch a new batch file context along with any specified parameters.
When the end of the second batch file is reached (or if EXIT is used), control will return to just after the initial CALL statement.

http://ss64.com/nt/call.html 

## start
`start "label" /D "D:\Tools" cmd.exe` : Start a new cmd window at the specified Dir

`start cmd /k "DIR"` : Start a new cmd windows and executes a DIR command

## cmd wrapper
* when launching a .bat with double click : a cmd process is started
* when running from shell : 

*cmd2.bat*
```bat
@echo off
TITLE cmd
:: first call to load env (background)
call %~dp0set_env.cmd
::cmd.exe /k or just cmd.
cmd.exe /k
```
*cmd2.bat* another working but set_env execution can be seen in the window title + blink effect
```bat
@echo off
TITLE cmd
cmd.exe /k set_env.cmd
```

*start_cmd.bat* : similar to cmd2.bat but will always open new window (~shorcturt)
```bat
@echo off
start set_env.cmd
```

*python.bat*
```bat
python.bat
@echo off
call %~dp0env.bat
%WINPYDIR%\python.exe %*
```bat

*python34.bat*
```bat
:: wrapper for Python 3.4 : set Python 3.4 environment and run Python (Cmd prompt)
@echo off
call %~dp0set_py34.bat
:: run python.exe (do not run cmd/k python as this will create an additionnal cmd process)
%PYTHONHOME%\python.exe %*
```

```
:: set env and start python in a Shell
@echo off
call set_env.cmd
:: warning : python will match python.bat or %PYTHONHOME%\python.exe depending on which is found first in the PATH and %ComSpec%
python
```

*spyder.bat*
```bat
spyder.bat
@echo off
call %~dp0env.bat
cd %WINPYDIR%\Scripts
%WINPYDIR%\python.exe -m spyderlib.start_app %*
```

## Env variables
* `SET` , `SET | MORE`: this doc command lists all env variables
* `SET HOME=C:\Users\family` : set a variable
* `SET PATH` : show PATH variable
* `SET > vars.txt` : export all en variables to a txt file

###	Import/Export env var
* Is there a command to refresh environment variables from the command prompt in Windows?
http://stackoverflow.com/questions/171588/is-there-a-command-to-refresh-environment-variables-from-the-command-prompt-in-w
* Tools : Rapid EE : https://www.rapidee.com/en/about


### setx
* (Doc https://technet.microsoft.com/en-us/library/cc755104(v=ws.10).aspx )
* download : https://www.microsoft.com/en-us/download/details.aspx?id=18546 
* http://ss64.com/nt/setx.html 
* http://stackoverflow.com/questions/17802788/will-setx-command-work-in-windows-xp 

setx PATH ""
setx PATH "%PATH%,C:\stuff" /M

* http://www.windows-commandline.com/set-path-command-line/ 
setx path "%path%;C:\Anaconda3;C:\Anaconda3\Scripts"
PATH windows
C:\Anaconda3;C:\Anaconda3\Scripts

```
@echo off
SETX -m JAVA_HOME "C:\Program Files\Java\jdk1.6.0_31"
pause
```
echo %PATH%
```


# Batch Scripting (.bat, .cmd)
## Sripting
```
for %f in (*.txt) do type "%f" >> combined.txt

copy *.txt newfile.txt
```

## Batch Parameters
* http://stackoverflow.com/questions/26551/how-to-pass-command-line-parameters-to-a-batch-file
* https://www.microsoft.com/resources/documentation/windows/xp/all/proddocs/en-us/percent.mspx?mfr=true 
* [Command Line argument (parameters) ss64.com](https://ss64.com/nt/syntax-args.html)
* http://www.progmatique.fr/article-111-Batch-arguments-ligne-commandes.html


## Parameter Extensions
* `%~dp0` expands to current directory path of the running batch file
   * d=drive, p=path, %0=starting directory of this batch-file 
   * `cd /d %~dp0` will change where batchfile resides
   * http://stackoverflow.com/questions/5034076/what-does-dp0-mean-and-how-does-it-work
 
```
# example from Strawberry Perl's portable shell launcher
set drive=%~dp0
set drivep=%drive%
if #%drive:~-1%# == #\# set drivep=%drive:~0,-1%

set PATH=%drivep%\perl\site\bin;%drivep%\perl\bin;%drivep%\c\bin;%PATH%
```

* see also `for /?`



## Multiple commands - one liner
Using multiple commands and conditional processing symbols  : 
You can run multiple commands from a single command line or script using conditional processing symbols. 
When you run multiple commands with conditional processing symbols, the commands to the right of the conditional processing symbol act based upon the results of the command to the left of the conditional processing symbol.
For example, you might want to run a command only if the previous command fails. Or, you might want to run a command only if the previous command is successful.

`& [...] command1 & command2` : separate multiple commands on one command line. Cmd.exe runs 1st command, and then the 2nd command.
`&& [...] command1 && command2` : run the command following && only if the command preceding the symbol is successful. Cmd.exe runs the first command, and then runs the second command only if the first command completed successfully.
`|| [...] command1 || command2`
Use to run the command following || only if the command preceding || fails. Cmd.exe runs the first command, and then runs the second command only if the first command did not complete successfully (receives an error code greater than zero).
`( ) [...] (command1 & command2)` : Use to group or nest multiple commands.
`; or , command1 parameter1;parameter2` : Use to separate command parameters.

http://stackoverflow.com/questions/8055371/how-to-run-two-commands-in-one-line-in-windows-cmd




http://steve-jansen.github.io/guides/windows-batch-scripting/part-2-variables.html
https://stackoverflow.com/questions/9681863/windows-batch-variables-wont-set

# References
- [OpenClassroom](https://openclassrooms.com/courses/batch)
- http://simplyadvanced.net/blog/cheat-sheet-for-windows-command-prompt/
