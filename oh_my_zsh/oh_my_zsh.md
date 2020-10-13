
#### To install oh_my_zsh:
```
apt install zsh
```

```
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

#### Add this config on .zshrc to get nvm of user - attention, add your user name
```
export NVM_DIR="/home/<USER>/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
```

#### configure plugins
```
plugins=(git
         aws
         docker
         zsh-autosuggestions)
```


