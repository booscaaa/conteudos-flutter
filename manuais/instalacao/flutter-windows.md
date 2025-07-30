# Instalação do Flutter no Windows

## Pré-requisitos

- Windows 10 ou superior (64-bit)
- Pelo menos 1.64 GB de espaço livre em disco
- Git para Windows
- PowerShell 5.0 ou superior

## 1. Instalação do Git

1. Baixe o Git: https://git-scm.com/download/win
2. Instale com as configurações padrão
3. Reinicie o computador se necessário

## 2. Instalação do Flutter

### Opção 1: Download direto

1. Baixe o Flutter SDK: https://flutter.dev/docs/get-started/install/windows
2. Extraia o arquivo zip em `C:\src\flutter` (evite caminhos com espaços)
3. Adicione o Flutter ao PATH do sistema:
   - Abra **Configurações** > **Sistema** > **Sobre** > **Configurações avançadas do sistema**
   - Clique em **Variáveis de Ambiente**
   - Em **Variáveis do sistema**, encontre **Path** e clique em **Editar**
   - Clique em **Novo** e adicione: `C:\src\flutter\bin`
   - Clique **OK** em todas as janelas

### Opção 2: Usando Chocolatey

```powershell
choco install flutter
```

### Opção 3: Usando Scoop

```powershell
scoop install flutter
```

## 3. Verificação da instalação

Abra um novo **Command Prompt** ou **PowerShell** e execute:

```cmd
flutter doctor
```

## 4. Instalação do Android Studio

1. Baixe o Android Studio: https://developer.android.com/studio
2. Execute o instalador `.exe`
3. Siga o assistente de instalação
4. Na primeira execução, instale o Android SDK
5. Configure as variáveis de ambiente:
   - Adicione `ANDROID_HOME` apontando para: `C:\Users\%USERNAME%\AppData\Local\Android\Sdk`
   - Adicione ao PATH:
     - `%ANDROID_HOME%\platform-tools`
     - `%ANDROID_HOME%\tools`
     - `%ANDROID_HOME%\tools\bin`
     - `%ANDROID_HOME%\emulator`

### Plugins necessários no Android Studio

1. Abra Android Studio
2. Vá em **File** > **Settings** > **Plugins**
3. Instale os plugins:
   - Flutter
   - Dart

### Aceitar licenças Android

```cmd
flutter doctor --android-licenses
```

## 5. Configuração para desenvolvimento iOS (opcional)

**Nota:** Desenvolvimento iOS no Windows requer soluções alternativas como:
- Usar um Mac virtual
- Serviços em nuvem como Codemagic
- Desenvolvimento apenas para Android

## 6. Configuração do VS Code

### Instalação do VS Code

1. Baixe o VS Code: https://code.visualstudio.com/
2. Execute o instalador
3. Marque as opções:
   - ✓ Adicionar ao PATH
   - ✓ Registrar Code como editor para tipos de arquivo suportados

### Extensões necessárias

1. Abra o VS Code
2. Pressione `Ctrl+Shift+X` para abrir extensões
3. Instale as extensões:
   - **Flutter** (por Dart Code)
   - **Dart** (por Dart Code)
   - **Flutter Widget Snippets**
   - **Awesome Flutter Snippets**
   - **Flutter Tree**
   - **Error Lens** (opcional, mas útil)

### Configurações recomendadas

Pressione `Ctrl+Shift+P` e digite "Preferences: Open Settings (JSON)":

```json
{
  "dart.flutterSdkPath": "C:\\src\\flutter",
  "dart.checkForSdkUpdates": true,
  "dart.previewFlutterUiGuides": true,
  "dart.previewFlutterUiGuidesCustomTracking": true,
  "editor.formatOnSave": true,
  "editor.codeActionsOnSave": {
    "source.fixAll": true
  },
  "dart.debugExternalPackageLibraries": false,
  "dart.debugSdkLibraries": false
}
```

## 7. Configuração do Windows Defender

Adicione exclusões no Windows Defender para melhor performance:

1. Abra **Windows Security** > **Proteção contra vírus e ameaças**
2. Clique em **Gerenciar configurações** em "Configurações de proteção contra vírus e ameaças"
3. Clique em **Adicionar ou remover exclusões**
4. Adicione as seguintes pastas:
   - `C:\src\flutter`
   - `C:\Users\%USERNAME%\AppData\Local\Android\Sdk`
   - Pasta dos seus projetos Flutter

## 8. Criando seu primeiro projeto

```cmd
flutter create meu_primeiro_app
cd meu_primeiro_app
flutter run
```

## 9. Configuração de dispositivos

### Emulador Android

1. Abra Android Studio
2. Vá em **Tools** > **AVD Manager**
3. Clique em **Create Virtual Device**
4. Escolha um dispositivo e uma versão do Android
5. Finalize a criação

### Dispositivo físico Android

1. Ative as **Opções do desenvolvedor** no dispositivo
2. Ative a **Depuração USB**
3. Conecte via USB
4. Aceite a depuração no dispositivo

## 10. Verificação final

```cmd
flutter doctor
```

Todos os itens devem aparecer com ✓ (check verde).

## Comandos úteis

```cmd
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
```

## Solução de problemas comuns

### Erro "flutter não é reconhecido"
- Verifique se o PATH foi configurado corretamente
- Reinicie o Command Prompt/PowerShell
- Reinicie o computador se necessário

### Problemas com Android SDK
```cmd
flutter doctor --android-licenses
```

### Erro de permissões
- Execute o Command Prompt como Administrador
- Verifique as permissões das pastas

### Performance lenta
- Adicione exclusões no antivírus
- Use SSD se possível
- Feche programas desnecessários durante o desenvolvimento

### Problemas com proxy corporativo
```cmd
flutter config --enable-web
flutter config --android-sdk <caminho_do_sdk>
```

## Dicas de performance

- Use `flutter run --release` para builds de produção
- Use `flutter run --profile` para análise de performance
- Mantenha o hot reload ativo durante desenvolvimento
- Use `flutter build apk --split-per-abi` para APKs menores