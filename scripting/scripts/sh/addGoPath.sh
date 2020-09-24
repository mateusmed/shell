#!/bin/bash

echo "digite o caminho do folder bin nos seus arquivos GO:";
read binGo

echo "digite o caminho do folder raiz do GO:";
read raiz

echo "digite o caminho do seu workspace GO:";
read workspace

#==================================================================

path=${PATH}
goPath=${GOPATH}

finalPath=${PATH}':'${binGo}

arquivo=/etc/bash.bashrc

str="$path"
str="$path"

if grep -q "export PATH=" "$arquivo"; then

	echo "não existe um path em seu bashrc"
	echo "criando path..."
	echo "===================== CREATE PATH =================="

	createPath="export PATH="${str}':'${binGo}
	var1="$createPath"
	newPathVar=${var1//['/']/'\/'}

	sudo sed -i '1 i\'"export PATH=$newPathVar" arquivo

	echo "SUCESS"
	echo "===================================================="

else
	echo "já existe um path em seu bashrc"
	echo "concatenando o caminho bin do Go"
	echo "===================== CONCAT PATH  ======================="

	currentyPath=${str//['/']/'\/'}

	strFinalPath="$finalPath"

	newPathConcat=${strFinalPath//['/']/'\/'}

	var='/'${currentyPath}'/c\'${newPathConcat}
	sudo sed -i $var arquivo

	echo "SUCESS"
	echo "========================================================"

fi


if grep -q "export GOPATH=" "$arquivo"; then

	echo "não existe um GoPath em seu bashrc"
	echo "criando GoPath..."
	echo "===================== CREATE GOPATH ===================="

	goPath="export GOPATH="${raiz}':'${workspace}
	var2="$goPath"
	newGoPath=${var2//['/']/'\/'}

	sudo sed -i '1 i\'"$newGoPath" /etc/bash.bashrc

	echo "========================================================"

else
	echo "já existe um GoPath em seu bashrc"
	echo "concatenando o workspace do Go"
	echo "=====================  CONCAT GOPATH ======================="
	currentyPath=${str//['/']/'\/'}

	strFinalPath="$finalPath"

	newPathConcat=${strFinalPath//['/']/'\/'}
	var='/'${currentyPath}'/c\'${newPathConcat}

	sudo sed -i $var arquivo
	echo "========================================================"
fi


echo "========================================================"

echo "===================  format path + binGo  ====================="
#REPLACE '/' MUITO IMPORTANTE
str="$finalPath"

echo "já existe um path em seu bashrc"
newPath=${str//['/']/'\/'}
echo $newPath

echo "========================================================"

var='/'${currentyPath}'/c\'${newPath}
#sudo sed -i $var /etc/bash.bashrc


#raiz e o workspace
goPath="export GOPATH="${raiz}':'${workspace}
str="$goPath"
newGoPath=${str//['/']/'\/'}
echo $newGoPath

sudo sed -i '1 i\'"$newGoPath" /etc/bash.bashrc
