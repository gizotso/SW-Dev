# DOC Commands Reference

`cmd /?` : getting help

# List Files
```sh
# basic filelist (bare format), no heading information or summary
dir /B

# removed information summary (matching on the date separator '/' that appears on file/folder dates)
dir . | FIND "/"

# list only folders
dir /ad

# list recursively folders
dir /ad/s .

# list recursively files (bare list)
dir /s /b

dir  /w /-C
   # /w Wide list format
   # /-C disable thousand separator

# tree (/F display file names, /A ascii)
tree /a .
tree /f /a > tree.doc
```
- [list all files folders/sub-folders](http://stackoverflow.com/questions/15214486/command-to-list-all-files-in-a-folder-as-well-as-sub-folders-in-windows), [export dir structure](https://superuser.com/questions/258287/how-can-i-export-a-directory-structure )

# List Files and match
```bat
# list all files in currend dir and subdir with name matching
   /b : brief, /s subdirectories
dir /b/s "*.txt"
dir /b /s *.pdfs

# list all files from specified dir
dir /b/s "T:\SW Dev\Python"
dir /b/s "T:\SW Dev\Python\*.txt"

# locate all files with the given extensions in the current working directory and all subdirectories
dir *.cpp *.h *.java /b/s

# with Grep installed : filter output
dir / b /s | grep txt

# tous les fichiers dont le nom contient spam
dir /b /s . | find "spam"
dir /b /s | findstr spam
dir /b /s *spam*
```


# Directory
```bat
#current directory
echo %CD%

#change current drive
E:
#change drive and directory
cd /D E:\Tools
```