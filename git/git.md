
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

revert commit local
```
git revert <commit_id>
```

remove last commit from remote:
```
git reset --hard <commit-hash>
git push -f origin master
```

---

merge commits in unic commit
```
git rebase -i HEAD~<num_de_commits>
```

after this appers something like edit 'nano'
add the commits 'squash' to join a first commit

```
pick <hash_1> commit 1
squash <hash_2> commit 2

# Rebase <hash_1>..<hash_2> onto <hash> (2 commands)
```

remove commits will want to override, save and:
```
git push -f origin <branch>
```

the squash will be make a new line on timeline of git 
but the commits will be joinned

clone by token:
```
git clone https://<token>@github.com/<user>/<project>.git
```
exemple:
```
git clone https://<token>@github.com/mateusmed/proj.git
```

update project repository key
```
git remote set-url origin https://<token>@github.com/mateusmed/proj.git
```




