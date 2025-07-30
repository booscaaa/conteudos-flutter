# Instalação do Flutter no Linux

## Pré-requisitos

- Linux (64-bit)
- Pelo menos 2.8 GB de espaço livre em disco
- Git
- curl
- unzip
- xz-utils
- zip
- libglu1-mesa

## 1. Instalação das dependências

### Ubuntu/Debian

```bash
sudo apt update
sudo apt install curl git unzip xz-utils zip libglu1-mesa
```

### Fedora/CentOS/RHEL

```bash
sudo dnf install curl git unzip xz zip mesa-libGLU
```

### Arch Linux

```bash
sudo pacman -S curl git unzip xz zip glu
```

## 2. Instalação do Flutter

### Opção 1: Download direto

1. Baixe o Flutter SDK:

```bash
cd ~/development
wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.16.0-stable.tar.xz
```

2. Extraia o arquivo:

```bash
tar xf flutter_linux_3.16.0-stable.tar.xz
```

3. Adicione o Flutter ao PATH:

```bash
export PATH="$PATH:`pwd`/flutter/bin"
```

### Opção 2: Usando Snap

```bash
sudo snap install flutter --classic
```

### Opção 3: Clonando do Git

```bash
git clone https://github.com/flutter/flutter.git -b stable
export PATH="$PATH:`pwd`/flutter/bin"
```

### Configuração permanente do PATH

Adicione ao arquivo `~/.bashrc`, `~/.zshrc` ou `~/.profile`:

```bash
export PATH="$PATH:/home/$USER/development/flutter/bin"
```

Recarregue o terminal:

```bash
source ~/.bashrc
# ou
source ~/.zshrc
```

## 3. Verificação da instalação

```bash
flutter doctor
```

## 4. Instalação do Android Studio

### Opção 1: Download direto

1. Baixe o Android Studio: https://developer.android.com/studio
2. Extraia o arquivo:

```bash
sudo tar -xzf android-studio-*-linux.tar.gz -C /opt/
```

3. Crie um link simbólico:

```bash
sudo ln -sf /opt/android-studio/bin/studio.sh /usr/local/bin/android-studio
```

4. Execute o Android Studio:

```bash
android-studio
```

### Opção 2: Usando Snap

```bash
sudo snap install android-studio --classic
```

### Opção 3: Usando Flatpak

```bash
flatpak install flathub com.google.AndroidStudio
```

### Configuração do Android SDK

1. Abra o Android Studio
2. Siga o assistente de configuração
3. Instale o Android SDK
4. Configure as variáveis de ambiente:

```bash
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
```

Adicione essas linhas ao seu `~/.bashrc` ou `~/.zshrc`.

### Plugins necessários no Android Studio

1. Abra Android Studio
2. Vá em **File** > **Settings** > **Plugins**
3. Instale os plugins:
   - Flutter
   - Dart

### Aceitar licenças Android

```bash
flutter doctor --android-licenses
```

## 5. Configuração adicional para desenvolvimento web

```bash
flutter config --enable-web
```

Instale o Chrome (necessário para desenvolvimento web):

### Ubuntu/Debian

```bash
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list
sudo apt update
sudo apt install google-chrome-stable
```

### Fedora

```bash
sudo dnf install google-chrome-stable
```

## 6. Configuração do VS Code

### Instalação do VS Code

#### Ubuntu/Debian

```bash
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | sudo tee /etc/apt/sources.list.d/vscode.list
sudo apt update
sudo apt install code
```

#### Fedora

```bash
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf check-update
sudo dnf install code
```

#### Snap

```bash
sudo snap install code --classic
```

### Extensões necessárias

1. Abra o VS Code
2. Pressione `Ctrl+Shift+X` para abrir extensões
3. Instale as extensões:
   - **Flutter** (por Dart Code)
   - **Dart** (por Dart Code)
   - **Flutter Widget Snippets**
   - **Awesome Flutter Snippets**
   - **Flutter Tree**
   - **Error Lens** (opcional)
   - **GitLens** (opcional)

### Configurações recomendadas

Pressione `Ctrl+Shift+P` e digite "Preferences: Open Settings (JSON)":

```json
{
  "dart.flutterSdkPath": "/home/$USER/development/flutter",
  "dart.checkForSdkUpdates": true,
  "dart.previewFlutterUiGuides": true,
  "dart.previewFlutterUiGuidesCustomTracking": true,
  "editor.formatOnSave": true,
  "editor.codeActionsOnSave": {
    "source.fixAll": true
  },
  "dart.debugExternalPackageLibraries": false,
  "dart.debugSdkLibraries": false,
  "dart.hotReloadOnSave": "always"
}
```

## 7. Configuração de dispositivos

### Emulador Android

1. Abra Android Studio
2. Vá em **Tools** > **AVD Manager**
3. Clique em **Create Virtual Device**
4. Escolha um dispositivo e versão do Android
5. Finalize a criação

### Dispositivo físico Android

1. Ative as **Opções do desenvolvedor** no dispositivo
2. Ative a **Depuração USB**
3. Instale as regras udev:

```bash
sudo apt install android-tools-adb
```

4. Adicione regras udev para dispositivos Android:

```bash
sudo nano /etc/udev/rules.d/51-android.rules
```

Adicione (substitua XXXX pelo vendor ID do seu dispositivo):

```
SUBSYSTEM=="usb", ATTR{idVendor}=="XXXX", MODE="0666", GROUP="plugdev"
```

5. Recarregue as regras:

```bash
sudo udevadm control --reload-rules
sudo udevadm trigger
```

6. Adicione seu usuário ao grupo plugdev:

```bash
sudo usermod -a -G plugdev $USER
```

## 8. Criando seu primeiro projeto

```bash
flutter create meu_primeiro_app
cd meu_primeiro_app
flutter run
```

## 9. Verificação final

```bash
flutter doctor
```

Todos os itens devem aparecer com ✓ (check verde).

## Comandos úteis

```bash
# Verificar dispositivos conectados
flutter devices

# Atualizar Flutter
flutter upgrade

# Limpar cache do projeto
flutter clean

# Verificar versão
flutter --version

# Listar emuladores
flutter emulators

# Executar em dispositivo específico
flutter run -d <device_id>

# Executar no Chrome
flutter run -d chrome

# Build para web
flutter build web

# Build APK
flutter build apk
```

## Solução de problemas comuns

### Problemas de permissão com dispositivos Android

```bash
# Verificar se o dispositivo é reconhecido
adb devices

# Reiniciar servidor ADB
adb kill-server
adb start-server
```

### Erro "Unable to locate Android SDK"

```bash
flutter config --android-sdk /home/$USER/Android/Sdk
```

### Problemas com licenças Android

```bash
flutter doctor --android-licenses
```

### Erro de dependências

```bash
# Ubuntu/Debian
sudo apt install libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386

# Para sistemas de 64-bit que precisam de libs de 32-bit
sudo dpkg --add-architecture i386
sudo apt update
```

### Problemas com KVM (para emulador Android)

```bash
# Verificar suporte a KVM
egrep -c '(vmx|svm)' /proc/cpuinfo

# Instalar KVM
sudo apt install qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils

# Adicionar usuário ao grupo KVM
sudo adduser $USER kvm
```

## Otimizações de performance

### Configurar swap (se necessário)

```bash
# Verificar swap atual
free -h

# Criar arquivo de swap de 2GB
sudo fallocate -l 2G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
```

### Configurar Git (se ainda não configurado)

```bash
git config --global user.name "Seu Nome"
git config --global user.email "seu.email@exemplo.com"
```

## Dicas adicionais

- Use `flutter run --release` para builds de produção
- Use `flutter run --profile` para análise de performance
- Mantenha o hot reload ativo durante desenvolvimento
- Use `flutter build apk --split-per-abi` para APKs menores
- Configure aliases úteis no seu shell:

```bash
# Adicione ao ~/.bashrc ou ~/.zshrc
alias frun='flutter run'
alias fbuild='flutter build'
alias fclean='flutter clean'
alias fdoctor='flutter doctor'
```