# Gerador de Chaves React Native

Esse passo a passo permite que você crie chaves para gerar APKs com React Native.

## Passo 01

Entre dentro do diretório *android/app/* do seu seu projeto

## Passo 02

Abra o terminal e, com permissão de super usuário, execute o seguinte comando:

```bash
keytool -genkey -v -keystore release-key.keystore -alias my-key-alias -keyalg RSA -keysize 2048 -validity 10000
```

## Passo 03

Adicione as informações que forem requisitadas.(Se desejadas)

## Passo 04

Logo após, será criado um arquivo que será a chave que vai registrar o seu APK dentro do diretório. Verifique se o mesmo aparece com o nome *release-key.keystore*

## Passo 05

Logo em seguida, adicione essas linhas no final do arquivo *android/gradle.properties* do seu app:

```groovy
MYAPP_RELEASE_STORE_FILE=release-key.keystore
MYAPP_RELEASE_KEY_ALIAS=my-key-alias
MYAPP_RELEASE_STORE_PASSWORD=*Sua_senha*
MYAPP_RELEASE_KEY_PASSWORD=*Sua_senha*
```

## Passo 06

Logo após, adicione essas linhas dentro de *android/app/build.grade*:

```groovy
...

android {
    ...
    defaultConfig { ... }
    signingConfigs {
        ...
        release {                                                     // }
            if (project.hasProperty('MYAPP_RELEASE_STORE_FILE')) {    // }
                storeFile file(MYAPP_RELEASE_STORE_FILE)              // }  Essas Linhas
                storePassword MYAPP_RELEASE_STORE_PASSWORD            // }
                keyAlias MYAPP_RELEASE_KEY_ALIAS                      // }
                keyPassword MYAPP_RELEASE_KEY_PASSWORD                // }
            }                                                         // }
        }                                                             // }
    }                                                                 
    buildTypes {
        release {
            ...
            signingConfig signingConfigs.release                      //  Essa linha
        }
    }
}

...
 
```

## Passo 07

Vá para o diretório *android/* do seu projeto e execute o comando:

```sh
./gradlew assembleRelease
```

Depois disso é só voltar para o diretório raíz do seu projeto e executar:

```sh
react-native run-android --variant=release
```
