# Listly 🛒

Aplicativo de organização de listas de compras desenvolvido em Flutter como projeto acadêmico da disciplina de Desenvolvimento Móvel.

## Sobre o projeto

O Listly foi criado para ajudar os usuários a organizar suas compras de maneira simples e prática.

O projeto foi iniciado no Trabalho 1 com as funcionalidades de criação, visualização e detalhamento de listas de compras.

No Trabalho 2, o mesmo aplicativo foi evoluído com integração ao Firebase Authentication, adicionando autenticação de usuários por e-mail e senha e proteção da área interna do aplicativo.

## Objetivo

Facilitar a organização das compras em um único aplicativo e permitir que cada usuário acesse a área interna por meio de autenticação.

## Tema e identidade visual

O aplicativo utiliza tema escuro com detalhes em verde-menta, mantendo a mesma identidade visual utilizada desde o Trabalho 1.

Cor principal:

`#5DE0B0`

## Funcionalidades implementadas

### Listas de compras

- Visualização das listas de compras.
- Exibição de listas de exemplo.
- Cadastro de novas listas.
- Validação do campo obrigatório de nome.
- Campo opcional de descrição.
- Mensagem de sucesso após o cadastro.
- Navegação entre as telas.
- Visualização dos detalhes de uma lista.
- Exibição da data de criação.

### Autenticação

- Integração com Firebase.
- Firebase Authentication.
- Cadastro de usuário com e-mail e senha.
- Login com e-mail e senha.
- Recuperação de senha por e-mail.
- Logout.
- Validação dos formulários.
- Tratamento de erros de autenticação.
- Indicador de carregamento durante operações.
- Controle do estado de autenticação.
- Proteção da área interna do aplicativo.
- Redirecionamento automático de acordo com o estado da sessão.

## Fluxo de autenticação

Ao iniciar o aplicativo, o `AuthGate` verifica o estado de autenticação do Firebase.

- Usuário não autenticado → tela de Login.
- Usuário autenticado → tela Minhas listas.
- Cadastro realizado → usuário é autenticado.
- Logout → sessão encerrada e retorno ao Login.
- Recuperação de senha → Firebase envia um e-mail para redefinição da senha.

## Telas do aplicativo

### Login

Permite entrar no aplicativo utilizando e-mail e senha. Também oferece acesso ao cadastro e à recuperação de senha.

### Criar conta

Permite cadastrar um novo usuário utilizando e-mail, senha e confirmação de senha.

### Recuperar senha

Permite solicitar ao Firebase o envio de um e-mail para redefinição da senha.

### Minhas listas

Área interna protegida. Apresenta as listas cadastradas, permite criar novas listas, acessar detalhes e realizar logout.

### Nova lista

Formulário utilizado para cadastrar uma lista de compras. O nome é obrigatório e a descrição é opcional.

### Detalhes da lista

Apresenta o nome, a descrição e a data de criação da lista selecionada.

## Tecnologias utilizadas

- Flutter
- Dart
- Material Design 3
- Firebase Core
- Firebase Authentication
- FlutterFire CLI

## Organização do código

O projeto mantém as responsabilidades separadas entre modelos, telas e serviços.

- `lib/main.dart`: inicialização do Flutter e Firebase.
- `lib/firebase_options.dart`: configuração do Firebase gerada pelo FlutterFire.
- `lib/models/lista_compra.dart`: modelo de dados das listas.
- `lib/services/auth_service.dart`: operações de autenticação com Firebase.
- `lib/screens/auth_gate.dart`: controle do estado de autenticação.
- `lib/screens/login_screen.dart`: tela de login.
- `lib/screens/register_screen.dart`: tela de cadastro.
- `lib/screens/forgot_password_screen.dart`: tela de recuperação de senha.
- `lib/screens/home_screen.dart`: área interna com as listas e logout.
- `lib/screens/nova_lista_screen.dart`: formulário de nova lista.
- `lib/screens/detalhes_lista_screen.dart`: detalhes da lista selecionada.

## Firebase

O projeto utiliza Firebase Authentication com o provedor E-mail/Senha.

As plataformas configuradas no FlutterFire são:

- Android
- Web

Não foi utilizado Firestore nesta etapa, pois o foco do Trabalho 2 é a autenticação.

## Como executar

É necessário ter o Flutter instalado e configurado.

1. Clone este repositório.
2. Abra a pasta do projeto no VS Code.
3. Execute:

```bash
flutter pub get
flutter run -d chrome
```

## Verificação do projeto

O código foi formatado utilizando:

```bash
dart format .
```

A análise estática foi executada utilizando:

```bash
flutter analyze
```

Resultado da revisão final do Trabalho 2:

```text
No issues found!
```

Também foram realizados testes manuais dos principais fluxos de autenticação:

- Cadastro de usuário.
- Login.
- Logout.
- Recuperação de senha.
- Recebimento do e-mail de recuperação.
- Redirecionamento entre Login e área autenticada.

## Limitações atuais

As listas de compras ainda são armazenadas apenas localmente em memória.

Ao reiniciar o aplicativo, novas listas criadas durante a execução não permanecem salvas.

O Firebase está sendo utilizado nesta etapa para autenticação. Ainda não foi implementada persistência das listas utilizando Firestore ou outro banco de dados.

## Melhorias futuras

- Persistir listas e produtos em banco de dados.
- Permitir adicionar produtos dentro de cada lista.
- Marcar produtos como comprados.
- Editar e excluir listas.
- Associar os dados ao usuário autenticado.

## Evolução acadêmica

### Trabalho 1

Desenvolvimento da estrutura inicial do Listly, identidade visual, modelo de dados, cadastro de listas, navegação e tela de detalhes.

### Trabalho 2

Integração com Firebase Authentication, incluindo cadastro, login, recuperação de senha, logout, controle de sessão e proteção da área interna do aplicativo.

## Autor

João Victor Clemente Ferreira Ramos

Projeto acadêmico — Desenvolvimento Móvel.