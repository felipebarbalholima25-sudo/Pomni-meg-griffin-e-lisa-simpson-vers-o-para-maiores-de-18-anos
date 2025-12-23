# create_package.ps1
# Uso: .\create_package.ps1
# Gera TTS/placeholders e empacota tudo em renpy-prototype.zip

Set-StrictMode -Version Latest
$root = Split-Path -Parent $MyInvocation.MyCommand.Definition
$out = Join-Path $root "package_temp"
$zipName = Join-Path $root "renpy-prototype.zip"

Write-Output "[1/6] Preparando pasta temporária: $out"
if (Test-Path $out) { Remove-Item -Recurse -Force $out }
New-Item -ItemType Directory -Path $out | Out-Null

Write-Output "[2/6] Gerando TTS e placeholders (precisa de ffmpeg e internet)"
python "$root\generate_tts.py"
python "$root\generate_placeholders.py"

Write-Output "[3/6] Copiando arquivos para o pacote"
Copy-Item -Recurse -Force -Path "$root\game\*" -Destination "$out\game"
$files = @("generate_tts.py","generate_placeholders.py","README.md",".gitignore")
foreach ($f in $files) {
  $src = Join-Path $root $f
  if (Test-Path $src) { Copy-Item -Force $src -Destination $out }
}

Write-Output "[4/6] Limpando arquivos temporários"
# remover .rpyc e cache se existir
Get-ChildItem -Path "$out\game" -Recurse -Include *.rpyc -ErrorAction SilentlyContinue | Remove-Item -Force -ErrorAction SilentlyContinue
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$out\game\cache" 

Write-Output "[5/6] Criando ZIP $zipName"
if (Test-Path $zipName) { Remove-Item $zipName -Force }
Compress-Archive -Path "$out\*" -DestinationPath $zipName

Write-Output "[6/6] Limpeza"
Remove-Item -Recurse -Force $out

Write-Output "Pronto: $zipName criado em $root"