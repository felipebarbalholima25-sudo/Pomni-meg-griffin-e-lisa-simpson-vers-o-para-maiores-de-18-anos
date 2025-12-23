#!/usr/bin/env bash
# create_package.sh
# Uso: ./create_package.sh
# Gera TTS/placeholders e empacota tudo em renpy-prototype.zip

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUT_DIR="$ROOT_DIR/package_temp"
ZIP_NAME="renpy-prototype.zip"

echo "[1/6] Criando pastas temporárias em $OUT_DIR"
rm -rf "$OUT_DIR"
mkdir -p "$OUT_DIR"

echo "[2/6] Gerando TTS e placeholders (pode demorar e precisa de ffmpeg + internet para gTTS)"
python3 "$ROOT_DIR/generate_tts.py"
python3 "$ROOT_DIR/generate_placeholders.py"

echo "[3/6] Copiando arquivos necessários para o pacote"
# Ajuste a lista abaixo conforme necessário
mkdir -p "$OUT_DIR/game"
cp -r "$ROOT_DIR/game"/* "$OUT_DIR/game/"

# Copia scripts e docs (se existirem na raiz)
for f in generate_tts.py generate_placeholders.py README.md .gitignore; do
  if [ -f "$ROOT_DIR/$f" ]; then
    cp "$ROOT_DIR/$f" "$OUT_DIR/"
  fi
done

echo "[4/6] Removendo arquivos temporários desnecessários do pacote (se houver)"
# remover caches ou arquivos temporários gerados
rm -f "$OUT_DIR/game/"*.rpyc || true
rm -rf "$OUT_DIR/game/cache" || true

echo "[5/6] Criando ZIP $ZIP_NAME"
cd "$OUT_DIR"
zip -r -X "$ROOT_DIR/$ZIP_NAME" ./*
cd "$ROOT_DIR"

echo "[6/6] Limpeza"
rm -rf "$OUT_DIR"

echo "Pronto: $ZIP_NAME criado em $ROOT_DIR"