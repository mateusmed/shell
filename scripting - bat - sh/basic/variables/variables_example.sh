#!/bin/bash

# example of execution:
# ./variables_example.sh my name is mateus

var1=$1
var2=$2
var3=$3
var4=$4

external_variable () {
  echo $var1
  echo $var2
  echo $var3
  echo $var4
}


atribuition_example () {
  MY_MESSAGE="Hello World"
  echo $MY_MESSAGE
}

receive_params_method_example (){
  echo "I was called with $# parameters"
  echo "My name is $0"
  echo "My first parameter is $1"
  echo "My second parameter is $2"
  echo "All parameters are $@" #todos os parametros de uma só vez
}

main(){
  atribuition_example
  receive_params_method_example "param0" "param1" "param2"
  external_variable
}

