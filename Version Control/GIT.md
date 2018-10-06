# GIT References
* [Git How To](https://githowto.com/) : Very nice tutorial
* [GIT](https://git-scm.com/doc)
* [Pro GIT](http://progit.org/book/)
* [GIT wikibooks](http://fr.wikibooks.org/wiki/Git)
* [GitHub GIT Cheat Sheet](https://services.github.com/on-demand/downloads/github-git-cheat-sheet/) [ (pdf)](https://services.github.com/on-demand/downloads/github-git-cheat-sheet.pdf)
* [GIT Cheat Sheet iansheridan@GitHub](https://gist.github.com/iansheridan/870778)
* [GitHub Flow](https://guides.github.com/introduction/flow/)  
* http://doc.ubuntu-fr.org/git
* GIT Flow

Git online servers
* GitHub
* [Gitorious](https://gitorious.org/)

## GIT install
- [GIT](https://git-scm.com/download/win) Install version and Portable version.
- [Git for Windows (GIT Bash MINGW32 +GIT GUI)](https://git-for-windows.github.io/)
- [Cmder Console comes with git-for-windows](http://cmder.net/), see also ConEmu Console
- Linux : `sudo apt-get install git`

```
git --version
git --help
```

Under Windows
* Git Bash (git-bash.exe): bash emulation
* Git Cmd : GIT Windows command line interpreter

## Git config
**.gitconfig** : configuration file located under $HOME directory that stores git configuration

```
# configure user for all local repositories (set under $HOME\.gitconfig)
git config --global user.name "Joe Dalton"
git config --global user.email "joedalton@texas.fr"

# options for line ending
git config --global core.autocrlf true
git config --global core.safecrlf true

git config --global color.ui auto
```

## GIT env
GIT_EDITOR, EDITOR 
https://git-scm.com/book/en/v2/Git-Internals-Environment-Variables
https://markb.co.uk/portable-git-windows-setting-home-environment-variable.html

### Cmder
GIT_INSTALL_ROOT=D:\PortableApps\cmder\vendor\git-for-windows

## GIT commands
### Manage Repositories
```
# new local Repository
git init [project-name]
# or
mkdir [project-name]
cd [project-name]
git init

# clone a repository on your computer 
# url : https://github.com/user/repo or git://<dépot> or https://<dépot>
git clone [url /.../repo.git ]
git clone http://github.com/mozilla/chromeless.git

# define remote repository (named origin)
git remote add origin https://github.com/gizotso/iNotebooks.git

# list defined remote repositories
git remote -v

# Fetch : Update your local with the remote
git fetch remotename
```

### Add/Remove files
```
git add <file1> <file2>
# add all files under Dir (recursively)
git add <dir>
git add .

# initialize the Repoistory with a README
echo # iNotebooks Repository >> README.md
git init
git add README.md
git commit -m "Added README to Repo"

# remove from the repo and local FileSystem
git rm file1.txt
git commit -m "remove file1.txt"

# remove only for the repo
git rm --cached file1.txt
```

Check currente state of the repository : `git status` (states of both working dir and repository)
- Untracked files (use git add to track)
- Changes to be commited (use git tm --cached <file> to unstage) 

`git status`
> On branch master</br>Initial commit</br></br>Untracked files:</br> (use "git add <file>..." to include in what will be committed)</br>       hello.html

```
git add hello.html
git status
```

> On branch master</br>Initial commit</br></br>Changes to be committed:</br>  (use "git rm --cached <file>..." to unstage)</br>        new file:   hello.html


### Modifying files and Staging the changes
Once a tracked file has been modified, it needs to be "staged" which means flagged as files to be taken into account for next commit
Staging steps allow to manage what goes into a commit and when. 

`<h1> Hello </h1> > hello.html`

`git status`

> On branch master</br>Changes not staged for commit:</br>  (use "git add <file>..." to update what will be committed)</br>  (use "git checkout -- <file>..." to discard changes in working directory)</br></br>        modified:   hello.html</br></br>no changes added to commit (use "git add" and/or "git commit -a")</br></br></br></br>

`git add hello.html`

`git status`

> On branch master</br>Changes to be committed:</br>  (use "git reset HEAD <file>..." to unstage)</br></br>        modified:   hello.html


### Commit Changes
`git commit -m "Changes on hello.html"`

`git status`
> On branch master</br>nothing to commit, working tree clean

### Repo History
`git log`

`git log --pretty=oneline`
> 60cb0e5c2fc3ff772727ff6f3b8f1cc5eae4957d first commit

`git log --all --pretty=format:"%h %cd %s (%an)" --since="7 days ago"`

```
git log
   --max-count=2
   --author="gizotso"
   --since="1 day ago"
   --until="5 minutes ago"
   --all
   --date=short
   # display commit tree
   --graph
   --pretty=format:"%h %ad | %s%d [%an]"
     # %h: commit hast, %ad: commit date, %s: comment, %an: author name, %d:commit decorations
```

### Gitk - a commit viewer for git
If available `gitk` command will open the gitk gui tool.

## GIT alias
Windows
```
git config --global alias.co checkout
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.br branch
git config --global alias.hist "log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short"
git config --global alias.type 'cat-file -t'
git config --global alias.dump 'cat-file -p'
```

=> .gitconfig
```
[alias]
  co = checkout
  ci = commit
  st = status
  br = branch
  hist = log --pretty=format:\"%h %ad | %s%d [%an]\" --graph --date=short
  type = cat-file -t
  dump = cat-file -p
```

Command aliases could also be added (alias in Unix, DosKeys in Windows)
```
alias gs='git status '
alias go="git checkout "
```

## Revert to previous version
Checkout any previous version into the working dir
`git hist`

`git checkout <hash>`


## Tagging versions
`git tag v1`

`git checkout v1~1` : checkout prior version to v1

`git tag v1-beta` : tag version
v1 and v1-beta can now be checkout by tag
`git checkout v1`

`git tag` : list tags

`git hist master --all` : check tags in the log


## Discard changes in the working dir (local) - before staging
1. edit file hello.html
2. `git status`
3. `git checkout hello.html` to discard changes, checkout the repository's version of the file
4. git status
5. cat hello.html

## Cancel staged changes - before commit
1. edit file hello.html
2. `git add hello.html` : stage changes
3. `git status` : change has been staged, ready for commit
4. `git reset HEAD hello.html` : reset the buffer zone to cancel staged changes
5. `git checkout hello.html` : remove unwanted changes from the working dir

## Cancel Commits
1. edit the file hello.html
2. `git add hello.html`
3. `git commit -m "Oops, I don't want to commit this shit"`
4. `git revert HEAD` : cancel last commit using `HEAD` as argument
5. `git hist`

## Remove a commit from a branch
1. `git hist`
2. `git tag oops-reverted` : tag last commited version
3. `git reset --hard v1` : reset commit to tagged version v1 (--hard parameter updated working dir to reflect the new branch Head)
4. `git hist` : commits have been removed and not listed in the master branch
5. `git hist --all` : nothing is lost
6. `git tag -d oops-reverted` : removal of tag to permit garbage collector to delete unreferenced commits.


## Remote
```
# list remotes
git remote
git remote -v

# get details on remote origin
git remote show origin

# pull = fetch+merge
git fetch
git merge origin/master

git push
```

**.gitignore**

```
git push -u origin master

#push an existing repository from the command line
git remote add origin https://github.com/gizotso/iNotebooks.git
git push -u origin master

git diff
git diff <commit1> <commit2>

# MAJ depot localgit pull  
git commit -m "What I did"
git push origin master
exas.fr
git remote -v
git remote add iNotebooks https://github.com/gizotso/iNotebooks
git remote add iNotebooks git@localhost:MyProject

git push iNotebooks master
git push --set-upstream iNotebooks master
```

# GitHub
- [GitHub Guides](https://guides.github.com/) : Getting started with GitHub, GitHub Flow
- https://help.github.com/articles/generating-ssh-keys/ 
- https://help.github.com/articles/changing-a-remote-s-url/ 
- https://help.github.com/articles/adding-an-existing-project-to-github-using-the-command-line/ 

# Clone Repository
```
# http://superuser.com/questions/230694/how-can-i-push-a-git-repository-to-a-folder-over-sshgit 
remote add origin ssh://user@server/home/user/pgm_dwh
git clone ssh://user@server/home/user/pgm_dwh
scp -r my_project.git user@git.example.com:/opt/git

https://user@192.168.100.18/repo/repository.git
scp test.txt user@server:/home/user/testscp -r pgm_dwh user@server:/home/user/test
 ssh user@server   sftp -oPort=xxxx UserClient@IPclient   git remote add origin jonas@192.168.1.10/home/jonas/code/myproject.git  jonas@192.168.1.10:code/myproject.git  git-create.bash 'jonas@192.168.1.10:code/myproject.git'git remote add origin 'jonas@192.168.1.10:code/myproject.git'git push -u origin master
git clone ssh://login@server.com:12345/repository.git
git clone ssh://login@server.com:12345/~/repository.git
```


```#!/bin/bash
USER=admlinux 
PASSWORD=tonpasseword 
CHEMIN=chemindesfichiersadl 
ftp -niv 172.21.56.2 <<FINDETEXTE user $USER $PASSWORD cd $CHEMIN mget sauveark quit
```