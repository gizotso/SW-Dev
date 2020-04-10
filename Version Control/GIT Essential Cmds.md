# GIT Commands

## Stage all files
`git add .`

## Unstage : Discard (reset the buffer zone to HEAD)
`git reset HEAD hello.html`
## Switch to commit version : remove unwanted changes from working directory
`git checkout hello.html`

## Discard all local changes to all files permanently
`git reset --hard`
## Unstage everything - retain changes:
`git reset`

## Commit
`git commit -m "projet ML"`

## Cancel Commit : to cancel the commit, we need to create a commit that deletes the changes saved by unwanted commit
`git revert HEAD`

## Clenup : Print out the list of files which will be removed (dry run)
`git clean -n`

`git clean`


## Clone a repo from GitHub
`git clone https://github.com/gizotso/SW-Dev`

## Get changes from remote
`git pull`

## Publish changes to remote
`git push`
