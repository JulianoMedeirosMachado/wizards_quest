# Wizard's Quest

**Narrativa:**
Em Wizard's Quest, você joga como um jovem mago chamado Elric, que deve salvar o Reino de Eldoria das forças sombrias que ameaçam destruir a paz. Elric deve coletar artefatos mágicos, enfrentar criaturas malignas e desvendar segredos antigos para restaurar a harmonia no reino.

## Objetivos

### Fáceis
- ✅ Coleta de ervas mágicas para poções
- ✅ Treinamento de feitiços básicos
- ✅ Defesa de uma vila contra criaturas pequenas
- ✅ Resgate de aldeões capturados

### Difíceis
- ✅ Exploração de uma floresta encantada
- [X] Combate contra um dragão
- ✅ Recuperação de um artefato mágico roubado
- ✅ Infiltração em uma torre de magos corrompidos

### Muito Difíceis
- ✅ Batalha contra o necromante chefe (alguma coisa movendo IA para dificultar)
- ✅ Defesa do castelo contra um exército de criaturas das trevas

## Dependências

- [Godot Engine](https://godotengine.org/) 3.5 ou superior
- [Godot Asset Library](https://godotengine.org/asset-library/asset) para assets adicionais
- Sistema Operacional: Windows, macOS ou Linux

## Instalação

Siga os passos abaixo para configurar o ambiente do jogo:

1. Clone o repositório para o seu computador:
    ```sh
    git clone https://github.com/seu-usuario/wizards-quest.git
    cd wizards-quest
    ```

2. Abra o projeto no Godot Engine:
    1. Abra o Godot Engine.
    2. Clique em "Import" e selecione o arquivo `project.godot` no diretório `wizards-quest`.

3. Execute o jogo clicando no botão de "Play" no Godot Engine.

## Estrutura do Projeto

```plaintext
wizards-quest/
│
├── entities_scenes/    # Cenas de entidades do jogo
├── scenarios/          # Cenários do jogo
├── scripts/            # Scripts de lógica do jogo
├── sprites/            # Recursos gráficos do jogo
├── project.godot       # Arquivo de configuração do projeto Godot
├── README.md           # Este arquivo
└── LICENSE             # Arquivo de licença

