# Bob

Bob é uma versão modificada do [Pestinha, de mille-okws](https://github.com/mille-okws/pestinha).
Em 18/11/2026, esta versão foi renomeada para Bob, incluindo o pacote Python, a interface,
os caminhos de dados e a geração do executável. O código continua sob GPL-3.0-or-later;
a aparência padrão foi alterada para corpo preto, moldura e olhos brancos e os demais personagens foram removidos na mesma data;
a autoria do projeto original é preservada. As imagens e os textos de `assets/` não estão
cobertos pela licença GPL do código, conforme o aviso do projeto original.

Bob é seu personagem de tela para Windows, macOS e Linux: corpo preto, olhos e moldura brancos.
Ele cai, quica, pousa nas janelas, brinca com uma bolinha, trabalha num notebook e aprende com suas interações.
Esta versão inclui apenas o Bob. Seu identificador interno continua `bryan` para preservar a memória existente.

Quem decide o que o pet sente e faz é uma **rede neural pulsada** de 470 neurônios (integração e disparo com
vazamento), alimentada pelo que acontece no seu computador e pelo que você faz com ele. Algumas regras
do programa (limiares, o que pode ou não acontecer) são escritas à mão; a seção
[Como a decisão funciona](docs/ARQUITETURA.md#como-a-decisão-funciona) explica o que é aprendido e o que é regra.

> Projeto em desenvolvimento. Algumas coisas podem não funcionar direito e o comportamento pode
> mudar entre versões.

## Seu personagem

O único personagem é o **Bob**, com visual preto e branco. Seus textos e memes ficam em `pets/bryan/`,
e sua configuração em `pets/bryan.json`. A memória que já existia continua sendo usada.

## O que o pet faz

| | |
|---|---|
| **Corpo** | Gravidade, quique, giro, pouso nas barras de título. Você arrasta, joga e gira com a rodinha. |
| **Emoções** | Saem dos motores da rede: feliz, contente, curioso, observando, bravo, triste, assustado, dramático, dormindo. |
| **Carinho** | Passe o mouse de um lado para o outro em cima dele: fecha os olhinhos de felicidade e aprende com isso. |
| **Bolinha** | Ele chuta e arremessa uma bolinha de tênis; você pode pegar, levar embora (ele reage) ou guardar. |
| **Notebook** | Quando você trabalha (VS Code, Visual Studio, PyCharm, Claude, Codex), ele pode sentar atrás do notebook e trabalhar junto. Você também pode pedir; ele decide se quer. |
| **Travessuras** | Traz memes, fotos e post-its para a tela. Com que frequência é decidido pela rede (tédio, curiosidade). |
| **Protesto** | Bravo por muito tempo: reclamação, manifestação, greve e revolução contra o cursor, com cartazes e bolinhas de papel. |
| **Tristeza** | Sozinho ou ignorado, fica triste, vai para o cantinho e cola bilhetes tristes. |
| **Cantinho do castigo** | Uma placa que você arrasta para onde quiser. Solte ele na frente dela e ele fica de castigo: olha para você, vira de costas, xinga em cartazes e, se a frustração durar, foge. Carinho faz ele perdoar. |
| **Sono e fogos** | Dorme quando a energia acaba. Muito feliz, solta fogos de artifício. |

Tudo o que ele aprende (carinho, condicionamento, o que deu certo nas travessuras, fugas do castigo)
fica salvo localmente e muda o jeito dele com o tempo.

## Requisitos

- Windows 10 ou 11, macOS (Quartz/pyobjc), Linux com X11 ou KDE Plasma 6 com Wayland.
- Python 3.11 ou mais novo.
- No Linux, para as janelas e o tempo ocioso: `xdotool`, `wmctrl` e `xprintidle`. Sem eles, o pet continua
  andando, mas não enxerga as janelas.
- No Wayland, o pet precisa do XWayland (no Arch e no CachyOS: `xorg-xwayland`); sem ele, avisa e não abre.
- No KDE Plasma 6 com Wayland, o pet roda pelo XWayland e um script do KWin, carregado enquanto ele está
  aberto, informa as janelas, o cursor e o atalho, e tira as janelas do pet da barra de tarefas. Não precisa
  dos comandos do X11. Para o tempo ocioso,
  instale também `pip install "pywayland>=0.4.19"` (fica fora do `requirements.txt` porque só tem pacote pronto
  para x86_64 com glibc 2.34 ou mais nova; sem ele, o pet age como se você estivesse sempre ativo).
- Cerca de 70 MB de RAM com ele rodando.

## Instalação e uso

```bash
pip install -r requirements.txt
```
```bash
python main.py
```

Na primeira vez, um passo a passo explica o que ele vê e não vê, e depois abre a tela de permissões. Depois
de clicar em **Começar**, as próximas aberturas vão direto para o pet. A tela volta a aparecer se o pânico
tiver desligado o programa. Para abrir a tela de propósito:

```bash
python main.py --configurar
```

Com o programa aberto, as opções também ficam em **Configurações**, no ícone da bandeja. No Windows, é lá que
se marca **Abrir o Bob ao entrar no Windows**. Só uma cópia abre por vez.

### Como interagir

| Gesto | Efeito |
|---|---|
| Clique rápido | Cutucada |
| Passar o mouse de um lado para o outro em cima dele | Carinho |
| Segurar e arrastar / soltar rápido | Leva junto / arremessa |
| Rodinha do mouse | Gira |
| Botão direito | Menu: cutucar, carinho, bolinha, dormir, travessura, trabalhar, notebook, cantinho do castigo, painéis, configurações, esconder, fechar |

### Pânico

`Ctrl + Alt + Shift + B` desliga tudo na hora, e ele continua desligado até você religar em
Configurações.

### Modo teste

Desligado por padrão. Ligado, os tempos ficam curtos (emoções, travessuras e protesto acontecem em
segundos), os painéis de desenvolvimento ficam na tela (monitor neural e painel de protesto) e o
terminal mostra as decisões.

## Privacidade

Ele roda só no seu computador e não envia nada para a internet. Lê o **nome** do programa em primeiro
plano, o tempo sem usar teclado e mouse, a posição do cursor e a geometria das janelas. **Nunca** lê
conteúdo nem título de janela. Tudo o que ele grava fica na pasta de dados e pode ser apagado pela tela de
configurações: `memory/`, rodando pelo código, ou `%LOCALAPPDATA%\Bob`, no executável do Windows.
Detalhes em [PRIVACIDADE.md](PRIVACIDADE.md).

## Personalizar

- **Memes, recadinhos e cartazes do Bryan:** pasta `pets/bryan/`, explicada em [pets/README.md](pets/README.md).
  Pode editar com ele aberto.
- **Bolinhas, notebook e suas fotos:** `assets/comum/`, valem para qualquer personagem
  ([assets/LEIA-ME.txt](assets/LEIA-ME.txt)).
- **Programas que ele reconhece:** `assets/comum/programas.json` soma programas à lista de trabalho, jogo, música etc.
- **Personalidade:** `pets/bryan.json` (semente da rede, temperamento, pesos de brincadeira, reação ao notebook).
- **Números do comportamento:** `bob/ajustes.py`, todos validados ao abrir.

## Estrutura

| Pasta | O que tem |
|---|---|
| `bob/` | O código, em camadas ([bob/README.md](bob/README.md)) |
| `assets/comum/` | Imagens da bolinha e do notebook, e suas fotos: valem para qualquer pet |
| `pets/` | Cada pet: `<pet>.json` (quem ele é) e `<pet>/` (frases, cartazes e memes dele) |
| `tests/` | Testes automáticos |
| `ferramentas/fuzz_bob.py` | Fuzzer: roda ações aleatórias e checa invariantes |
| `ferramentas/` | Geradores de documentação |
| `docs/` | Arquitetura, rede neural e relatórios ([docs/README.md](docs/README.md)) |
| `memory/` | Gerada em uso, com o que ele aprende. Não vai para o repositório |

## Documentação

- [docs/ARQUITETURA.md](docs/ARQUITETURA.md): como as partes conversam.
- [docs/REDE_NEURAL.md](docs/REDE_NEURAL.md): canais, interneurônios, motores e decisões da rede.
- [bob/README.md](bob/README.md) e o README de cada pasta: o que cada arquivo faz.
- [CONTRIBUTING.md](CONTRIBUTING.md): como rodar os testes e contribuir.
- [CHANGELOG.md](CHANGELOG.md): o que mudou.

## Desenvolvimento

```bash
pip install -r requirements-dev.txt
```
```bash
python -m pytest -q
```

Os testes rodam sem abrir janelas (Qt em modo offscreen). Mais detalhes em [CONTRIBUTING.md](CONTRIBUTING.md).

### Gerar o executável

Há duas formas: gerar no seu computador (só o sistema em que você está) ou deixar o GitHub gerar os três.
O PyInstaller só gera o executável do sistema onde roda, por isso um Windows não gera o de Mac.

#### Opção 1: no seu computador

1. Instale as dependências de desenvolvimento (inclui o PyInstaller):

   ```bash
   pip install -r requirements-dev.txt
   ```

2. Gere o executável, no Windows:

   ```bash
   python -m PyInstaller --noconfirm --onefile --windowed --name Bob --distpath build/onefile --workpath build/work --specpath build --hidden-import win32timezone --version-file "$PWD/instalador/bob-version.txt" main.py
   ```

   No macOS e no Linux, use o mesmo comando sem `--windowed` e sem `--hidden-import win32timezone` e sem `--version-file instalador/bob-version.txt`. No Linux,
   acrescente `--add-data "$PWD/bob/plataforma/kwin_ponte.js:bob/plataforma"` (script do KWin).

3. O resultado fica em `build/onefile/` (`Bob.exe` no Windows, `Bob` nos outros).

4. Monte a pasta de entrega: copie o executável e as pastas `assets/` e `pets/` para uma mesma pasta.
   O programa lê o conteúdo dessas pastas ao lado do executável. No Windows, a memória fica em
   `%LOCALAPPDATA%\Bob`, a menos que já exista uma pasta `memory/` ao lado dele. Nos outros sistemas, a
   `memory/` é criada sozinha na primeira execução, então não copie a sua.

5. Opcional, no Windows: gere o instalador com o [Inno Setup 6](https://jrsoftware.org/isinfo.php). Ele usa o
   executável do passo 3, instala só para o usuário atual e não pede administrador:

   ```bash
   ISCC instalador/bob.iss
   ```

   O resultado fica em `instalador/saida/`.

#### Opção 2: pelo GitHub (os três sistemas de uma vez)

O workflow `.github/workflows/executaveis.yml` gera Windows, macOS e Linux em máquinas do próprio GitHub.

1. Suba o repositório para o GitHub (`git push`).
2. Para gerar sem criar versão: na aba **Actions**, escolha **executáveis**, clique em **Run workflow**.
3. Para gerar e publicar uma versão: crie uma tag e envie. Por exemplo:

   ```bash
   git tag v0.8.0
   git push origin v0.8.0
   ```

4. Ao terminar (alguns minutos), a execução tem três artefatos, um por sistema, com a pasta pronta
   (executável + `assets/` + `pets/`). Baixe pela própria página da execução, na seção **Artifacts**.

Para distribuir para quem não é do projeto, publique esses artefatos na aba **Releases** (use "Draft a new release"
na tag criada), e não dentro do repositório: cada executável tem cerca de 60 MB.

#### Depois de gerar

- Para testar sem misturar com a sua memória, crie uma pasta `memory/` vazia ao lado do executável de teste.
- O executável não é assinado: o Windows e o macOS avisam na primeira execução. No macOS, a permissão de
  Acessibilidade é necessária para o atalho Ctrl+Alt+Shift+B; no Linux, o atalho e as janelas precisam de
  `xdotool`, `wmctrl` e `xprintidle`.

## Licença

O código do Bob é software livre, sob a [GNU General Public License v3.0 ou posterior](LICENSE)
(GPL-3.0-or-later). Você pode usar, estudar, modificar e redistribuir, mas toda versão distribuída,
modificada ou não, precisa continuar aberta e sob a mesma licença.

As imagens e os textos de `assets/` não estão cobertos por esta licença

## Limitações conhecidas

- Linux ainda não foi testado numa máquina real: a parte de leitura das janelas e do teclado foi escrita e
  testada só nas partes de texto (ver `tests/test_plataforma.py`). No macOS, `tests/test_macos_real.py` abre
  janelas de verdade e lê o sistema num Mac real, inclusive no CI.
- No macOS, o pet precisa da permissão de Acessibilidade para o atalho Ctrl+Alt+Shift+B funcionar.
- No Wayland fora do KDE Plasma 6 (GNOME, Sway, Hyprland), o pet não enxerga janelas nem o tempo ocioso, e o
  atalho global não funciona.
- Pouco testado com escala de tela acima de 100% e com vários monitores. A tela cheia num monitor esconde o
  pet em todos.
- Jogos em janela sem borda podem não ser detectados como tela cheia.
- O executável não é assinado; o Windows pode avisar na primeira execução.
