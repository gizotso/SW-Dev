# Alias
```
alias h='history | grep $1'
# alias h 'history | egrep .\*\!*'

alias ssh='ssh -X'

# processes
# ps -e|A :all processes, -f:full format listing
alias psg='ps -ef | grep $1'
# ps -edf
```

## Directory navigation aliases
```
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
```

## LS : List Files
```
# The --color=tty option shows items in different colors according to their type.
# For example, directories are blue, executable files are green, symlinks are cyan, etc.
# The -F option appends a symbol after entries to indicate their types.
# You might not like both options at the same time.

alias ls='ls -F --color=tty' #regular ls
alias lsg  = 'ls | grep $1'
alias lsd='ls -l | grep "^d"' # list only directories
alias lsdir='ls -lhA |grep ^d'
alias l.='ls -dF .[a-zA-Z0-9]* --color=tty' #only show dotfiles
alias ll='ls -lhF --color=tty' #long listing ls -l
alias llg = 'll | grep $1'
alias la='ls -Al' # show hidden files
alias lk='ls -lSr' # sort by size
#alias lt='ls -ltr' # sort by date
alias lt='ls -lAtrh' # sort by date and human readable
alias tree='tree -Cs' # nice alternative to 'ls'
alias q='exit'
alias ln='ln -s'
```

## Disk usage
```
alias df='df –h' #human
alias du='du –h' #human
# du -a --all | -k | -s --summarize  | -c --total
# du -h <=> du -h .  --size of current dir and subdirs
# du -hs   --size of current dir (sum)
# du -hc * --size of each dir/file + grand total
```

### Disk space used by files matching something
```
# need to create function
# alias dfkb="ls -lt *.* | awk '{tot += $5} END {tot=tot/1024 ; printf(""" TOTAL SIZE (kb): %4.2f\n""",tot)}\'"
# alias dfmb='find . -type f -name "*_mp*"| xargs du -k | sort -n | awk ''{tot += $0} END {tot=tot/1024 ; printf(" TOTAL SIZE (Mb): %4.2f\n",tot)}'''
# alias dfgb='find . -type f -name "*_mp*"| xargs du -k | sort -n | awk ''{tot += $0} END {tot=tot/1048576 ; printf(" TOTAL SIZE (Gb): %4.2f\n",tot)}'''
```

## Search
```
alias catg='cat $1 | grep $2'
# find -iname "*color*"  --find files with a name matching *color* (case insensitive)
# -size +100M   | -type f  (files only)| -atime +30 (access time > 30days)
# find ~ -name 'xx*' -and -not -name 'xxx'
# find . -newer -name "*.sas" –type f
# find . -mtime -5 -ls 
# find ./ -name "*.sas" -mtime 5
# find $HOME -name '*.ogg' -type f -exec du -h '{}' \;  --size that is used by *.ogg
```

```
# grep 'string' file
# -ir insensitive recursively
# grep "\<[A-Za-z].*" file  --search for any word which begins with a letter (upper|lower case)
#    ^ | $: beginning\end of a line
#    . any char
#    * 0..n
#    \< | \> beginning|end of a word
```

## File stats
```
# number of files in a directory : find /home/gizotso/ -type f | wc –l
alias nbfiles='find $1 -type f | wc –l' 
```
```
# number of lines and words
alias nblines='find $1 -type f | xargs cat | wc –lw'
```

## Safety aliases for rm, mv, cp
```
# -i : prompt before overwrite | -f : no prompt 
# -u : do not work on more recent files
alias rm='rm -iv'
alias mv='mv -iv'
# rm -rf /tmp/dir :force remove directory dir * (recursively)
alias cp='cp -iv' 
```

## apt (application manager @Ubuntu)
```
alias install='sudo apt-get install'
alias uninstall='sudo apt-get remove'
alias reinstall='sudo apt-get --reinstall install'
alias remove='sudo apt-get remove'
alias purge='sudo apt-get remove --purge'
alias update='sudo apt-get update'
alias upgrade='sudo apt-get upgrade'
alias clean='sudo apt-get autoclean && sudo apt-get autoremove'
alias sources='(gksudo gedit /etc/apt/sources.list &)'
```

## tar (v:verbose | c :create)
```
# untar
alias untarz='tar -zxvf'
alias untarb='tar -jxvf'
alias tarz='tar -zcvf $1 $2'

#tar –cvf arhive_name.tar dir_to_tar/
#tar –xvf archive_name.tar –C dir/

#tar –zcvf arhive_name.tar.gz dir_to_tar/
#tar –zxvf arhive_name.tar.gz
```
