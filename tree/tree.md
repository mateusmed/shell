

show tree:
```
tree -d /proc/self/
```

is another way, with out install tree:
```
ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'
```

tree de pastas com profundidade
```
alias tree='function _tree() { find . -mindepth 1 -maxdepth "$1" -type d -print | sed -e "s/[^-][^\/]*\//--/g" -e "s/^/   /" -e "s/-/|/"; }; _tree'
```
uso:
```
tree 3
```


---

```
tree -I node_modules
```