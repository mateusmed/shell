

show tree:
```
tree -d /proc/self/
```

is another way, with out install tree:
```
ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'
```
