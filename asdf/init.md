

rode o comando:
```
	git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.1
```

isso vai gerar uma pasta .asdf no user


Adicionar no PATH, por exemplo:

```
	export PATH=/bin:\
                /usr/bin:\
                /usr/local/bin:\
                /home/mmed/.asdf/bin:\
                /home/mmed/.asdf/shims:\
                /home/mmed/.asdf/completions/asdf.bash:\
```

adicionando o plugin do nodejs no asdf:

```
	asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
```

instalando a ultima versao:

```
	asdf install nodejs latest
```

adicionando a versao global:

```
	asdf global nodejs latest
```

ou escolha a versão:
```
	asdf global nodejs 23.1.0
```

agora vc já tem o nodejs:
```
	node -v
```

para adicionar uma versao global:
```
	asdf local nodes 16.5.0
```