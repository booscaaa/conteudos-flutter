# Comandos Úteis do Flutter CLI

Guia completo dos comandos mais utilizados no desenvolvimento Flutter.

## 📱 Comandos de Dispositivos

### Listar dispositivos conectados

```bash
flutter devices
```

### Listar emuladores disponíveis

```bash
flutter emulators
```

### Executar emulador específico

```bash
flutter emulators --launch <emulator_id>
```

### Executar app em dispositivo específico

```bash
flutter run -d <device_id>
```

### Executar no Chrome (desenvolvimento web)

```bash
flutter run -d chrome
```

## 🚀 Comandos de Execução

### Executar app em modo debug

```bash
flutter run
```

### Executar app em modo release

```bash
flutter run --release
```

### Executar app em modo profile (para análise de performance)

```bash
flutter run --profile
```

### Executar com hot reload automático

```bash
flutter run --hot
```

### Executar sem som (modo silencioso)

```bash
flutter run --no-sound-null-safety
```

## 🏗️ Comandos de Build

### Build APK (Android)

```bash
flutter build apk
```

### Build APK dividido por arquitetura (menor tamanho)

```bash
flutter build apk --split-per-abi
```

### Build App Bundle (Android - recomendado para Play Store)

```bash
flutter build appbundle
```

### Build para iOS

```bash
flutter build ios
```

### Build para Web

```bash
flutter build web
```

### Build para Windows

```bash
flutter build windows
```

### Build para macOS

```bash
flutter build macos
```

### Build para Linux

```bash
flutter build linux
```

## 🧹 Comandos de Limpeza

### Limpar cache do projeto

```bash
flutter clean
```

### Limpar e reinstalar dependências

```bash
flutter clean && flutter pub get
```

### Limpar cache global do Flutter

```bash
flutter clean --cache
```

## 📦 Comandos de Dependências

### Instalar dependências

```bash
flutter pub get
```

### Atualizar dependências

```bash
flutter pub upgrade
```

### Adicionar nova dependência

```bash
flutter pub add <package_name>
```

### Adicionar dependência de desenvolvimento

```bash
flutter pub add --dev <package_name>
```

### Remover dependência

```bash
flutter pub remove <package_name>
```

### Verificar dependências desatualizadas

```bash
flutter pub outdated
```

### Analisar dependências

```bash
flutter pub deps
```

## 🔧 Comandos de Projeto

### Criar novo projeto

```bash
flutter create <project_name>
```

### Criar projeto com template específico

```bash
flutter create --template=app <project_name>
flutter create --template=package <package_name>
flutter create --template=plugin <plugin_name>
```

### Criar projeto com organização específica

```bash
flutter create --org com.exemplo <project_name>
```

### Criar projeto para plataformas específicas

```bash
flutter create --platforms=android,ios <project_name>
```

## 🧪 Comandos de Teste

### Executar todos os testes

```bash
flutter test
```

### Executar teste específico

```bash
flutter test test/widget_test.dart
```

### Executar testes com coverage

```bash
flutter test --coverage
```

### Executar testes de integração

```bash
flutter drive --target=test_driver/app.dart
```

## 📊 Comandos de Análise

### Analisar código

```bash
flutter analyze
```

### Formatar código

```bash
flutter format .
```

### Verificar saúde do projeto

```bash
flutter doctor
```

### Verificar saúde com detalhes verbosos

```bash
flutter doctor -v
```

### Aceitar licenças Android

```bash
flutter doctor --android-licenses
```

## 🔄 Comandos de Atualização

### Atualizar Flutter

```bash
flutter upgrade
```

### Verificar versão do Flutter

```bash
flutter --version
```

### Mudar canal do Flutter

```bash
flutter channel stable
flutter channel beta
flutter channel dev
flutter channel master
```

### Listar canais disponíveis

```bash
flutter channel
```

## ⚙️ Comandos de Configuração

### Habilitar desenvolvimento web

```bash
flutter config --enable-web
```

### Habilitar desenvolvimento desktop

```bash
flutter config --enable-windows-desktop
flutter config --enable-macos-desktop
flutter config --enable-linux-desktop
```

### Configurar Android SDK

```bash
flutter config --android-sdk /caminho/para/android-sdk
```

### Ver todas as configurações

```bash
flutter config
```

## 🔍 Comandos de Debug

### Executar com logs detalhados

```bash
flutter run -v
```

### Executar com debug de performance

```bash
flutter run --enable-software-rendering
```

### Capturar logs do dispositivo

```bash
flutter logs
```

### Executar com inspector

```bash
flutter run --dart-define=flutter.inspector.structuredErrors=true
```

## 📱 Comandos Específicos de Plataforma

### Android

```bash
# Instalar APK em dispositivo conectado
flutter install

# Executar apenas no Android
flutter run --target-platform android

# Build com flavor específico
flutter build apk --flavor production
```

### iOS

```bash
# Executar apenas no iOS
flutter run --target-platform ios

# Build com configuração específica
flutter build ios --release --no-codesign
```

### Web

```bash
# Executar com renderer específico
flutter run -d chrome --web-renderer html
flutter run -d chrome --web-renderer canvaskit

# Build com renderer específico
flutter build web --web-renderer canvaskit
```

## 🛠️ Comandos Avançados

### Gerar código (build_runner)

```bash
flutter packages pub run build_runner build
```

### Gerar código com watch

```bash
flutter packages pub run build_runner watch
```

### Executar script personalizado

```bash
flutter pub run <script_name>
```

### Precache de artefatos

```bash
flutter precache
```

### Baixar artefatos para plataforma específica

```bash
flutter precache --android
flutter precache --ios
flutter precache --web
```

## 🔧 Comandos de Solução de Problemas

### Resetar configurações do Flutter

```bash
flutter config --clear-features
```

### Limpar cache de downloads

```bash
flutter clean --cache
```

### Reinstalar Flutter (após problemas)

```bash
flutter doctor --android-licenses
flutter precache --force
```

### Verificar conectividade de rede

```bash
flutter doctor --network-check
```

## 📋 Comandos Úteis Combinados

### Limpeza completa e rebuild

```bash
flutter clean && flutter pub get && flutter run
```

### Atualização completa

```bash
flutter upgrade && flutter pub upgrade && flutter clean && flutter pub get
```

### Build de produção completo (Android)

```bash
flutter clean && flutter pub get && flutter build appbundle --release
```

### Debug com logs completos

```bash
flutter run -v --enable-software-rendering
```

## 🎯 Dicas de Uso

### Aliases úteis para o terminal

Adicione ao seu `~/.zshrc` ou `~/.bashrc`:

```bash
alias frun='flutter run'
alias fbuild='flutter build'
alias fclean='flutter clean'
alias fdoctor='flutter doctor'
alias fget='flutter pub get'
alias fupgrade='flutter pub upgrade'
alias ftest='flutter test'
alias fanalyze='flutter analyze'
alias fformat='flutter format .'
```

### Comandos com parâmetros úteis

```bash
# Executar com target específico
flutter run --target lib/main_dev.dart

# Executar com dart defines
flutter run --dart-define=API_URL=https://api.exemplo.com

# Build com obfuscação
flutter build apk --obfuscate --split-debug-info=debug-info/

# Executar testes específicos
flutter test --name="test específico"
```

### Comandos para CI/CD

```bash
# Verificação completa para CI
flutter doctor --android-licenses
flutter analyze
flutter test
flutter build apk --release

# Build para múltiplas plataformas
flutter build apk --release
flutter build appbundle --release
flutter build web --release
```

---

**Nota:** Alguns comandos podem variar dependendo da versão do Flutter e das plataformas habilitadas. Use `flutter help` para ver todos os comandos disponíveis ou `flutter help <comando>` para ajuda específica.
