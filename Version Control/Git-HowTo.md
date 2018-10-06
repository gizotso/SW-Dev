# GIT How To
https://githowto.com/setup

# 1. Preparation
## Setting up name and e-mail address

```
git config --global user.name "Your Name"
git config --global user.email "your_email@whatever.com"
```

Installation Options line endings
Also, for users of Unix/Mac:
```
git config --global core.autocrlf input
git config --global core.safecrlf true
```

For Windows users:
```
git config --global core.autocrlf true
git config --global core.safecrlf true
```

# 2. The final preparation
tutorial materials : http://githowto.com/git_tutorial.zip
- work — an empty working directory. Your repositories will be created here.
- files — prepackaged files to let you continue working with the tutorial on any stage. If you get stuck, simply copy the desired lesson into your working folder.

# 3. Creating a Project
Goals : To learn how to create a git repository from scratch.

Create a “Hello, World” page
```
mkdir hello
cd hello
touch hello.html
```

## Create a repository
```
git init
```

## Add the page to the repository
```
git add hello.html
git commit -m "First Commit"
```

# 4. Checking the status of the repository
Goals : To learn how to check the repository’s status

## Check the status of the repository
```
git status
```
The command checks the status and reports that there’s nothing to commit, meaning the repository stores the current state of the working directory, and there are no changes to record.

We will use the git status, to keep monitoring the states of both the working directory and the repository.

# 5. Making changes
Goals : To learn to monitor the working directory’s state

## Changing the “Hello, World” page
```
<h1>Hello, World!</h1>
```

## Checking the status
```
git status
```
The first important aspect here is that git knows hello.html file has been changed, but these changes are not yet committed to the repository.

Another aspect is that the status message hints about what to do next. If you want to add these changes to the repository, use git add. To undo the changes use git checkout.

# 6. Staging the changes
Goals : To learn to stage changes for the upcoming commits

## Adding changes
```
git add hello.html
git status
```
Changes to the hello.html have been staged. This means that git knows about the change, but it is not permanent in the repository. The next commit will include the changes staged.

Should you decide not to commit the change, the status command will remind you that you can use the git reset command to unstage these changes.

# 7. Staging and committing
A staging step in git allows you to continue making changes to the working directory, and when you decide you wanna interact with version control, it allows you to record changes in small commits.

Suppose you have edited three files (a.html, b.html, and c.html). After that you need to commit all the changes so that the changes to a.html and b.html were a single commit, while the changes to c.html were not logically associated with the first two files and were done in a separate commit.

In theory you can do the following:
```
git add a.html
git add b.html
git commit -m "Changes for a and b"
```

```
git add c.html
git commit -m "Unrelated change to c"
```
Separating staging and committing, you get the chance to easily customize what goes into a commit.


# 8. Commiting the changes
Goals : To learn to commit to the repository

## Committing changes
Well, enough about staging. Let’s commit the staged changes to the repository.

When you previously used git commit for committing the first hello.html version to the repository, you included the -m flag that gives a comment on the command line. 
The commit command allows interactively editing comments for the commit. And now, let’s see how it works.

If you omit the -m flag from the command line, git will pop you into the editor of your choice from the list (in order of priority):
- GIT_EDITOR environment variable
- core.editor configuration setting
- VISUAL environment variable
- EDITOR environment variable

```
git commit
```
On the first line, enter the comment: “Added hi tag”. Save the file and exit the editor.

## Checking the status
At the end let us check the status.

```
git status
```
The working directory is clean, you can continue working.

# 9. Changes, not files
Goals : 
Understanding that git works with the changes, not the files.


# 10. History
https://githowto.com/history
```
git log
git log --pretty=oneline
```

```
git log --pretty=oneline --max-count=2
git log --pretty=oneline --since='5 minutes ago'
git log --pretty=oneline --until='5 minutes ago'
git log --pretty=oneline --author=<your name>
git log --pretty=oneline --all
```

```
git log --all --pretty=format:"%h %cd %s (%an)" --since='7 days ago' --author=alex
```

Ultimate format log
```
git log --pretty=format:"%h %ad | %s%d [%an]" --graph --date=short
```

# 11. Aliases
https://githowto.com/aliases

.GITCONFIG
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

command aliases (Shell)
```
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias go='git checkout '
alias gk='gitk --all&'
alias gx='gitx --all'

alias got='git '
alias get='git '
```

# 12. Getting older versions

# 13. Tagging versions

# 14. Discarding local changes (before staging)

# 15. Cancel Staged changes (before committing)

# 16. Cancelling commits

# 17. Removing a commit from a branch

# 18. Removing the oops tag

# 19. Changing commits

# 20. Moving files

# 21. More information about the structure

# 22. Inside Git: .Git directory

# 23. Git inside: Direct work with git objects

# 24. Creating a Branch

# 25. Navigating Branches

# 26. Changes to master branch

# 27. View the different branches

# 28. Merging

# 29. Creating a conflict

# 30. Resolving Conflicts

# 31. Relocating as an alternative to merging

# 32. Resetting the style branch

# 33. Reset of the Master branch

# 34. Rebase

# 35. Merging to the Master branch

# 36. Multiple repositories

# 37. Cloning repositories

# 38. Examine the cloned repository

# 39. What is origin?

# 40. Remote branches

# 41. Changing the original repository

# 42. Fetching changes

# 43. Merging pulled changes

# 44. Pulling and merging changes

# 45. Adding a tracking branch

# 46. Bare repos

# 47. Adding a remote repository

# 48. Submitting changes

# 49. Removing common changes

# 50. Placing your git repository

# 51. Sharing repositories
