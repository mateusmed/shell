

create path and subpath:

```
mkdir -p 1/2/3/a
mkdir -p 1/2/3/b
mkdir -p 10/20/30/a
mkdir -p 10/20/30/b
mkdir -p 100/200/300/a
mkdir -p 100/200/300/b
```

example:
```
 .
   |-1
   |---2
   |-----3
   |-------a
   |-------b
   |-10
   |---20
   |-----30
   |-------a
   |-------b
   |-100
   |---200
   |-----300
   |-------a
   |-------b
```

remove all subdirectory of

```
rm -rf `find . -type d -name a`
```

or if you dont need of type file:

```
rm -rf `find . -name a`
```

removed all a path from subdirectories:

```
.
   |-1
   |---2
   |-----3
   |-------b
   |-10
   |---20
   |-----30
   |-------b
   |-100
   |---200
   |-----300
   |-------b
```
