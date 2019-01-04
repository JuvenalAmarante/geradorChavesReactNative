#!/bin/bash

sudo apt-get install figlet

echo " "

echo "############ Gerando Chaves ############"

echo " "

sudo keytool -genkey -v -keystore my-release-key.keystore -alias my-key-alias -keyalg RSA -keysize 2048 -validity 10000

echo " "

echo "Digite a localização raiz do seu Projeto:"

echo " "

figlet -c RMXFOX
