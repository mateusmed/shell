#!/bin/bash

#	automação de deploy do importador

echo "============================="
echo "importador"
echo "============================="
echo "----------------------------------"
echo "[0] - maquina prod - "
echo "[1] - maquina homolog - "
echo "----------------------------------"

verifyFile () {
   DIR=/home/mateus.santos/
   FILE=bbb

   if [ -e "$DIR$FILE" ] ; then
   echo "o arquivo bbb existe"
   mv "$DIR$FILE" "$DIR"ccc
   else
   echo "o arquivo bbb não existe"
   mv ccc "$DIR$FILE"
   fi
}

function getDate () {
   now="$(date +'%Y/%m/%d')"
   echo $now;
}

function homolog () {
   echo "parando projeto"
   sshpass -p 'senhaServidor' /usr/bin/ssh root@<ipServidor> sudo /etc/init.d/<nomeProjeto> stop

   echo "renomeando arquivo atual para old.data"
   sshpass -p 'senhaServidor' /usr/bin/ssh root@<ipServidor> mv /pathServidor/<nomeBuild>.jar /pathServidor/<nomeBuild>.jar.old.$(getDate)

   echo "copiando arquivo local para servidor"
   sshpass -p 'senhaServidor' scp -C /home/mateussantos/pathLocal/<nomeBuild>.jar root@<ipServidor>:/pathServidor/

   echo "startando projeto"
   sshpass -p 'senhaServidor' /usr/bin/ssh root@<ipServidor> sudo /etc/init.d/<nomeProjeto> start
   echo "Deploy do importador feito com sucesso"
}

function prod () {
   printf "%s" "digite o usuário: ";
   read $usuario;

   echo $(usuario);

}


printf "%s" "Selecione a maquina:";
read NUM

case $NUM in
	0) prod ;;
	1) homolog ;;
	*) printf "%s" "INVALID NUMBER!" ;;
esac


