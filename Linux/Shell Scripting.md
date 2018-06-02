# Unix Shell
Command-Line Interpreter or Shell that provides a traditional Unix-like command line user interface.
Bourne SHell (sh), Bourne-Again SHell (bash), Korn SHell (ksh), Z shell (zsh)

Which shell am I using : 
* `which sh` /bin/sh
* `which bash` /bin/bash
* `echo SHELL:$SHELL, BASH:$BASH`: SHELL:/bin/bash, BASH:/bin/bash
* `echo $0` : -bash

```
# get shell version
bash --version
#GNU bash, version 3.2.25(1)-release (x86_64-redhat-linux-gnu)
```

* [Unix Shell wikipedia-EN](https://en.wikipedia.org/wiki/Unix_shell) [wikipedia-FR](https://fr.wikipedia.org/wiki/Shell_Unix)
* [HowToForge Getting Started with bash Scripting](https://www.howtoforge.com/tutorial/linux-shell-scripting-lessons/)
   * [HowToForge Shell Scripting part5 : Bash Functions](https://www.howtoforge.com/tutorial/linux-shell-scripting-lessons-5/) 

# Shell Variables and Environment Variables ($var or ${var})
- `set`: list shell variables
- `echo "var: $var"`: display shell variable value
   - `-e`: enable interpretation of backslash escapes
- `export`: export shell variable to become an env variable
- `unset`:  clear local environment variable

```sh
var1=toto
var2="North Face"

echo "var1= $var1"
echo "var2= ${var2}"
```

```sh
var="un\ndos\ntres"
echo -e "$var$
```

How to Check variable is set (different methods is needed to differ unset from empty var '')
- https://stackoverflow.com/questions/3601515/how-to-check-if-a-variable-is-set-in-bash
- https://unix.stackexchange.com/questions/228331/avoid-running-the-script-if-a-variable-is-not-defined
```
if [ -z "$var" ]; then echo "var is unset"; else echo "var is set to '$var'"; fi

if [ -z ${var+x} ]; then echo "var is unset"; else echo "var is set to '$var'"; fi
```

```
# note [[ ]] is different than []
if [[ -z "$BATCHNUM" ]]; then
    echo "Must provide BATCHNUM in environment" 1>&2
    exit 1
fi

[ -n "$BATCHNUM" ] || { kill "$PPID"; exit 1; }
#Unless $BATCHNUM is defined and unempty, ask parent process to exit and exit w/ 1
```
## Environment Variables
- `setenv`: change or add an env variable
- `printenv`: print env variables
- `unsetenv`
- `set` : 
   - https://www.computerhope.com/unix/uset.htm
   - https://www.tecmint.com/set-unset-environment-variables-in-linux/

```sh
setenv Device costo
echo $device
```
* https://www.computerhope.com/unix/usetenv.htm
* http://www.thegeekstuff.com/2010/05/bash-variables/

## Command substitution with BackTick/BackQuote or $()
- Legacy Bourne shell backticks- ``var=`cmd` ``
- Standardized (POSIX) and supported by all shells (even the Bourne shell from Unix v9) : `var=$(command)`
- References
   - http://data.bangtech.com/unix/unix_backquote.htm

```sh
v=`cat /etc/passwd | head -n1`
echo $v

v=$(cat /etc/passwd | head -n1)
echo $v
```

## variable manipulation
https://www.system-linux.eu/index.php?post/2009/01/17/Operation-mathematique-simple-avec-Bash

```sh
echo $((7+4))
# 11
```

```sh
i=4
let i++
echo $i
```

# Run a shell script - Shebang
A shell script need to be executable (x). `chmod u+x script.sh`

An executable shell script can be invoked frome a console/terminal (the script will run in a new shell / env): 
- `./script.sh`
- `/path/to/script.sh`
- `script.sh`: if script directory is in the PATH

The interpreter to execute the script is specified on the first line : 

```
#!/bin/sh -x
#!/bin/bash
#!/usr/bin/env bash
#!/usr/bin/env python
#!/usr/bin/env python3
```
https://en.wikipedia.org/wiki/Shebang_(Unix)

Shell script can also be invoked with a given interpreter (sh, bash, ...)
* `sh -x script.sh` to run a script with sh binary (`-x` for debug info).
   * `/bin/sh script.sh`
* `bash script.sh`

## source or "."
 executes a script in the current shell (thus in the current shell's environment).
 * `source script.sh`
 * `. script.sh`
 
 ## nohup
 POSIX command to ignore the HUP (hangup) signal. This allows a script to continue running after user's logout

## Directory from which the script is called
- `$PWD`: env variable usually available
- ``dir_call=`pwd` ``
- BASH_SOURCE: `${BASH_SOURCE[0]}` script name, `${BASH_SOURCE%/*}"` script path, `${PROG_PATH##*/}` script name
- `script_dir=$(dirname $0)`, `script_dir=$(dirname $(readlink -f "$0"))`
- more solutions
   - http://mywiki.wooledge.org/BashFAQ/028
   - http://www.ostricher.com/2014/10/the-right-way-to-get-the-directory-of-a-bash-script/
   - https://serverfault.com/questions/187314/bash-script-in-unix-return-full-path-and-filename

## Display executed script's directory
 ```sh
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "script directory is: $script_dir"
```

## Check script is running

* pgrep -f <process_pattern>
   * -f: full match, -l : details, -x : exact match

 ```sh
 # exact matching with pgrep -x
reprise_pid=$(pgrep -x $script_name)
echo "$script_name PID: $reprise_pid"
reprise_pid_nb=$(echo $reprise_pid | wc -w)
if [ $reprise_pid_nb -gt 1 ]; then >&2 echo "FATAL ERROR: script $script_name is already running. Concurrent Run Aborted"; exit 1; fi;
 ```
 
 ```sh
 # using ps and wc
 nb_reprise=`ps -eaf | grep -i reprise | grep -v grep | wc -l`
 ```

- Ref
  - https://askubuntu.com/questions/473880/how-to-check-the-process-is-already-running-or-not
  - http://www.anyexample.com/linux_bsd/bash/check_if_program_is_running_with_bash_shell_script.xml
  - https://www.digitalocean.com/community/tutorials/how-to-use-a-simple-bash-script-to-restart-server-programs
  - https://askubuntu.com/questions/157075/why-does-ps-aux-grep-x-give-better-results-than-pgrep-x
  - https://www.developpez.net/forums/d1019967/systemes/linux/shell-commandes-gnu/aide-script-compter-nombre-process/#post5694265
  - https://askubuntu.com/questions/643392/different-results-of-ps-aux-grep-x-if-entered-manually-and-done-via-script

## Shell scripts parameters
- http://www.commentcamarche.net/faq/5444-bash-les-parametres

```bash
if [ -z "$1" ] then
    echo "No argument supplied"
fi

if [ "$#" -eq 0 ]; then
  echo "no arguments"
fi
```


# Shell I/O (Input/Ouput or Flux in fr) and Redirections
- https://openclassrooms.com/courses/reprenez-le-controle-a-l-aide-de-linux/les-flux-de-redirection
- https://fr.wikibooks.org/wiki/Programmation_Bash/Flux_et_redirections
- http://www.unixmantra.com/2013/09/input-output-redirection-in-unix.html
- https://askubuntu.com/questions/420981/how-do-i-save-terminal-output-to-a-file (`tee`)

- 0: Standard Input
- 1: Standard Output
- 2: Standard Error Output
- 

- `>` or `1>`: redirect to file  `script.sh > script.log`
- `>>`: redirect to file and append
- `2>`, `2>>`: redirect Std Err to file
   - `script.sh > script.log 2> script_errors.log`
- `2>&1`: redirect Std Err (2) to Std Ouput (1)
  - `script.sh > script.log 2>&1`
<br>
- `<shell command> | tee -a script.log` : output to both StdOut and File


examples
- `program 1>/dev/null 2>&1`: redirect Std output and Std error to null
- `out=$(app 2>&1)`: captures StdOut and StdErr 
- `app 2>&1 | grep hello`: pipe StdOut and StrErr to grep or another tool

# Console
* terminal
* xterm : `xterm –bg white –fg blue –sl 1000 –fn 10x20` (white background, blue foreground, scroll list of 1000 lines and a font size of 10x20)

# References
* https://www.shellscript.sh/
* http://linuxcommand.org/lc3_writing_shell_scripts.php
* https://bash.cyberciti.biz/guide/Main_Page
* https://fr.wikipedia.org/wiki/Test_(Unix)