;= @echo off
;= rem Call DOSKEY and use this file as the macrofile
;= %SystemRoot%\system32\doskey /listsize=1000 /macrofile=%0%
;= rem In batch mode, jump to the end of the file
;= goto:eof
;= Add aliases below here
e.=explorer .
gl=git log --oneline --all --graph --decorate  $*
;= rem --- Directory Listing ------------------------
ls=ls --show-control-chars -F --color $*
ll=ls -Al --show-control-chars -F --color $*
;= rem List items matching pattern
lsg=ls --show-control-chars -F --color | grep $1
;= rem List Directories only
lsd=ls -lh | grep "^d"
lsdir=ls -lhA |grep ^d
pwd=cd
clear=cls
history=cat "%CMDER_ROOT%\config\.history"
unalias=alias /d $1
vi=vim $*
cmderr=cd /d "%CMDER_ROOT%"
;= rem Directory navigation alias
..=cd ..
...=cd ../..
docs=cd %HOME%
psg=ps -ef | grep $* | grep -iv grep
du=du -h
df=df -h
