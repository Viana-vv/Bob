# Executáveis

Abra `windows/Bob.exe` para usar a versão renomeada, gerada a partir do código desta pasta.
Para gerar novamente o `Bob.exe`, siga as instruções do README principal.

Cada pasta tem o programa pronto para rodar, com as pastas `assets/` e `pets/` ao lado (o programa
lê o conteúdo delas; sem elas, o pet fica sem memes e frases). A `memory/` é criada na primeira execução,
dentro da mesma pasta.

| Pasta | Sistema | Como abrir |
|---|---|---|
| `windows/` | Windows 10 ou 11 | duplo clique em `Bob.exe` |
| `macos/` | macOS | no Terminal, dentro da pasta: `./Bob` (o macOS pede permissão de Acessibilidade para o atalho Ctrl+Alt+Shift+B) |
| `linux/` | Linux (X11) | no terminal, dentro da pasta: `./Bob` |

O executável de macOS e Linux não sai daqui: é gerado pelo GitHub (workflow `executáveis`, na aba Actions,
ou nos Releases quando houver uma tag `v...`). Baixe o artefato do sistema que você quer.

O executável não é assinado: o Windows e o macOS podem avisar na primeira execução.
