#!/bin/bash

sudo apt-get install figlet

echo " "

echo "############ Gerando Chaves ############"

echo " "

sudo keytool -genkey -v -keystore my-release-key.keystore -alias my-key-alias -keyalg RSA -keysize 2048 -validity 10000

echo " "

echo "Digite a localização raiz do seu Projeto:"

echo " "

read locale

sudo mv my-realease-key.keystore $locale/android/app

echo " "

echo "Tutorial"

echo " "

echo "##### Passo 01 #####"

echo " "

echo "Adicione essa linhas no seu android/gradle.properties:"

echo " "

echo "MYAPP_RELEASE_STORE_FILE=my-release-key.keystore"

echo "MYAPP_RELEASE_KEY_ALIAS=my-key-alias"

echo "MYAPP_RELEASE_STORE_PASSWORD=Sua senha"

echo "MYAPP_RELEASE_KEY_PASSWORD=Sua senha"

echo " "

echo "##### Passo 02 #####"

echo " "

echo "Modifique o arquivo android/app/build.grade:"

echo " "

echo "..."
echo "android {"
echo "    ..."
echo "    defaultConfig { ... }"
echo "    *signingConfigs {"
echo "        release {"
echo "            if (project.hasProperty('MYAPP_RELEASE_STORE_FILE')) {"
echo "                storeFile file(MYAPP_RELEASE_STORE_FILE)"
echo "                storePassword MYAPP_RELEASE_STORE_PASSWORD"
echo "                keyAlias MYAPP_RELEASE_KEY_ALIAS"
echo "                keyPassword MYAPP_RELEASE_KEY_PASSWORD"
echo "            }"
echo "        }"
echo "    }*"
echo "    buildTypes {"
echo "        release {"
echo "            ..."
echo "            *signingConfig signingConfigs.release*"
echo "        }"
echo "    }"
echo "}"
echo "..."

echo " "

echo "Execute logo depois:"

echo " "

echo "cd $locale/android"

echo " "

echo "./gradlew assembleRelease"

echo " "

echo "Desenvolvido por:"

figlet -c RMXFOX
