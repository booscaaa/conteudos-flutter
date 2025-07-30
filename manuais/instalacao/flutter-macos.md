# Instalação do Flutter no macOS

## Pré-requisitos

- macOS 10.14 (Mojave) ou superior
- Pelo menos 2.8 GB de espaço livre em disco
- Git instalado

## 1. Instalação do Flutter

### Opção 1: Download direto

1. Baixe o Flutter SDK do site oficial: https://flutter.dev/docs/get-started/install/macos
2. Extraia o arquivo zip em um local desejado (ex: `~/development/`)
3. Adicione o Flutter ao PATH:

```bash
export PATH="$PATH:`pwd`/flutter/bin"
```

### Opção 2: Usando Homebrew

```bash
brew install flutter
```

### Configuração do PATH permanente

Adicione ao seu arquivo `~/.zshrc` ou `~/.bash_profile`:

```bash
export PATH="$PATH:/caminho/para/flutter/bin"
```

Recarregue o terminal:

```bash
source ~/.zshrc
```

## 2. Verificação da instalação

```bash
flutter doctor
```

## 3. Instalação do Android Studio

1. Baixe o Android Studio: https://developer.android.com/studio
2. Instale o arquivo `.dmg` baixado
3. Abra o Android Studio e siga o assistente de configuração
4. Instale o Android SDK através do SDK Manager
5. Configure as variáveis de ambiente:

```bash
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
```

### Plugins necessários no Android Studio

1. Abra Android Studio
2. Vá em **Preferences** > **Plugins**
3. Instale os plugins:
   - Flutter
   - Dart

## 4. Instalação do Xcode

1. Instale o Xcode pela App Store
2. Aceite a licença do Xcode:

```bash
sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
sudo xcodebuild -runFirstLaunch
```

3. Instale o simulador iOS:

```bash
open -a Simulator
```

## 5. Configuração do VS Code

### Instalação do VS Code

1. Baixe o VS Code: https://code.visualstudio.com/
2. Instale o arquivo baixado

### Extensões necessárias

1. Abra o VS Code
2. Vá na aba de extensões (Ctrl+Shift+X)
3. Instale as extensões:
   - **Flutter** (por Dart Code)
   - **Dart** (por Dart Code)
   - **Flutter Widget Snippets**
   - **Awesome Flutter Snippets**
   - **Flutter Tree**

### Configurações recomendadas

Adicione ao `settings.json` do VS Code:

```json
{
  "dart.flutterSdkPath": "/caminho/para/flutter",
  "dart.checkForSdkUpdates": true,
  "dart.previewFlutterUiGuides": true,
  "dart.previewFlutterUiGuidesCustomTracking": true,
  "editor.formatOnSave": true,
  "editor.codeActionsOnSave": {
    "source.fixAll": true
  }
}
```

## 6. Criando seu primeiro projeto

```bash
flutter create meu_primeiro_app
cd meu_primeiro_app
flutter run
```

## 7. Verificação final

Execute novamente para verificar se tudo está configurado:

```bash
flutter doctor
```

Todos os itens devem aparecer com ✓ (check verde).

## Dicas adicionais

- Use `flutter upgrade` para atualizar o Flutter
- Use `flutter clean` para limpar o cache do projeto
- Configure um dispositivo físico ou use simuladores para testar
- Mantenha o Android Studio e Xcode sempre atualizados

## Solução de problemas comuns

### Erro de licenças Android
```bash
flutter doctor --android-licenses
```

### Problemas com CocoaPods
```bash
sudo gem install cocoapods
pod setup
```

### Atualizar Flutter
```bash
flutter upgrade
```