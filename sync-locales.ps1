# Synchronise /en/ et /ru/ depuis index.html (FR = source de verite).
# A relancer apres CHAQUE modification de index.html :  powershell -ExecutionPolicy Bypass -File sync-locales.ps1
# Les titres/descriptions localises sont dans locales.json (UTF-8).
$ErrorActionPreference = 'Stop'
$dir  = Split-Path -Parent $MyInvocation.MyCommand.Path
$enc  = New-Object System.Text.UTF8Encoding($false)
$base = 'https://www.aquavaporelite.com'
$src  = [System.IO.File]::ReadAllText((Join-Path $dir 'index.html'), [System.Text.Encoding]::UTF8)
$cfg  = [System.IO.File]::ReadAllText((Join-Path $dir 'locales.json'), [System.Text.Encoding]::UTF8) | ConvertFrom-Json

foreach ($loc in $cfg.locales) {
  $code = $loc.code
  $t = $src
  $t = $t.Replace('<html lang="fr" data-lang="fr">', '<html lang="' + $loc.lang + '" data-lang="' + $loc.lang + '">')
  $t = $t.Replace('<link rel="canonical" href="' + $base + '/" />', '<link rel="canonical" href="' + $base + '/' + $code + '/" />')
  $t = $t.Replace('<meta property="og:url" content="' + $base + '/" />', '<meta property="og:url" content="' + $base + '/' + $code + '/" />')
  $t = $t.Replace('content="fr_FR"', 'content="' + $loc.ogLocale + '"')
  $t = $t.Replace($cfg.source.title, $loc.title)
  $t = $t.Replace($cfg.source.desc, $loc.desc)
  if (-not $t.Contains('lang="' + $loc.lang + '"')) { throw "Echec remplacement <html> pour $code" }
  $target = Join-Path $dir $code
  New-Item -ItemType Directory -Force $target | Out-Null
  [System.IO.File]::WriteAllText((Join-Path $target 'index.html'), $t, $enc)
  Write-Host ("OK -> " + $code + "/index.html")
}
Write-Host "Synchronisation terminee."
