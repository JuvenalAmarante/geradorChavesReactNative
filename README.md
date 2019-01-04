# Gerador de Chaves React Native

Esse executável permite que você crie chaves para gerar APKs com React Native.

> Por enquanto somente para Linux ;)

## Passo 01

Clone o projeto para sua máquina dentro de um diretório de sua preferência.

## Passo 02

Abra o terminal e execute o seguinte comando:

```bash
sudo chmod +x "Gerador de chaves React.sh"
```

## Passo 03

Execute o arquivo:
```sh
./"Gerador de chaves React.sh"
```

## Passo 04

Adicione as informações que forem requisitadas.

> Se preferir você pode deixar as informações requisitadas em branco e ir apertando o ENTER.

## Passo 05

Será criada no seu diretório atual um arquivo que será a chave que vai registrar o seu APK. Mova esse arquivo para o diretório *android/app* do seu aplicativo.

## Passo 06

Logo em seguida, adicione essas linhas dentro do *android/gradle.properties* do seu app:

```groovy
MYAPP_RELEASE_STORE_FILE=my-release-key.keystore
MYAPP_RELEASE_KEY_ALIAS=my-key-alias
MYAPP_RELEASE_STORE_PASSWORD=*Sua senha*
MYAPP_RELEASE_KEY_PASSWORD=*Sua senha*
```

## Passo 07

Logo após, adicione essas linhas dentro de *android/app/build.grade*:

```groovy
...

android {
    ...
    defaultConfig { ... }
    signingConfigs {                                                  // }
        release {                                                     // }
            if (project.hasProperty('MYAPP_RELEASE_STORE_FILE')) {    // }
                storeFile file(MYAPP_RELEASE_STORE_FILE)              // }  Essas Linhas
                storePassword MYAPP_RELEASE_STORE_PASSWORD            // }
                keyAlias MYAPP_RELEASE_KEY_ALIAS                      // }
                keyPassword MYAPP_RELEASE_KEY_PASSWORD                // }
            }                                                         // }
        }                                                             // }
    }                                                                 // }
    buildTypes {
        release {
            ...
            signingConfig signingConfigs.release                      //  Essa linha
        }
    }
}

...
 
```

## Passo 08

Vá para o diretório android e execute o comando:

```sh
./gradlew assembleRelease
```

Depois disso é só executar 

```sh
react-native run-android --variant=release
```