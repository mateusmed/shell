

Deno can run typescript natively

for WSL you need to install unzip:
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

```
deno run --unstable --allow-read --allow-net index.ts
```

Video of simple project:
```
https://www.youtube.com/watch?v=cvF9fdWYy-4&ab_channel=Cod3rCursos
```