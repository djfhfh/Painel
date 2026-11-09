#!/bin/bash
set -e
echo "A preparar ambiente de compilação..."
apt-get update && apt-get install -y openjdk-17-jdk wget unzip

# Descarregar Command Line Tools se necessário
if [ ! -d "cmdline-tools" ]; then
    wget -q https://dl.google.com/android/repository/commandlinetools-linux-9477386_latest.zip -O tools.zip
    unzip -q tools.zip
    mkdir -p cmdline-tools/latest
    mv bin lib source.properties NOTICE.txt cmdline-tools/latest/
    rm tools.zip
fi

export ANDROID_HOME=$PWD/android-sdk
mkdir -p $ANDROID_HOME
yes | cmdline-tools/latest/bin/sdkmanager --sdk_root=$ANDROID_HOME "platforms;android-34" "build-tools;34.0.0" > /dev/null

echo "A compilar o APK..."
cd app
# Criar compilação limpa via javac/d8 se gradle falhar, ou usar o gradlew se disponível
../gradlew assembleDebug --no-daemon || gradle assembleDebug --no-daemon
