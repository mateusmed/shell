

Deno can run typescript natively

for wsl you need to install unzip:
```
sudo apt-get install unzip -y
```

Tutorial:
```
https://deno.land/manual/getting_started/installation
```

Install:
```
curl -fsSL https://deno.land/x/install/install.sh | sh
```

add on your .bashrc or .zshrc
```
export DENO_INSTALL="/home/mateusmed/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
```