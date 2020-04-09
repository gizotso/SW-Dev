# GIT References
* [Git How To](https://githowto.com/) : Very nice tutorial

* [Git - the simple Guide by Roger Dudler](http://rogerdudler.github.io/git-guide/)

* [GIT](https://git-scm.com/doc)

* [Pro GIT Book](http://progit.org/book/)
* [GIT wikibooks](http://fr.wikibooks.org/wiki/Git)
* [GitHub GIT Cheat Sheet](https://services.github.com/on-demand/downloads/github-git-cheat-sheet/) [ (pdf)]
   * https://github.github.com/training-kit/downloads/github-git-cheat-sheet/
* [GIT Cheat Sheet iansheridan@GitHub](https://gist.github.com/iansheridan/870778)
* [GitHub Flow](https://guides.github.com/introduction/flow/)  
* [GIT Ubuntu Doc](http://doc.ubuntu-fr.org/git)
* GIT Flow
* https://blog.osteele.com/2008/05/my-git-workflow/ (nice charts)

Git online servers
* [GitHub](https://github.com)
* [GitLab](https://about.gitlab.com/)

* Git Data Transport Command schema by Olivier Steele
![Git Data Transport Command schema by Olivier Steele](https://images.osteele.com/2008/git-transport.png)

* [Git Funcamentals tuto](https://code.snipcademy.com/tutorials/git/fundamentals/three-states-areas)
![Git Funcamentals tuto](https://code.snipcademy.com/code/img/tutorials/git/fundamentals/three-stages-01.svg)

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
* Bundled within Cmder Console

## Git config
**.gitconfig** : configuration file located under $HOME directory that stores git configuration
**.gitignore**

```
# configure user for all local repositories (set under $HOME\.gitconfig)
git config --global user.name "Joe Dalton"
git config --global user.email "joedalton@texas.fr"

# options for line ending
git config --global core.autocrlf true
git config --global core.safecrlf true

git config --global color.ui auto
```

### GIT env variables
GIT_EDITOR, EDITOR 
https://git-scm.com/book/en/v2/Git-Internals-Environment-Variables
https://markb.co.uk/portable-git-windows-setting-home-environment-variable.html

With Cmder Console : GIT_INSTALL_ROOT=D:\PortableApps\cmder\vendor\git-for-windows

# GIT commands

## Manage Repositories
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
```

## Add/Remove files - Staging
[Git-add help](https://git-scm.com/docs/git-add)

```
# Stages file1 and file 2
git add <file1> <file2>

# Stages all files under Dir (recursively)
git add <dir>

# Stages content from all *.txt files under Documentation directory and its subdirectories
git add Documentation/\*.txt
```

Add the files in the local repository and stages them for commit.
```
# Add all the changes from that level
# > Stage All (new, modified, deleted) files
git add .

# Stage All files on the Repo
git add *
```
To unstage a file, use `git reset HEAD YOUR-FILE`.

```
# add all the changes (-A <=> --all)
#  new files, files already tracked in current working tree, and removed files from index that are no longer in the working tree
#  <=> git add .; git add -u .
#  with GIT v2.x <=> git add .
git add --all

# Stages modified and deleted files only (without new files)
git add -u
git add --update

# Stages New and Modified files only
git add --ignore-removal .
```

```
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
- Changes to be commited (use `git tm --cached <file>` to unstage) 

`git status`
> On branch master</br>Initial commit</br></br>Untracked files:</br> (use "git add <file>..." to include in what will be committed)</br>       hello.html

```
git add hello.html
git status
```

> On branch master</br>Initial commit</br></br>Changes to be committed:</br>  (use "git rm --cached <file>..." to unstage)</br>        new file:   hello.html


## Modifying files and Staging the changes
Once a tracked file has been modified, it needs to be "staged" which means flagged as files to be taken into account for next commit
Staging steps allow to manage what goes into a commit and when. 

`<h1> Hello </h1> > hello.html`

`git status`

> On branch master</br>Changes not staged for commit:</br>  (use "git add <file>..." to update what will be committed)</br>  (use "git checkout -- <file>..." to discard changes in working directory)</br></br>        modified:   hello.html</br></br>no changes added to commit (use "git add" and/or "git commit -a")</br></br></br></br>

`git add hello.html`

`git status`

> On branch master</br>Changes to be committed:</br>  (use "git reset HEAD <file>..." to unstage)</br></br>        modified:   hello.html


## Commit Changes
`git commit -m "Changes on hello.html"`

`git status`
> On branch master</br>nothing to commit, working tree clean

## Repo History
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
```
git hist
git checkout <hash>
```


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


# Syncing / Remotes
* https://www.git-tower.com/learn/git/faq/difference-between-git-fetch-git-pull
* https://www.atlassian.com/git/tutorials/syncing
* https://stackoverflow.com/questions/292357/what-is-the-difference-between-git-pull-and-git-fetch
* http://www.differencebetween.net/technology/difference-between-git-fetch-and-git-pull/

```
# list remotes
git remote
git remote -v
```
> origin  https://github.com/gizotso/Python.git (fetch)<\br>origin  https://github.com/gizotso/Python.git (push)

```
# list GIT repo branches
git branch -a
```
> * master</br>remotes/origin/HEAD -> origin/master</br>remotes/origin/master

```
# get details on remote origin
git remote show origin
```

## Fetch : update your local with the remote
git fetch really only downloads new data from a remote repository - but it doesn't integrate any of this new data into your working files. 
Fetch is great for getting a fresh view on all the things that happened in a remote repository.
Due to it's "harmless" nature, you can rest assured: fetch will never manipulate, destroy, or screw up anything. This means you can never fetch often enough.

* https://www.atlassian.com/git/tutorials/syncing/git-fetch

```
# git fetch <remote> : Fetch all of the branches from the repository. This also downloads all of the required commits and files from the other repository.
git fetch

# Get modifications from remote named origin without integrated them (need a merge)
git fetch origin

# idem but only for the specified branch
git fetch <remote> <branch>

# -dry-run option will perform a demo run of the command. I will output examples of actions it will take during the fetch but not apply them.
git fetch --dry-run

# compare
git diff <remote-tracking branch> <local branch>
git diff remotes/origin/master master
git diff --stat --color remotes/origin/master master

git diff FETCH_HEAD
git log -p HEAD..FETCH_HEAD

# Merge : merge changes between a branch and the actual HEAD
git merge <branch>
```


## Pull
git pull, in contrast, is used with a different goal in mind: to update your current HEAD branch with the latest changes from the remote server. 
This means that pull not only downloads new data; it also directly integrates it into your current working copy files.

```
# pull = fetch+merge
git pull
git pull origin master
git fetch; git merge origin/master
```

## Push
```
# Pushes the changes in your local repository up to the remote repository you specified as the origin
# git push <remote-name> <branch-name>
git push

# publish my branch on the remote called origin on the master branch 
git push origin master
```

```
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

## GitHub
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
