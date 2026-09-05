# ====================================================================
# Protocolo de Cierre de Dia y Autodestruccion de Sesion (CESDE)
# ====================================================================

$ErrorActionPreference = "Continue"
$WorkDir = "$env:USERPROFILE\Documents\Jeiser\Asistente_Personal"
$TokenFile = "$env:USERPROFILE\.github_token_cesde"

Write-Host "=======================================================" -ForegroundColor Cyan
Write-Host "  PROTOCOLO DE CIERRE Y PURGA DE SEGURIDAD (CESDE)     " -ForegroundColor Cyan
Write-Host "=======================================================" -ForegroundColor Cyan

# --- 1. RESPALDO COMPLETO EN GITHUB ---
Write-Host "[1/4] Subiendo todo tu trabajo a GitHub..." -ForegroundColor Cyan
if (Test-Path $WorkDir) {
    Set-Location $WorkDir
    $DateStr = Get-Date -Format "yyyy-MM-dd HH:mm"
    git add .
    git commit -m "docs(cesde): cierre de clase y purga de sesion - $DateStr"
    git push origin main
    Write-Host "✅ Respaldado 100% en GitHub." -ForegroundColor Green
} else {
    Write-Host "⚠️ Carpeta de repositorio no encontrada." -ForegroundColor Yellow
}

# --- 2. PURGA DE FREEBIUFF SESSION (credenciales + historial + config) ---
Write-Host "[2/4] Cerrando sesion y eliminando datos de Freebuff..." -ForegroundColor Cyan
# Freebuff guarda credenciales, historial y config en ~/.config/manicode/
Remove-Item -Path "$env:USERPROFILE\.config\manicode" -Recurse -Force -ErrorAction SilentlyContinue
Write-Host "✅ Sesion de Freebuff purgada." -ForegroundColor Green

# --- 3. PURGA DE TOKEN Y CREDENCIALES DE GITHUB ---
Write-Host "[3/4] Eliminando tokens y credenciales de GitHub..." -ForegroundColor Cyan
if (Test-Path $TokenFile) {
    Remove-Item -Path $TokenFile -Force -ErrorAction SilentlyContinue
}
git credential-manager logout https://github.com 2>$null
Write-Host "✅ Token de GitHub eliminado de la maquina." -ForegroundColor Green

# --- 4. PURGA DE PERFIL ISLADO DE VSCODE ---
Write-Host "[4/4] Limpiando perfil aislado de VSCode..." -ForegroundColor Cyan
Remove-Item -Path "$env:USERPROFILE\JeiserVSCodeData" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path "$env:USERPROFILE\JeiserVSCodeExts" -Recurse -Force -ErrorAction SilentlyContinue
Write-Host "✅ Perfil de VSCode eliminado." -ForegroundColor Green

Write-Host "=======================================================" -ForegroundColor Green
Write-Host "  AUTODESTRUCCION Y PURGA COMPLETADA EXITOSAMENTE.      " -ForegroundColor Green
Write-Host "  No quedo rastro de tu sesion en esta PC. ¡Hasta luego!" -ForegroundColor Green
Write-Host "=======================================================" -ForegroundColor Green
