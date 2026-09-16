# Listly 🛒

Aplicativo de organização de listas de compras desenvolvido em Flutter como projeto acadêmico da disciplina de Desenvolvimento Móvel.

## Sobre o projeto

O Listly foi criado para ajudar os usuários a organizar suas compras de maneira simples e prática. O aplicativo permite cadastrar listas, visualizar as listas criadas e consultar seus detalhes.

## Objetivo

Facilitar a organização das compras, permitindo que o usuário registre diferentes listas em um único aplicativo.

## Tema e identidade visual

O aplicativo utiliza um tema escuro, com detalhes em verde-menta, para oferecer uma interface simples e organizada.

## Funcionalidades implementadas

- Visualização das listas de compras.
- Exibição de listas de exemplo.
- Cadastro de novas listas.
- Validação do campo obrigatório de nome.
- Campo opcional de descrição.
- Mensagem de sucesso após o cadastro.
- Navegação entre as telas.
- Visualização dos detalhes de uma lista.
- Exibição da data de criação.

## Telas do aplicativo

### 1. Minhas listas

Tela principal que apresenta as listas cadastradas e permite acessar seus detalhes ou criar uma nova lista.

### 2. Nova lista

Formulário utilizado para cadastrar uma lista de compras. O nome é obrigatório e a descrição é opcional.

### 3. Detalhes da lista

Apresenta o nome, a descrição e a data de criação da lista selecionada.

## Tecnologias utilizadas

- Flutter
- Dart
- Material Design 3

## Organização do código

O projeto possui arquivos separados para a classe de modelo e para cada tela do aplicativo.

- `lib/main.dart`: inicialização e configuração do aplicativo.
- `lib/models/lista_compra.dart`: modelo de dados da lista.
- `lib/screens/home_screen.dart`: tela principal.
- `lib/screens/nova_lista_screen.dart`: formulário de cadastro.
- `lib/screens/detalhes_lista_screen.dart`: tela de detalhes.

## Como executar

É necessário ter o Flutter instalado e configurado.

1. Clone este repositório.
2. Abra a pasta do projeto no VS Code.
3. Execute os comandos:

```bash
flutter pub get
flutter run -d chrome
```

## Testes e análise

O projeto foi verificado utilizando:

```bash
flutter analyze
flutter test
```

Na revisão realizada durante o desenvolvimento, a análise não apresentou problemas e os testes passaram.

## Limitações atuais

Os dados são armazenados apenas na memória do aplicativo. Por isso, novas listas cadastradas não permanecem salvas após reiniciar o aplicativo.

Ainda não existe integração com banco de dados ou Firebase.

## Melhorias futuras

- Salvar as listas em um banco de dados.
- Permitir adicionar produtos dentro de cada lista.
- Marcar produtos como comprados.
- Editar e excluir listas.
- Implementar autenticação de usuários.

## Capturas de tela

As capturas das três telas serão adicionadas após a revisão final do aplicativo.

## Autor

João Victor Clemente Ferreira Ramos

Projeto acadêmico — Desenvolvimento Móvel.