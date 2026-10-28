# Tradutor de Palavras

Aplicativo Flutter para consultar traduções de palavras em português, inglês e
francês. O usuário pode navegar pela lista de palavras, visualizar a palavra
atual e mostrar ou ocultar suas traduções.

Atualmente, as palavras ficam cadastradas localmente no código-fonte, sem
necessidade de internet, banco de dados ou API externa.

## Funcionalidades

- Exibe uma lista de palavras em português.
- Mostra as traduções correspondentes em inglês e francês.
- Permite avançar e voltar entre as palavras.
- Permite mostrar ou esconder as traduções.
- Exibe a posição da palavra atual na lista.
- Possui interface com tema escuro e Material 3.

## Pré-requisitos

Antes de executar o projeto, instale:

1. **Flutter SDK** compatível com Dart 3.0 ou superior.
2. **Git**, para obter o projeto caso ele ainda não esteja no computador.
3. Um dispositivo ou emulador configurado:
   - Android Emulator ou dispositivo Android com depuração USB;
   - Chrome, para executar na web;
   - outro destino suportado pelo Flutter.
4. Para execução Android, o **Android Studio**, o Android SDK e as
   ferramentas de plataforma correspondentes.

Verifique a instalação com:

```bash
flutter --version
flutter doctor
```

Corrija os itens indicados pelo `flutter doctor` antes de continuar.

## Como executar

### 1. Obter e abrir o projeto

No terminal, entre na pasta do projeto:

```bash
cd caminho/para/Tradutor-Palavras
```

No Windows, por exemplo:

```powershell
cd C:\Users\user\Desktop\Tradutor-Palavras
```

### 2. Instalar as dependências

O arquivo `pubspec.yaml` descreve as dependências do aplicativo. Instale-as
com:

```bash
flutter pub get
```

### 3. Conferir os dispositivos disponíveis

```bash
flutter devices
```

Se nenhum dispositivo aparecer, inicie um emulador, conecte um dispositivo
físico ou habilite o Chrome como destino.

### 4. Executar o aplicativo

Para executar no dispositivo padrão:

```bash
flutter run
```

Para escolher um destino específico:

```bash
flutter run -d chrome
```

Também é possível iniciar o projeto pelo botão **Run/Debug** do VS Code,
depois de selecionar um dispositivo Flutter.

## Testes e análise

Execute a análise estática:

```bash
flutter analyze
```

Execute os testes disponíveis:

```bash
flutter test
```

## Arquivos necessários para executar

Os arquivos e pastas principais necessários para o funcionamento do projeto
são:

- `pubspec.yaml`: identifica o projeto e define dependências, versão do Dart
  e configurações do Flutter.
- `pubspec.lock`: registra as versões resolvidas das dependências.
- `lib/main.dart`: contém a inicialização do aplicativo e a tela principal.
- `lib/word.dart`: contém o modelo `Word` e a lista local de palavras.
- `analysis_options.yaml`: configura as regras de análise e lint do Dart.
- `android/`: contém a configuração nativa necessária para gerar e executar
  o aplicativo Android.
- `web/`: contém os arquivos necessários para executar o aplicativo no
  navegador.

O Flutter cria automaticamente pastas e arquivos temporários, como `build/`
e `.dart_tool/`, durante a execução. Eles não precisam ser editados nem
enviados manualmente para rodar o projeto.

## Estrutura de pastas

```text
Tradutor-Palavras/
├── android/
│   ├── app/
│   │   ├── src/
│   │   │   ├── debug/
│   │   │   ├── main/
│   │   │   └── profile/
│   │   │   └── build.gradle.kts
│   │   ├── build.gradle.kts
│   │   └── ...
│   ├── build.gradle.kts
│   ├── gradle/
│   │   └── wrapper/
│   ├── gradle.properties
│   └── settings.gradle.kts
├── GCS/
│   └── Plano_Ger_Conf_DevOps_Rafael_Da_Rocha_Da_Silva.docx
├── lib/
│   ├── main.dart
│   └── word.dart
├── web/
│   ├── index.html
│   ├── manifest.json
│   ├── favicon.png
│   └── icons/
├── .gitignore
├── analysis_options.yaml
├── pubspec.lock
├── pubspec.yaml
└── README.md
```

### Descrição das pastas principais

- **`lib/`**: código Dart e Flutter do aplicativo.
- **`lib/main.dart`**: ponto de entrada, tema, tela e controles de navegação.
- **`lib/word.dart`**: estrutura dos dados e palavras cadastradas.
- **`android/`**: projeto Android gerado e configurações nativas.
- **`web/`**: arquivos de suporte à versão web.
- **`GCS/`**: documentos auxiliares do projeto. O arquivo `.docx` pode ser
  aberto normalmente em um editor compatível, como Microsoft Word ou
  LibreOffice Writer; ele não é usado pelo aplicativo durante a execução.
- **`build/`** e **`.dart_tool/`**: artefatos gerados automaticamente e
  ignorados pelo Git.

## Adicionando novas palavras

Edite a lista `wordsList` no arquivo `lib/word.dart` e adicione outro objeto
`Word` com os campos em português, inglês e francês. Por exemplo:

```dart
Word(
  portuguese: 'Escola',
  english: 'School',
  french: 'École',
),
```

Depois, salve o arquivo e execute novamente o aplicativo, se necessário.

## Gerar uma versão Android

Para gerar um APK de release:

```bash
flutter build apk --release
```

O arquivo gerado ficará dentro de `build/app/outputs/flutter-apk/`.
