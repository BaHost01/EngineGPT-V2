# Engine GPT

Engine GPT é uma engine de jogos leve e eficiente, projetada para simplificar o desenvolvimento de jogos em C++. Ela inclui recursos essenciais para renderização, física, áudio e interface do usuário, e é otimizada para ocupar menos de 5 GB no disco.

## Recursos Principais

- **Renderização**: OpenGL e GLFW para renderização rápida e eficiente.
- **Física**: Box2D para simulações físicas 2D.
- **Áudio**: OpenAL para gerenciamento de áudio multiplataforma.
- **Interface do Usuário**: Dear ImGui para criação de interfaces de usuário flexíveis e dinâmicas.
- **Scripting**: Suporte a scripts em C++ para personalização e extensão.

## Instalação

Para instalar todas as ferramentas e bibliotecas necessárias, execute o script `install_engine_tools.ps1` em um ambiente PowerShell com privilégios de administrador.

1. Baixe o script [install_engine_tools.ps1](#).
2. Execute o PowerShell como administrador.
3. Navegue até o diretório onde o script está salvo.
4. Execute o script usando o comando:

    ```powershell
    .\install_engine_tools.ps1
    ```

5. Siga as instruções na tela para concluir a instalação.

## Estrutura do Projeto

A estrutura básica do projeto é a seguinte:

```plaintext
EngineGPT/
├── CMakeLists.txt
├── src/
│   ├── Engine/
│   ├── Graphics/
│   ├── Physics/
│   ├── Audio/
│   ├── Input/
│   ├── UI/
│   ├── Scripting/
│   └── main.cpp
├── include/
│   ├── Engine/
│   ├── Graphics/
│   ├── Physics/
│   ├── Audio/
│   ├── Input/
│   ├── UI/
│   └── Scripting/
├── assets/
└── scripts/
