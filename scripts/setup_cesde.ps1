# ====================================================================
# Script de Instalacion Portable CESDE (Sin permisos de Administrador)
# ====================================================================

$ErrorActionPreference = "Continue"
$WorkDir = "$env:USERPROFILE\Documents\Jeiser"
$NodeDir = "$env:LOCALAPPDATA\PortableNode"
$GitDir = "$env:LOCALAPPDATA\PortableGit"
$VSCodeDataDir = "$env:USERPROFILE\JeiserVSCodeData"
$VSCodeExtDir = "$env:USERPROFILE\JeiserVSCodeExts"
$RepoOwnerRepo = "jeiser270997-source/Asistente_Personal"
$DefaultToken = $env:GITHUB_TOKEN

Write-Host "[1/7] Verificando directorio de trabajo..." -ForegroundColor Cyan
if (!(Test-Path $WorkDir)) {
    New-Item -ItemType Directory -Path $WorkDir -Force | Out-Null
}
Set-Location $WorkDir

# --- 2. Verificar Git / Descargar Portable Git si no existe ---
Write-Host "[2/7] Verificando Git..." -ForegroundColor Cyan
if (!(Get-Command git -ErrorAction SilentlyContinue)) {
    if (!(Test-Path "$GitDir\cmd\git.exe")) {
        Write-Host "Git no instalado. Descargando MinGit Portable..." -ForegroundColor Yellow
        $GitZip = "$env:TEMP\mingit.zip"
        $GitUrl = "https://github.com/git-for-windows/git/releases/download/v2.43.0.windows.1/MinGit-2.43.0-64-bit.zip"
        try {
            Invoke-WebRequest -Uri $GitUrl -OutFile $GitZip
            Expand-Archive -Path $GitZip -DestinationPath $GitDir -Force
            Remove-Item $GitZip -Force
        } catch {
            Write-Host "No se pudo descargar Git portable automaticamente." -ForegroundColor Red
        }
    }
    $env:PATH = "$GitDir\cmd;$env:PATH"
}
Write-Host "Git detectado." -ForegroundColor Green

# --- 3. Autenticacion GitHub para Repositorio Privado ---
Write-Host "[3/7] Autenticacion en GitHub..." -ForegroundColor Cyan
$TokenFile = "$env:USERPROFILE\.github_token_cesde"
if (Test-Path $TokenFile) {
    $GithubToken = (Get-Content $TokenFile -Raw).Trim()
} else {
    $GithubToken = $DefaultToken
    $GithubToken | Out-File -FilePath $TokenFile -Encoding utf8 -Force
}
$RepoUrl = "https://$GithubToken@github.com/$RepoOwnerRepo.git"

# --- 4. Verificar/Descargar Node.js Portable (Sin Admin) ---
Write-Host "[4/7] Verificando Node.js..." -ForegroundColor Cyan
if (!(Get-Command node -ErrorAction SilentlyContinue)) {
    if (!(Test-Path "$NodeDir\node.exe")) {
        Write-Host "Descargando Node.js Portable..." -ForegroundColor Yellow
        $NodeZip = "$env:TEMP\node-portable.zip"
        $NodeUrl = "https://nodejs.org/dist/v20.11.1/node-v20.11.1-win-x64.zip"
        try {
            Invoke-WebRequest -Uri $NodeUrl -OutFile $NodeZip
            Expand-Archive -Path $NodeZip -DestinationPath "$env:TEMP\NodeTemp" -Force
            New-Item -ItemType Directory -Path $NodeDir -Force | Out-Null
            Copy-Item -Path "$env:TEMP\NodeTemp\node-v20.11.1-win-x64\*" -Destination $NodeDir -Recurse -Force
            Remove-Item $NodeZip, "$env:TEMP\NodeTemp" -Recurse -Force
        } catch {
            Write-Host "No se pudo descargar Node.js portable." -ForegroundColor Red
        }
    }
    $env:PATH = "$NodeDir;$env:PATH"
}
Write-Host "Node.js detectado: $(node -v)" -ForegroundColor Green

# --- 5. Instalar/Verificar Freebuff CLI ---
Write-Host "[5/7] Instalando / Verificando Freebuff CLI..." -ForegroundColor Cyan
$env:PATH = "$env:APPDATA\npm;$env:PATH"
if (!(Get-Command freebuff -ErrorAction SilentlyContinue)) {
    Write-Host "Instalando freebuff de forma local..." -ForegroundColor Yellow
    npm install -g freebuff --no-fund --no-audit
}
Write-Host "Freebuff CLI listo." -ForegroundColor Green

# --- 6. Descargar / Clonar Repositorio Privado ---
Write-Host "[6/7] Clonando/Sincronizando repositorio privado Asistente_Personal..." -ForegroundColor Cyan
$TargetRepoFolder = "$WorkDir\Asistente_Personal"
if (!(Test-Path "$TargetRepoFolder\.git")) {
    git clone $RepoUrl $TargetRepoFolder
} else {
    Write-Host "Repositorio existente. Sincronizando..." -ForegroundColor Yellow
    Set-Location $TargetRepoFolder
    git pull
}

# --- 7. Replicar Configuraciones & Extensiones de tu VSCode Actual ---
Write-Host "[7/7] Replicando tus extensiones y settings de VSCode..." -ForegroundColor Cyan

$SettingsFolder = "$VSCodeDataDir\User"
if (!(Test-Path $SettingsFolder)) {
    New-Item -ItemType Directory -Path $SettingsFolder -Force | Out-Null
}

$SettingsContent = '{"editor.formatOnSave":true,"editor.defaultFormatter":"esbenp.prettier-vscode","editor.tabSize":2,"editor.linkedEditing":true,"editor.stickyScroll.enabled":true,"editor.bracketPairColorization.enabled":true,"editor.guides.bracketPairs":true,"editor.suggestSelection":"first","editor.minimap.renderCharacters":false,"explorer.confirmDelete":false,"explorer.compactFolders":false,"files.autoSave":"afterDelay","files.autoSaveDelay":1000,"terminal.integrated.defaultProfile.windows":"PowerShell","workbench.iconTheme":"material-icon-theme","git.autofetch":true,"cSpell.language":"en,es"}'
Set-Content -Path "$SettingsFolder\settings.json" -Value $SettingsContent -Encoding UTF8

if (Get-Command code -ErrorAction SilentlyContinue) {
    $MyExtensions = @(
        "adpyke.codesnap",
        "alefragnani.bookmarks",
        "christian-kohler.npm-intellisense",
        "christian-kohler.path-intellisense",
        "continue.continue",
        "cweijan.vscode-database-client2",
        "dbaeumer.vscode-eslint",
        "dotenv.dotenv-vscode",
        "eamodio.gitlens",
        "editorconfig.editorconfig",
        "esbenp.prettier-vscode",
        "gruntfuggly.todo-tree",
        "ms-azuretools.vscode-docker",
        "ms-playwright.playwright",
        "ms-python.python",
        "pkief.material-icon-theme",
        "rangav.vscode-thunder-client",
        "streetsidesoftware.code-spell-checker",
        "streetsidesoftware.code-spell-checker-spanish",
        "usernamehw.errorlens",
        "vitest.explorer"
    )
    foreach ($ext in $MyExtensions) {
        Write-Host "  Instalando extension: $ext..." -ForegroundColor Gray
        code --user-data-dir $VSCodeDataDir --extensions-dir $VSCodeExtDir --install-extension $ext --force | Out-Null
    }
    
    Write-Host "Abriendo VSCode con tu perfil aislado..." -ForegroundColor Green
    code --user-data-dir $VSCodeDataDir --extensions-dir $VSCodeExtDir $TargetRepoFolder
} else {
    Write-Host "Abre la carpeta $TargetRepoFolder en VSCode manualmente." -ForegroundColor Yellow
}

# --- 8. Freebuff: login + abrir en el repositorio ---
Write-Host "[8/8] Iniciando Freebuff (login la primera vez, maneja anotaciones)..." -ForegroundColor Cyan
Set-Location $TargetRepoFolder
if (!(Get-Command freebuff -ErrorAction SilentlyContinue)) {
    Write-Host "Freebuff no detectado, reintentando instalacion..." -ForegroundColor Yellow
    npm install -g freebuff --no-fund --no-audit
}
freebuff login
freebuff

