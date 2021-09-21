

Git config crendetials:
```
git config --global user.email "you@example.com"
git config --global user.name "Your Name"
```

Learning Git:
```
https://learngitbranching.js.org/?locale=pt_BR
```

To see tree in terminal:
```
git log --graph --oneline --all
```

Remove untracked files
```
git clean -f -d
```

Remove add files, before push:
```
git reset
```


Remove branch from REMOTE:
```
git push origin --delete <branchName>
```

Delete local branch
```
git branch -D <name>
```

Create branch from another
```
git checkout -b myFeature dev
```


Create branch from commit
```
git checkout -b NEW_BRANCH_NAME COMMIT_ID
```

revert commit 
```
git revert <commit_id>
```