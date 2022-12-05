
Install:
```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
```

List all versions:
```
nvm list-remote
```

Exemple of install:
```
nvm install v13.6.0
```

Example of use:
```
nvm use v13.6.0
```

list versions locally:
```
nvm ls
```

check version:
```
node -v
```

set default version:
```
nvm alias default 6.9.2
```

limit memory
```
node --max-old-space-size=350 $(which npm) install
```


uninstall
```
nvm deactivate
nvm uninstall 8.8.1
``` 
