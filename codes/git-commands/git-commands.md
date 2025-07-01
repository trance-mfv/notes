## List branches

### that contain the word "taxw" case-insensitive

```bash
git branch --no-merged | grep -i taxw
```

### Delete all branches that contain the word "taxw" case-insensitive

```bash
git branch --no-merged | grep -i taxw | xargs git branch -D 
```

### Delete all branches that are not merged into develop, master and milestones/\*

```bash
git branch --no-merged develop --no-merged master --no-merged milestones/* | grep -i taxw | xargs git branch -D 
```

### Show graph of commits from develop to the current branch

```bash
git log --oneline --graph --decorate --first-parent origin/develop..origin/TAXW-1426-change-beneficiary-to-mandatory-field
```
