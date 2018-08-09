# Unix Commands
[UNIX](https://en.wikipedia.org/wiki/Unix) : family of multitasking, multiuser computer operating systems that derive from the original AT&T Unix
Linux : Unix-like and mostly POSIX-compliant[8] computer operating system assembled under the model of free and open-source software development and distribution.

* http://doc.ubuntu-fr.org/tutoriel/console_commandes_de_base 
* Unix commands reference card : http://www.digilife.be/quickreferences/QRC/UNIX%20commands%20reference%20card.pdf
* Unix Reference Card  http://www.cs.jhu.edu/~joanne/unixRC.pdf
* http://mally.stanford.edu/~sr/computing/basic-unix.html
* [Unix Commands @Wikipedia-EN](https://en.wikipedia.org/wiki/List_of_Unix_commands)
* [Unix/Linux Command Reference FOSSWire](https://files.fosswire.com/2007/08/fwunixref.pdf)
* Lab : 
   * https://github.com/amplab/datascience-sp14/blob/master/lab1/unix-utils.md 
   * https://github.com/amplab/datascience-sp14/blob/master/lab1/solutions.md


`man <command>` : Help (type q to Quit)

`cat, more, touch, sed&cut, awk, find, >, grep, egrep, ...`

# File Commands
`pwd` : print name of current/working director

`cd` : change to home dir

- `touch <file>` : create a file (or update : change file timestamp)
- `>/tmp/filename`: create an empty file
- `echo -n "" > /tmp/filename`: create an empty file
   - `file  /tmp/filename`: determine file type. "/tmp/filename: empty", "ASCII text", ...
   
`mkdir <dir>` : create a directory
`mkdir-p photos/2005/noel` : create folder noel and parents folder if they do not exist
`rmdir <dir>` : removes a directory (must be empty)
`rmdir -p foo/bar/baz` : removes baz and parents directories if they are also empty.

`rm <file>` : removes a file
`rm -rf <dir>` : removes all files and directory (force mode, no confirmation)
`rm -rf foo/bar/baz`

`ls` : list files
   * -a (--all) : do not hide entries starting with .
   * -A (--almost-all) : -a + do not list implied . and ..
   * -l : long listing format
   * -r (--reverse) : sort order reverse
   * -t : sort by modification time 
   * -S  sort by file size
   * -d, --directory list directory entries instead of content
   * -h, --human-readable print file sizes in human readable format K/M/G (e.g., 1K 234M 2G)
   * -R  --recursive list subdirectories recursively
   * -L --dereference when showing file information for a symbolic link, show 
   *       information  for  the file the link references rather than for the link itself
   * --color=tty option shows items in different colors according to their type. For example, directories are blue, executable files are green, symlinks are cyan, etc.
   * -F --classify append indicator (one of */=@|) to entries  > indicate type. You might not like mixing -F and --color=tty !
   
```bash
ls –Al
ls –altr
ls -lh
ls –l | grep "^reload"
ls reload* | xargs grep "mot"

# -g (<=> -l but do not list owner, -o: -l but do not list group) 
ls -go 
```

list files using find
-`find /path/to -print`
-`find /pinfo/reprise -type f -name "*.sql"`
-`find * -type f -name "*.sql"`
- `find /path/to  -name "*.sql" -maxdepth 2

`ln -s file link` : create a symbolic link to file

`cat` : Concatenate and print (display) the content of files on the Std Input.
   * `-n`: display line numbers
   * `-v`: Displays non-printing characters
   * `-E`(--show-end): display $ at end of each line
   * `-s`(--squeeze-blank): suppress repeated empty output lines
   
```shell
cat /etc/release
#> Solaris 10 8/07 s10x_u4wos_12b X86 Copyright 2007 Sun Microsystems, Inc.  All Rights Reserved.
# combine two files
cat File1.txt File2.txt > File1-File2.txt
# combine two files but also eliminate duplicates
sort -u File1.txt File2.txt > unique_union.txt
my_variable=`cat File3.txt`
```

`head | tail` : First | Last lines of a file
```shell
# extract csv header line
head -n 1 results_2017.csv
# count number of separators in header line (tr : translate function, wc : count -c count of bytes, -l count of lines)
# tr -cd "," rmoves all non "," chars
head -n 1 results_2017.csv | tr -cd "," | wc –c
# header length
head -n 1 results_2017.csv | tr ',' ' ' | wc –w
```

`wc` : **w**ord **c**ount : count number of line or words in a file 
* -c (--bytes)
* -m (--chars) : char counts 
* -l (--lines) : newline couts
* -w (--words) : word counts

`wc file.txt`
> <number of lines>, <number of words>, <number of bytes>
`wc -L <file>`: length of longest line

Number of lines in a file, omitting the filename in the result
`wc -l < job.log`

`more <file>`: output/view the contents of file one screen at a time (Paging tool).
`less <file>` : terminal pager program to view the contents of a text file one screen at a time. (similar to `more` with extended features like forward/backward navigation).

## Diff
* `diff`
* `tkdiff`

## permissions
`chmod 744 <file>`
`chmod [ugoa][+-][rwx] <file>` :+ adds, - removes permissions (u:user, g:group, o:others, a: all)
`chmod u+rw <file>` set RW for file owner

| RWX          | Permission |
| ------------ |:----------:|
| R: 2²   =4   | 7 = RWX    |
| W: 2^(1)=2   | 6 = RW-    |
| X: 2^(0)=1   | 5 = R-X    |
|              | 4 = R--    |

`chown` : change owner
`sudo chown aurru:bogrp file.txt`

`chgroup` : change group
`chgrp bogrp file.txt`

### SUID, SGID, Sticky bits
`chmod g+s <dir>` : set the group ID on the directory`chmod ug+s`chown

* https://openclassrooms.com/courses/les-chmod
* https://fr.wikipedia.org/wiki/Setuid

## Disk Space & Usage
### df : File System Disk Space Usage
* `df –k /db/salesdata` : Filesystem  
* `df –h .` : FileSystem containing current dir
* `df /db/prod/bi/logs | grep –vE ‘^Filesystem|tmpfs|cdrom’ | awk ‘{ print $4}’ | grep –v ‘^$’`

```
Filesystem                  Size  Used Avail Use% Mounted on
/dev/mapper/VGDATA-lv_data  493G   37G  431G   8% /data
```

### du : file space usage
* `du –h –s .` : -s : sum
* `du –h –s *`
* `du -h -s /db/sasdata_5/sas_lib`

```bash
# ls + awk (ls est limité)
ls -lt *_mp* | awk '{tot += $5} END {tot=tot/1024 ; printf(" TOTAL SIZE (kb): %4.2f\n",tot)}'
# with find + du (warning : Si pas de fichiers matches renvoie la taille totale)
find . -type f -name "*_mp*" | xargs du -k | sort -n | awk '{tot += $0} END {tot=tot/1024 ; printf(" TOTAL SIZE (Mb): %4.2f\n",tot)}'
find . -type f -name "*_mp*" | xargs du -k | sort -n | awk '{tot += $0} END {tot=tot/1048576 ; printf(" TOTAL SIZE (Gb): %4.2f\n",tot)}'

# biggest directories at depth 1 in /usr/lib on your virtual machine?
find /usr/lib -mindepth 1 -maxdepth 1 -type d -exec du -hs {} \; | sort -hr | head -10
du -hs /usr/lib/* | sort -hr | head -10 

# 5 biggest directories in /home/saasbook, including hidden folders? 
find /home/saasbook -type d -exec du -hs {} \; | sort -hr | head
```

```perl
# returns the size of the file system
my $df_cmd = `du -sh $dir/$cur_dir`; 
#--------------------------------
# Extract the size of the folder
$df_cmd =~ /(\d+\.?\d*\w+)/;
  my $size = $1;
  
my $df_cmd = `df $nfs_to_check | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print \$4}' | grep -v '^\$'`; 
$df_cmd =~ /(\d+)%/;
my $percente_used = $1;
/* It’s extracting the percent of nfs used*/
```


## Archives / Zip
`tar` <cxvf> 
* c  : create | x : extract
* v : verbose
* f : use file passed as argument
* z|j|J : compression

http://doc.ubuntu-fr.org/tar 


```
tar -cvf arhive_name.tar file1 file2
tar –xvf archive_name.tar –C dir/
tar –cvf arhive_name.tar dir_to_tar/
tar –xvf archive_name.tar 

tar –zcvf arhive_name.tar.gz dir_to_tar/
tar –zxvf arhive_name.tar.gz

tar –xvwf
tar –xvf mon_fichier.tar
tar -zcvf model_on_492k.tar.gz model_on_492k
tar | rsh dd
```


# Text Processing
tr, sed, awk, head, tail, sort, cut, uniq
grep, find, cat

## echo
- echo "$str": preserves newlines if var is between quotes!

```bash
echo this is it
echo "string: $string"
echo -n : do not output the trailing newline
echo -n "$string"

echo toto; echo titi
```


## tr (translate : translating, or deleting, or squeezing repeated characters.)
tr read from StdIN, write to StdOUT
```bash
# lower to uppercase
tr [:lower:] [:upper:]
tr a-z A-Z
 
# brace into parenthesis
tr '{}' '()' < inputfile > outputfile
 
# removes spaces
tr -d ' ' <file.txt

# change spaces into tabs
echo "This   is   for testing" | tr [:space:] '\t'
# change spaces (first occurence) into tabs using -s (squeeze repetition)
echo "This   is   for testing" | tr -s [:space:] '\t'
#> This	is	for	testing

# convert multiple continuous spaces with a single space using the -s (squeeze) option
 echo "This  is  for testing" | tr -s [:space:]
 echo "This  is  for testing" | tr -s [:space:] ' '
 
# removes digits
echo "my username is 432234" | tr -d [:digit:]

# join all lines (translate newlines into spaces)
tr -s '\n' ' ' < file.txt
```

## awk
*awk* works very well with tabular data (data files organized by rows/lines and columns).
Default field delimiter is any run of spaces and/or tabs and/or newlines `FS=[ \t\n]+`
The default record separator (RS) is s a newline and if set this disable newline as a field delimiter.

`awk '/search pattern1/ {Actions} /search pattern2/ {Actions}' file.txt`


```bash
# cat file.txt
awk '' file.txt
awk '{print;}' file.txt

awk '{print $2,$5;}' employee.txt

awk -F"." '{print $1}'
# prefix all lines with a word
ls -l | awk -F"\n" '{print "Error: "$1}'
```

awk example : http://www.thegeekstuff.com/2010/01/awk-introduction-tutorial-7-awk-print-examples/ 

__tonio.txt__
```
gizotso 10
bear 11
whitebear 14
```

`awk '{print $2;}' tonio.txt`
> 10 </br> 11 </br> 14

`awk '/bear/' tonio.txt`
>bear 11</br> whitebear 14


`awk -F"+" '`

### parsing file listing with awk
```
ls -got /path/to/data_*.csv \  # list files matching a pattern
| head -1 \                    # keep only latest generated
| awk '{print "xxx " $5 " " $4 "-" $6}' # parse date and print some parts
# -rwxrwxr-x 1     2025 Dec  2 03:48 /path/to/data1.csv
# -> xxx 2 Dec-03:48
```

* http://www.funix.org/fr/unix/awk.htm
* https://www.tutorialspoint.com/unix_commands/awk.htm
* http://www.thegeekstuff.com/2010/01/awk-introduction-tutorial-7-awk-print-examples
* https://www.lifewire.com/write-awk-commands-and-scripts-2200573
* https://www.digitalocean.com/community/tutorials/how-to-use-the-awk-language-to-manipulate-text-in-linux
* https://www.gnu.org/software/gawk/

## sed : Stream EDitor
Sed performs basic text transformations on an input stream `sed <option> {command} file`

`sed -e '/pattern_1/ {cmd1; cmd2} ; /pattern_2/ {cmd3; /sub_pattern/ {cmd4} }'`
   * -e (--expression=script) script : add the script to the commands to be executed
   * -r (--regexp-extended)

```
# sed run with empty script returns file as it (like cat command)
sed {''} file.txt
sed '' file.txt
sed -e '' file.txt
```

sed substitution (s) : `sed 's/.../.../g'`
```
# substitutions
# without the g, 1srt occurence is replaced. s/.../.../2 will replace 2nd.
# replaces all occurrences of ‘hello’ to ‘world’ in the file input.txt:
sed 's/hello/world/' file.txt > output.txt
# one to one char translation : i->a, o->x
echo "This is Cool. " | sed -e 'y/io/ax/'

# in place edit file.txt with sed -i
sed -i 's/hello/world/g' "file 1.txt"

# delete command: (d)
# deline line 20 and 30 (-e allows to pass multiple commands)
sed -e '20 d; 30 d' file.txt
# delete line 20-30
sed "20,30d" file.txt
# delete lines containing hello
sed "/hello/d" file.txt
# delete line between line starting with Hello and line starting with GoodBye
sed '/^Hello/, /^GoodBye/d' file.txt

# delete empty lines
sed '/^$/ d' file.txt
# delete commentary lines (lines starting with a #)
sed '/^#/ d' file.txt

# remove leading blanks (^[ \t]*: ^start of the line, one or more blank spaces/tabs
echo "     This is a test" | sed -e 's/^[ \t]*//'

# remove leading and trailing blanks
sed 's/^[ \t]*//; s/[ \t]*$//'
# remove trailing blanks
sed 's/ *$//g'

# change tabs into 3 spaces
sed -re 's/\t/   /g'
# uncomments and remove leading spaces (\s*)
sed -re 's/^# *//'

# add CR at the end of each line (unix2dos)
CR=$(printf '\r')
sed "s/\$/$CR/g" file.txt > file.txt
```

sed -n
```
# -n : quiet, prints only specified lines with command p.
# prints only lines starting with a #
sed -n '/^#/p' file.txt
# prints only lines not starting with a # or ;
sed -n '/^[^#;]/p" file.txt
# prints lines between 2 words/patterns 
sed -n '/Word1/,/Word2/p' /path/to/file
sed -n '/<VirtualHost*/,/<\/VirtualHost>/p' /etc/httpd/conf/httpd.conf
# this is also possible with sed -e sed -e 's/Word1\(.*\)Word2/\1/'
```

```
# ajout d'un prefix '###' au debut (^) de toutes les lignes matchant 'rwx'
ls -l | sed -e '/rwx/ {s/^/###/}'
# multiple substitutions can be done for lines matching : ajout de #### deb de ligne et de --- fin de ligne
ls -l | sed -e '/rwx/ {s/^/###/;s/$/ ---/}'
# avec sed -r (regular exp extended) : captured expression
ls -l | sed -r '/rwx/ s/^(.*)$/### \1/g'
ls -l | sed -r 's/^(.*)$/### \1/g'
```

```
cat Sbinname_Correlation2.html | sed –e 's/div_rh/<div style=”writing-mode: tb-rl”>/g' –e 's/end_div_rh/<\/div>/g' > output.html

sed –e 's/hello/bonjour/g' –e 's/<div>/<div2>/g' toto.txt > output.txt

sed –e 's/end_div_rh/<\/div>/g' –e 's/div_rh/<div style=”writing-mode: tb-rl”>/g'  Sbinname_Correlation2.html > Sbinname_Correlation3.html

```

* https://openclassrooms.com/courses/la-commande-sed
* http://www.funix.org/fr/unix/expr-sed.htm
* https://www.gnu.org/software/sed/manual/sed.html
* https://www.computerhope.com/unix/used.htm
* https://www.lifewire.com/example-uses-of-sed-2201058
* http://www.thegeekstuff.com/2009/09/unix-sed-tutorial-printing-file-lines-using-address-and-patterns/
* https://www.digitalocean.com/community/tutorials/the-basics-of-using-the-sed-stream-editor-to-manipulate-text-in-linux
* [delete CRLF with sed](http://www.canbike.org/information-technology/sed-delete-carriage-returns-and-linefeeds-crlf.html)

## Useful parsing examples
```bash
# 5 most frequently visited URLs ? 
cat wc_day6_1.log| cut -d ' ' -f 7 | sort | uniq -c | sort -nr | head -5

# print the top 5 URLs which did not have return code 200.  
cat wc_day6_1.log | cut -d ' ' -f 7,9 | grep -v 200 | cut -d ' ' -f 1 | sort | uniq -c | sort -nr | head -10
```

# User & System Admin
* `id -a` : print user and group Ids
* `su` : **S**witch **U**ser
   * `su -gizotso` 
* `sudo` : executes a command as another user
   * `sudo su -sasuser`
   * `sudo apt-get update` : ask for root password and run command
   * https://www.howtoforge.com/tutorial/sudo-vs-su/
* `groups` : list groups
* `newgrp pesgrp` : use a group
* `last` : last logged users. (-d option)

* alias
   * `alias ll ls –l`
   * `alias h history`
   * `alias L ls -Fla`

* `uname -a` : print system information
* `which` : print system information
* `psrinfo -p` : number of physical processors. `psrinfo -pv`
* `mpstat ` : Report processors related statistics
* `which python` : locate a command
* `Iostat –xnczM 2` : IO Stats
* `who` : show who is logged on

Current **P**rocesses **S**napshot
* ps –aux :tous les processus en cours
* ps –u : tous les processus du user courant

* `ps –e` : -e all processes
* `ps –edf | grep 7753` : -f full format listing, -d all processes except session leaders
* `ps –ef | grep spaw | awk ‘{print $2}’ | xargs kill /usr/ucb/ps –eaux | grep | 19156 | grep –v grep`
* `ps –deaf`
* `ps -eaf | grep -i reprise | grep -v grep | wc -l` : looks for process matching reprise and returns number of lines
* `ps aux` : BDS syntax

* `top` : display linux processes
   * `top -u gizotso`

* `kill -9` : terminate a process
* `xkill` : terminate a process

* `kicker -nofork` : restart KDE menu
* `kwin --replace &`, `kwin --replace --display svrlnvnc09:25` : To run when windows are not sizable anymore

* `ypcat passwd | grep –I gizotso`
* `ypcat –k auto.data`

## Dates
* `date` :print or set the system date and time
* `cal` : displays a calendar

## scheduler
* `crontab –l <| grep string_to_find>` : 
* `crontab –v` : displays the last time you edited your crontab
* https://en.wikipedia.org/wiki/Cron
* http://www.adminschoice.com/crontab-quick-reference
```
 ┌───────────── minute (0 - 59)
 │ ┌───────────── hour (0 - 23)
 │ │ ┌───────────── day of month (1 - 31)
 │ │ │ ┌───────────── month (1 - 12)
 │ │ │ │ ┌───────────── day of week (0 - 6) (Sunday (0) to Saturday;
 │ │ │ │ │                                       7 is also Sunday on some systems)
 │ │ │ │ │
 │ │ │ │ │
 * * * * *  command to execute
```

examples
```
# run every 5 minute
0,5,10,15,20,25,30,35,40,45,50,55 * * * * /db/scripts/launch_extraction.sh

# run evry 3 hours
0 0,3,6,9,12,15,18,21 * * * /db/scripts/launch_extraction.sh

# every day at midnight (@daily)
0 0 * * * /db/scripts/archive_data.sh
# every day 0am and 12 am
0 0,12 * * *

# hourly (@hourly)
0 * * * *

# weekly
0 20 * * 1
```


# Network
## SSH
gpg : http://www.gnupg.org/documentation/

Generate ssh keys
```
$ ssh-keygen -t rsa -b 4096 -C gizotso@gmail.com


# generate a public/private key
# ssh-keygen: -t type, -N passphrase, -C : comment 
ssh-keygen -t rsa -N '' -C 'Texas-PES-Dev' 
```


## Xhost, Display
`xhost +`: access control disabled, clients can connect from any host

```
echo $DISPLAY
setenv DISPLAY svr1.tif.texas.com:15.0`

#warning : no space in variable assignation
export DISPLAY=svr1.tif.texas.com:15.0
```

https://www.lifewire.com/linux-command-xhost-4093456

## FTP
```
cd ouptut_dir
FTP server1.tif.texas.com
Id
Password
> cd source_dir
> get file
```

## SCP
### copy local to remote
```bash
scp <local folder>/script.sql user@server:/<target folder>
scp /data/csv/*.csv user@server:/data/in
```

### copy remote to local
```bash
scp user@server:/<remote folder>/script.sql <local target folder>/.
```


- http://www.computerhope.com/unix/scp.htm

## RSYNCH
- `rsynch`
   - `-e` : preserve executability
   - `–z` : compress
   - `--progress` : give some file transfer stats
   - `--stats`
   - `--delete`  : delete extraneous files from dest dirs

- https://doc.ubuntu-fr.org/rsync
- https://unix.stackexchange.com/questions/57305/rsync-compare-directories 

```bash
rsync -avz --rsh ssh --chmod=ug+rw /db/data_lc/sas_lib/limits 
```

```bash
cd /db/tifpes/prod/sasflow/products/o5/out/web/archive
rsync -avz --rsh ssh --chmod=ug+rw /db/sasdata_omap5/out/web/archive gizotso@lake.texas.com:/data/ades6/prod/ewtbu/sasflow/products/omap5/out/web/
```

### Rsynch Local -> Remote
```bash
rsync -e ssh -avz /<source folder>/ oramane@frsarexc01db01:/<target folder>/
```
### Rsynch Remote -> Local
```bash
rsync -e ssh -avz --stats --exclude=log --exclude=bad --exclude=csv user@server:/bi/scripts/ /drives/d/tonio/bi/scripts/

cd /drives/d/tonio/bi
rsync -e ssh -avz user@server:/pinfo/reprise/scripts/ ./scripts/
```



## VNC
add/remove vncerver
```
ssh svrlnvnc01
nohup vncserver –geometry 1280x950 –depth 24
# check vncserver has been created: ps –ef | grep gizotso | grep vnc 
#> New desktop is lncpu0148.farwest.com:2
```
remove
```
ssh svrlnvnc01
ps -ef | grep gizotso | grep vnc
#> New desktop is lncpu0148.farwest.com:2
vncserver -kill :2
```

## XArgs
* http://www.thegeekstuff.com/2013/12/xargs-examples

# References
- [Linux Shell Scripting @cyberciti.biz](https://bash.cyberciti.biz/guide/Main_Page)
- http://doc.ubuntu-fr.org/sed manipulation/substitutions de strings
   - https://help.ubuntu.com/community/grep
   - https://help.ubuntu.com/community/find
- [LinuxCommand.org](http://linuxcommand.org)
   - [LS](http://linuxcommand.org/lc3_man_pages/ls1.html)
   - [PS](http://linuxcommand.org/lc3_man_pages/ps1.html)
   - [DU](http://linuxcommand.org/lc3_man_pages/du1.html)
- [Gnu SW Bash Reference Manual](http://www.gnu.org/software/bash/manual/bash.html)


# Unix like under Windows
* **Windows Subsystem Linux** (WSL) : Bash Ubuntu under Windows 
   * https://msdn.microsoft.com/en-us/commandline/wsl/install_guide
* GnuWin :http://sourceforge.net/projects/gnuwin32/files/ 
   * http://en.wikipedia.org/wiki/GnuWin32
   * http://gnuwin32.sourceforge.net/packages.html 
* MobaXterm http://mobaxterm.mobatek.net/plugins.html 
* MINGW : Minimalist GNU for Windows http://www.mingw.org/
   * **MSYS** http://www.mingw.org/wiki/msys
