# Mona Alberta — Protótipo Ren'Py (com áudio)

Aviso importante
- Este protótipo é destinado a um público adulto. Você confirmou que todas as personagens têm 24 anos — mantenha essa condição.
- Não inclua conteúdo envolvendo menores.

Áudio incluído
- O projeto agora suporta:
  - Vozes (linhas faladas) por personagem em `game/voice/`
  - Música de fundo (BGM) em `game/audio/`
  - Efeitos sonoros (SFX) em `game/sfx/`
- Nomes e recomendações estão em `game/README_ASSETS.txt`.

Como adicionar suas vozes
1. Grave/coloque os ficheiros de voz em `game/voice/` com os nomes listados em `game/README_ASSETS.txt`.
2. Use OGG (recomendado) ou MP3.
3. Ajuste o volume em cada ficheiro se necessário; o Ren'Py também possui controles de mixer.

Observações técnicas
- O script usa a instrução `voice "game/voice/arquivo.ogg"` antes das falas para tocar a gravação no canal `voice`.
- Efeitos curtos são reproduzidos com `play sound "game/sfx/efeito.ogg"`.
- Música é reproduzida com `play music "game/audio/bgm_... .ogg"`; use `stop music fadeout x` para suavizar a parada.

Como rodar
1. Instale Ren'Py: https://www.renpy.org/latest.html
2. Copie a pasta `game/` para `renpy-<versão>/projects/<nome_do_projeto>/game/` ou crie um novo projeto e substitua a pasta `game/`.
3. Coloque as imagens em `game/images/` e o áudio nas pastas indicadas.
4. Abra o Ren'Py Launcher e execute o projeto.

Próximos passos que eu posso fazer
- Gerar linhas de voz baseadas no texto automaticamente (TTS) para protótipo, se quiser — posso gerar TTS em Português (neutro) para cada linha.
- Criar um wiki de gravação com roteiro dividido por ficheiros de áudio.
- Ajustar mixagem (volume relativo BGM/voice/SFX).
- Comitar os arquivos no repositório quando autorizar.
