# Cmd Line Search Tools

# grep (unix)
grep : Lookup for lines containing a string or pattern within a file(s) or standard input if no files are named.
Its name comes from the ed command g/re/p : (**g**lobally search a **r**egular **e**xpression and **p**rint)
Help: `man grep`


```bash
grep <options> Pattern File1 <File2> ...
   -i : case insensitive
   -e Pattern (--regexp=Patern)
   -E (--extended-regexp)
   -Hn : print filename (-H) and line numbers (-n)
   -h : no filename printing
   -f patternfile (--file=patternfile)
   -c : print a count of matching line for each input file
   -C : print n leading and trailing context lines
   -R (--recursive) : Read all files under each directory, recursively
   -v (--invert-match)
```

```sh
# search for 'text_to_find' in file.txt
grep text_to_find file.txt
grep text_to_find *.txt
grep "text_to_find" *.txt

# Search for word BOB any case in current Working dir
grep –i w BOB *

grep text_to_find *

grep -iR QUALIF .

grep "rm -f" *

# lookup from . lines containg '.sql'
grep -iR ".sql" .

# lookup from . lines containg '.sql' And remove lines that contains # (-v : invert match)
grep -iR ".sql" . | grep -v #
# lookup from . lines containing 'error' And remove code comment lines returned in 1st grep (contains '.sql:--')
grep -iR "error" . | grep -v  "\.sql:\-\-"
```

```
#lookup in current dir with grep
grep -i 'hello world' menu.h main.c
grep "spam" *.py*
#-r seems not working
grep -r "spam" *.ipynb
grep -r --include "*.txt" texthere .  <=> find ./ -type f | xargs grep "foo"
grep --include="*.xxx" -nRHI "my Text to grep" *
```

## grep OR, AND, NOT
http://www.thegeekstuff.com/2011/10/grep-or-and-not-operators

```
# grep AND
grep -E "chaine1.*chaine2" file

grep -E 'pattern1' filename | grep -E 'pattern2'
```

```
# grep OR
grep -E 'pattern1|pattern2' filename
egrep 'pattern1|pattern2' filename
```

```
# grep NOT
grep -v 'pattern1' filename

egrep 'Manager|Developer' employee.txt | grep -v Sales
```

# find (unix)
find : list files matching some criteria

```sh
# Files with name containing 'toto', lookup from directory /usr
find /usr -name toto -print

# Files with name ending with '.C', lookup from directory /usr
find /usr -name " *.c " -print

# Files modified in last 3 days, lookup from /
find / -mtime 3 -print

# count number of files
find . -name \*.cpp | wc -l <=> dir /b/s *.py | find /c /v ""
```

http://www.devdaily.com/unix/edu/un010013/
```
find . -newer -name "*.sas" –type f
find . -mtime -5 -ls 
find ./ -name "*.sas" -mtime 5
# Find and display files last modified less than 90 days ago. 
find . -name "*" -mtime -90 -print 

# list directories under /db/products
find */out/web/temp/analysis/ -name "*No_title*" -type d -maxdepth 1
# remove them
find */out/web/temp/analysis/ -name "*No_title*" -type d -maxdepth 1 | xargs rm -rf
```

## find + exec
```sh
find . -name Thumbs.db -exec rm {} \;
find /apps/tmp -type f -name "*[0-9].tar" -mtime +5 -exec rm -f {} \;

# Supprimer les fichiers d’une arborescence entière
ls | xargs rm –f
find . -type f -exec rm {} \;
```

## find + grep 
```sh
find . -type f -exec grep montexte {} \;
find . -type f -exec grep QUALIF {} \;

find . -type f -name *.sql -print | xargs grep -i ".sql" | grep "REM"
find . -type f -name *.sql -print | xargs grep -i "@.*\.sql" | grep -v "REM"

find . -name "*repr*" -type f

find . -type f -print | xargs grep -i "@.*\.sql" | grep -v "REM"
```

```
find /foo/bar -type f -maxdepth 1 | xargs rm -n100
```

## find + wc
```
# number of files
find /cdb/sas-Flow/common/sas_macros/ -type f | wc –l
# number of code lines and words
find /cdb/sas-Flow/common/sas_macros/ -type f | xargs cat | wc –lw
```

# Find and FindStr (Windows)
## Find
`Find /?`
- https://technet.microsoft.com/en-us/library/cc755121(v=ws.10).aspx
- https://www.howtogeek.com/206097/how-to-use-find-from-the-windows-command-prompt/

Recherche de la chaine modtools dans le fichier Package_list.txt
`find "modtools" Package_list.txt`

`for %f in (*.bat) do find "PROMPT" %f`



## Findstr
`FindStr /?`

FINDSTR
http://stackoverflow.com/questions/8844868/what-are-the-undocumented-features-and-limitations-of-the-windows-findstr-comman
https://technet.microsoft.com/fr-fr/library/cc725655(v=ws.10).aspxs

REM find BackgroundColor string in all files in current dir
`findstr "BackgroundColor" *`

recherche de la chaine spam dans tous les fichiers *.py du répertoire et des sous repertoires
`findstr /s /i "spam" *.py`

recherche récursive des fichiers contenatns spam parmis les fichiers .ipynb
`findstr /s /i "spam" *.ipynb`

findstr /s /i Windows *.* 
findstr /p /s /i .
findstr /i /n "\<searchstring\>" c:\Users\karl\Desktop\Report.csv


# References
- http://lea-linux.org/documentations/Trucs:Grep_:_chercher_un_texte_dans_plusieurs_fichiers
- https://www.techonthenet.com/linux/commands/grep.php
- https://www.cyberciti.biz/faq/howto-use-grep-command-in-linux-unix/
- http://www.it-connect.fr/cours-tutoriels/administration-systemes/linux/linux-systeme/
- http://www.it-connect.fr/rechercher-un-mot-dans-plusieurs-fichiers-ou-dossiers-sous-linux/
- https://openclassrooms.com/courses/reprenez-le-controle-a-l-aide-de-linux/extraire-trier-et-filtrer-des-donnees
- http://www.funix.org/fr/unix/grep-find.htm
- http://www.thegeekstuff.com/2009/03/15-practical-unix-grep-command-examples
-http://www.rexegg.com/regex-quickstart.html

## Grep Tool in Windows
- Console Replacement: MobaXterm, Cmder/ConEmu (cmder/vendor/git-for-windows/usr/bin)
- [grepWin (portableApps)]( http://stefanstools.sourceforge.net/grepWin.html) : XP not supported
   - command line : http://stefanstools.sourceforge.net/grepWin_cmd.html 
   - `grepWin-x64-1.6.17_portable.exe /searchpath:"C:\gizotso\dwh\BI_Repo\scripts" /searchfor:"UPDATE"`
- [AstroGrep](http://astrogrep.sourceforge.net/)
- [GNUWin32 tools (project discontinued)](http://gnuwin32.sourceforge.net/) : grep-2.5.4, wget, ggrep?
   - distributed in R Studio. (%R_STUDIO%\bin\gnugrep)
- https://superuser.com/questions/300815/grep-equivalent-for-windows-7


