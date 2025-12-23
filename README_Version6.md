# Mona Alberta — Protótipo Ren'Py (com áudio e TTS)

Aviso importante
- Este protótipo é destinado a um público adulto. Você confirmou que todas as personagens têm 24 anos — mantenha essa condição.
- Não inclua conteúdo envolvendo menores.

Conteúdo deste pacote
- game/script.rpy — script do jogo (com voz, SFX e BGM referenciados)
- generate_tts.py — gera TTS (gTTS) para as falas e gera arquivos OGG com ffmpeg; também cria BGM e SFX placeholders.
- generate_placeholders.py — gera imagens PNG/JPG placeholders usando Pillow.
- game/README_ASSETS.txt — lista de arquivos de áudio/imagens esperados.
- .gitignore — ignorar arquivos temporários do Ren'Py.

Como preparar o ambiente (passo a passo)
1. Instale ffmpeg (sistema):
   - Linux (Debian/Ubuntu): sudo apt install ffmpeg
   - macOS (Homebrew): brew install ffmpeg
   - Windows: baixe em https://ffmpeg.org e adicione ffmpeg.exe ao PATH

2. Instale dependências Python:
   - python3 -m pip install gTTS Pillow

3. Gerar TTS e placeholders:
   - python generate_tts.py
   - python generate_placeholders.py

4. Copiar a pasta `game/` para a pasta do projeto Ren'Py (ex.: renpy-7.4.0/projects/MeuProjeto/game/), ou criar novo projeto no Launcher e substituir `game/`.

5. Abrir Ren'Py Launcher e executar o projeto.

Validação / garantia de fluxo sem bugs básicos
- O script foi revisado para:
  - usar labels existentes (splash, start, praia_mona, cafe_alberta, etc.);
  - sempre retornar/encerrar quando o jogador escolhe "Sair";
  - usar play/stop music com fade para evitar sobreposição indesejada;
  - usar voice "arquivo.ogg" sempre antes de falas que possuem arquivo de voz associado.
- Caso renpy mostre erro de arquivo ausente, verifique:
  - caminhos relativos: game/voice/*.ogg, game/audio/*.ogg, game/sfx/*.ogg, game/images/*.
  - se ffmpeg gerou arquivos em pastas corretas.

Próximos passos sugeridos
- Substituir TTS por gravações humanas quando disponível.
- Ajustar mixagem (volume BGM/voice/SFX) no Ren'Py Launcher (Mixer).
- Expandir roteiro e adicionar saves/finais mais complexos.