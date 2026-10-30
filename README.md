# Listly 🛒

Aplicativo de organização de listas de compras desenvolvido em **Flutter**, como projeto acadêmico da disciplina de Desenvolvimento Móvel.

## 📱 Sobre o projeto

O **Listly** foi desenvolvido para facilitar a organização de listas de compras, oferecendo uma interface simples, intuitiva e acessível.

O aplicativo passou por três etapas de desenvolvimento:

- **Trabalho 1:** criação da estrutura inicial, interface e funcionalidades básicas das listas.
- **Trabalho 2:** implementação da autenticação de usuários utilizando Firebase Authentication.
- **Trabalho 3:** integração com Cloud Firestore e implementação das operações de cadastro, consulta, edição e exclusão de listas.

O projeto mantém a mesma identidade visual e evolui a cada etapa, aproveitando as funcionalidades já implementadas.

## 🎯 Objetivo

Desenvolver um aplicativo que permita aos usuários organizar suas listas de compras de forma prática, com autenticação e armazenamento persistente na nuvem.

Cada usuário possui acesso às suas próprias listas, garantindo a separação dos dados entre diferentes contas.

## 🎨 Identidade visual

O Listly utiliza uma interface baseada em:

- Tema escuro.
- Detalhes em verde-menta.
- Componentes do Material Design 3.
- Navegação simples e intuitiva.

**Cor principal:** `#5DE0B0`

A identidade visual foi mantida desde o Trabalho 1.

## ⚙️ Funcionalidades implementadas

### 🛒 Gerenciamento de listas

- Cadastro de novas listas de compras.
- Consulta das listas cadastradas.
- Edição do nome e da descrição das listas.
- Exclusão de listas mediante confirmação.
- Visualização dos detalhes de cada lista.
- Exibição da data de criação.
- Validação do nome obrigatório.
- Campo opcional de descrição.
- Mensagens de sucesso e erro.
- Indicador de carregamento durante operações.
- Mensagem quando não existem listas cadastradas.

### 🔐 Autenticação

- Cadastro de usuários com e-mail e senha.
- Login utilizando Firebase Authentication.
- Recuperação de senha por e-mail.
- Logout.
- Validação dos formulários.
- Tratamento de erros de autenticação.
- Indicadores de carregamento.
- Controle do estado de autenticação.
- Proteção da área interna do aplicativo.
- Redirecionamento automático conforme a sessão do usuário.

### ☁️ Persistência de dados

- Integração com Cloud Firestore.
- Armazenamento das listas na nuvem.
- Recuperação automática dos dados.
- Atualização em tempo real utilizando `StreamBuilder`.
- Persistência após atualizar ou reiniciar o aplicativo.
- Associação das listas ao usuário autenticado.
- Regras de segurança para restringir o acesso aos dados.

## 🔄 Operações CRUD

O Trabalho 3 implementa as quatro operações fundamentais de gerenciamento de dados:

| Operação | Descrição | Implementação |
|---|---|---|
| CREATE | Criar uma lista | Cloud Firestore |
| READ | Consultar listas | Cloud Firestore |
| UPDATE | Editar uma lista | Cloud Firestore |
| DELETE | Excluir uma lista | Cloud Firestore |

As operações são realizadas pelo serviço `ListaService`, responsável pela comunicação com o banco de dados.

## 🔐 Fluxo de autenticação

Ao iniciar o aplicativo, o `AuthGate` verifica o estado de autenticação do Firebase.

- **Usuário não autenticado:** direcionado à tela de login.
- **Usuário autenticado:** direcionado à tela Minhas listas.
- **Cadastro realizado:** usuário autenticado após a criação da conta.
- **Logout:** sessão encerrada e retorno à tela de login.
- **Recuperação de senha:** envio de e-mail para redefinição da senha.

## 📱 Telas do aplicativo

### Login

Permite acessar o aplicativo utilizando e-mail e senha. Oferece acesso ao cadastro e à recuperação de senha.

### Criar conta

Permite cadastrar um novo usuário com e-mail, senha e confirmação de senha.

### Recuperar senha

Permite solicitar o envio de um e-mail para redefinição da senha.

### Minhas listas

Área protegida do aplicativo, responsável por apresentar as listas armazenadas no Firestore.

Permite:

- Visualizar listas cadastradas.
- Criar novas listas.
- Editar listas existentes.
- Excluir listas.
- Acessar os detalhes.
- Encerrar a sessão.

### Nova lista / Editar lista

Formulário reutilizado para cadastrar e editar listas.

No cadastro, os campos são apresentados vazios.

Na edição, os campos são preenchidos automaticamente com os dados atuais da lista.

### Detalhes da lista

Apresenta o nome, a descrição e a data de criação da lista selecionada.

## 🛠️ Tecnologias utilizadas

- **Flutter:** desenvolvimento da interface.
- **Dart:** linguagem de programação.
- **Material Design 3:** componentes visuais.
- **Firebase Core:** inicialização e integração com Firebase.
- **Firebase Authentication:** autenticação de usuários.
- **Cloud Firestore:** banco de dados NoSQL.
- **FlutterFire CLI:** configuração da integração com Firebase.
- **Git e GitHub:** versionamento do projeto.

## 📂 Organização do código

O projeto utiliza uma organização que separa modelos, telas e serviços.

### Arquivos principais

- `lib/main.dart`: inicialização do Flutter e Firebase.
- `lib/firebase_options.dart`: configurações do Firebase geradas pelo FlutterFire.
- `lib/models/lista_compra.dart`: modelo de dados das listas e conversão para o Firestore.
- `lib/services/auth_service.dart`: operações de autenticação.
- `lib/services/lista_service.dart`: operações CRUD com Cloud Firestore.

### Telas

- `lib/screens/auth_gate.dart`: controle do estado de autenticação.
- `lib/screens/login_screen.dart`: tela de login.
- `lib/screens/register_screen.dart`: cadastro de usuários.
- `lib/screens/forgot_password_screen.dart`: recuperação de senha.
- `lib/screens/home_screen.dart`: listagem, cadastro, edição e exclusão de listas.
- `lib/screens/nova_lista_screen.dart`: formulário de cadastro e edição.
- `lib/screens/detalhes_lista_screen.dart`: visualização dos detalhes.

## ☁️ Integração com Firebase

O projeto utiliza dois serviços principais do Firebase.

### Firebase Authentication

Responsável pelo gerenciamento de contas e sessões dos usuários.

O método de autenticação utilizado é **E-mail/Senha**.

### Cloud Firestore

Responsável pelo armazenamento persistente das listas de compras.

Os documentos são organizados de acordo com o identificador do usuário autenticado.

**Estrutura dos dados:**

```text
users
 └── {userId}
      └── listas
           └── {listaId}
                ├── nome
                ├── descricao
                └── dataCriacao
```

Cada documento representa uma lista de compras.

### Segurança

As regras do Firestore restringem o acesso às listas de acordo com o UID do usuário autenticado.

Dessa forma, uma conta não possui permissão para consultar ou modificar as listas de outra conta por meio das operações protegidas pelo Firestore.

As regras foram configuradas para a estrutura `users/{userId}/listas/{listaId}`.

## ▶️ Como executar

### Pré-requisitos

- Flutter instalado e configurado.
- Dart SDK.
- VS Code ou outra IDE compatível.
- Navegador Chrome para execução Web.
- Configuração do Firebase do projeto.

### Passos

**1. Clone o repositório:**

```bash
git clone https://github.com/Joao-vct/listly.git
```

**2. Entre na pasta do projeto:**

```bash
cd listly
```

**3. Instale as dependências:**

```bash
flutter pub get
```

**4. Execute no Chrome:**

```bash
flutter run -d chrome
```

O aplicativo utiliza as configurações do Firebase presentes em `lib/firebase_options.dart`.

## 🧪 Testes realizados

### Trabalho 2 — Autenticação

Foram realizados testes manuais de:

- Cadastro de usuário.
- Login.
- Logout.
- Recuperação de senha.
- Recebimento do e-mail de recuperação.
- Redirecionamento entre as telas.
- Proteção da área autenticada.

### Trabalho 3 — Firestore

Foram realizados testes manuais de:

- Cadastro de listas no Firestore.
- Consulta das listas cadastradas.
- Edição de nome e descrição.
- Exclusão de listas.
- Confirmação antes da exclusão.
- Persistência após atualizar a página.
- Atualização automática da interface.
- Separação das listas entre usuários diferentes.

### Análise estática

O projeto foi analisado com:

```bash
flutter analyze
```

**Resultado da análise após a implementação do Trabalho 3:**

```text
No issues found!
```

## 📌 Limitações atuais

O aplicativo permite gerenciar listas de compras, mas ainda não possui gerenciamento individual dos produtos dentro de cada lista.

A tela de detalhes apresenta as informações gerais da lista.

## 🚀 Melhorias futuras

- Adicionar produtos dentro de cada lista.
- Informar quantidade e unidade dos produtos.
- Marcar produtos como comprados.
- Calcular o valor estimado das compras.
- Implementar pesquisa e filtros.
- Melhorar a experiência em dispositivos móveis.
- Ampliar os testes automatizados.

## 📚 Evolução acadêmica

### Trabalho 1 — Estrutura inicial

Desenvolvimento da primeira versão do Listly.

Foram implementados:

- Estrutura do aplicativo Flutter.
- Identidade visual.
- Modelo de dados.
- Cadastro de listas em memória.
- Navegação entre telas.
- Visualização de detalhes.

### Trabalho 2 — Autenticação

Evolução do projeto com Firebase Authentication.

Foram implementados:

- Cadastro de usuários.
- Login.
- Recuperação de senha.
- Logout.
- Controle de sessão.
- Proteção da área interna.
- Integração do Flutter com Firebase.

### Trabalho 3 — Cloud Firestore e CRUD

Evolução do aplicativo com persistência de dados na nuvem.

Foram implementados:

- Configuração do Cloud Firestore.
- Adaptação do modelo de dados.
- Serviço para comunicação com o banco.
- Cadastro de listas.
- Consulta em tempo real.
- Edição de listas.
- Exclusão com confirmação.
- Persistência dos dados.
- Separação das listas por usuário.
- Regras de segurança do Firestore.
- Tratamento de estados de carregamento, erro e lista vazia.

As funcionalidades dos trabalhos anteriores foram preservadas durante a evolução do projeto.

## 👨‍💻 Autor

**João Victor Clemente Ferreira Ramos**

Projeto acadêmico — Desenvolvimento Móvel.

**Repositório:** https://github.com/Joao-vct/listly