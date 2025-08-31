# Bank App - Estudos de Flutter

## 📖 Sobre o Projeto

Este é um aplicativo básico desenvolvido como um exercício prático para aprender e solidificar os conceitos fundamentais da tecnologia Flutter e da linguagem Dart. O objetivo principal não foi criar um produto completo, mas sim construir uma aplicação funcional do zero para entender o fluxo de desenvolvimento, a sintaxe da linguagem e a arquitetura de um projeto Flutter.

Durante o desenvolvimento deste app, os principais pontos de aprendizado foram:

-   **Sintaxe e Estrutura da Linguagem Dart**: Entender variáveis, funções, classes e programação assíncrona (`Future`, `async`/`await`).
-   **Arquitetura de Widgets do Flutter**: Aprender como compor interfaces utilizando `StatelessWidget` e `StatefulWidget`.
-   **Gerenciamento de Estado Simples**: Utilizar `StatefulWidget` para gerenciar o estado local da interface (como indicadores de carregamento).
-   **Consumo de API REST**: Fazer requisições HTTP para um backend, processar respostas JSON e lidar com estados de carregamento e erro usando `FutureBuilder`.
-   **Navegação entre Telas**: Implementar um fluxo de autenticação com navegação da tela de login/cadastro para a tela principal do app.
-   **Backend Simulado**: Criar um servidor local simples com **Node.js** e **Express** para simular uma API real, permitindo focar no desenvolvimento do frontend.

## ✨ Funcionalidades

-   [x] Tela de Login de usuário.
-   [x] Tela de Cadastro de novo usuário.
-   [x] Listagem de transações bancárias (com dados mockados).
-   [x] Backend local em Node.js para simular uma API REST.

## 🛠️ Tecnologias Utilizadas

-   **Flutter**: Framework principal para o desenvolvimento do app.
-   **Dart**: Linguagem de programação utilizada pelo Flutter.
-   **Node.js**: Ambiente de execução para o backend.
-   **Express.js**: Framework para criar a API do backend.

## 🚀 Como Executar o Projeto

Para executar este projeto em sua máquina local, siga os passos abaixo.

### Pré-requisitos

-   [Flutter SDK](https://docs.flutter.dev/get-started/install) instalado.
-   [Node.js](https://nodejs.org/en/) instalado (para rodar o backend).
-   Um emulador Android/iOS ou um dispositivo físico.

### Passos

1.  **Clone o repositório:**
    ```bash
    git clone [https://github.com/victorsoaresho/flutter-app.git](https://github.com/victorsoaresho/flutter-app.git)
    cd flutter-app
    ```

2.  **Configure e inicie o Backend:**
    O servidor local é necessário para que o app possa fazer as requisições de login, cadastro e transações.
    ```bash
    # Navegue até a pasta do backend
    cd backend

    # Instale as dependências
    npm install

    # Inicie o servidor
    node server.js
    ```
    Mantenha este terminal aberto.

3.  **Configure o App Flutter:**
    Em um **novo terminal**, na raiz do projeto (`flutter-app`), instale as dependências do Flutter.
    ```bash
    flutter pub get
    ```

4.  **Ajuste o IP do Host:**
    O aplicativo precisa saber o endereço de IP da sua máquina na rede para se comunicar com o backend.
    -   Encontre o seu endereço de IP local (ex: `192.168.12.8`).
    -   Abra o arquivo `lib/services/api_service.dart`.
    -   Altere a variável `baseUrl` para o seu IP:
        ```dart
        final String baseUrl = "http://SEU_IP_AQUI:3000";
        ```

5.  **Execute o Aplicativo:**
    Ainda no terminal da raiz do projeto, execute o comando para iniciar o app.
    ```bash
    flutter run
    ```

---
Feito com ❤️ para fins de aprendizado.