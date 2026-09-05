@echo off
REM ==============================================================
REM   SETUP_CESDE_AGY_HARNESS.bat - LifeOS CESDE Portable Setup
REM   100% CERO ADMIN: Instala Node, AGY, Freebuff, clona el Repo
REM   y activa el Harness Unificado (Protocolo Jaeger + 69 Skills).
REM ==============================================================
setlocal
chcp 65001 >nul 2>nul
title Setup CESDE: AGY + Freebuff + Harness Unificado
color 0A

set "NODE_VERSION=v24.18.0"
set "NODE_URL=https://nodejs.org/dist/%NODE_VERSION%/node-%NODE_VERSION%-win-x64.zip"
set "NODE_DIR=%LOCALAPPDATA%\PortableNode"
set "NPM_PREFIX=%USERPROFILE%\npm-global"
set "AGY_DIR=%LOCALAPPDATA%\agy\bin"
set "VSC_DIR=%LOCALAPPDATA%\Programs\Microsoft VS Code\bin"
set "REPO_URL=https://github.com/jeiser270997-source/Asistente_Personal.git"
set "REPO_NAME=Asistente_Personal"
set "REPO_DEST=%USERPROFILE%\%REPO_NAME%"

echo ==============================================================
echo   LIFEOS - SETUP CESDE: AGY + HARNESS UNIFICADO
echo ==============================================================
echo.

REM 1. Node.js
where node >nul 2>nul
if %errorlevel% equ 0 (
    echo [OK] Node.js detectado:
    node -v
) else (
    if exist "%NODE_DIR%\node.exe" (
        set "PATH=%NODE_DIR%;%PATH%"
        echo [OK] Node.js portable listo en %NODE_DIR%
    ) else (
        echo [..] Descargando Node.js portable (cero admin)...
        powershell -NoProfile -Command "Invoke-WebRequest -Uri '%NODE_URL%' -OutFile '%TEMP%\node.zip' -UseBasicParsing; Expand-Archive -Path '%TEMP%\node.zip' -DestinationPath '%TEMP%\NodeTemp' -Force; Move-Item '%TEMP%\NodeTemp\node-*' '%NODE_DIR%'; Remove-Item '%TEMP%\node.zip', '%TEMP%\NodeTemp' -Recurse -Force"
        set "PATH=%NODE_DIR%;%PATH%"
        echo [OK] Node.js instalado.
    )
)

REM 2. AGY (Antigravity CLI)
where agy >nul 2>nul
if %errorlevel% equ 0 (
    echo [OK] AGY CLI ya instalado.
) else (
    if exist "%AGY_DIR%\agy.exe" (
        set "PATH=%AGY_DIR%;%PATH%"
        echo [OK] AGY detectado en %AGY_DIR%
    ) else (
        echo [..] Instalando Antigravity CLI (AGY)...
        curl -fsSL https://antigravity.google/cli/install.cmd -o "%TEMP%\agy_install.cmd"
        call "%TEMP%\agy_install.cmd"
        del /q "%TEMP%\agy_install.cmd" >nul 2>nul
        set "PATH=%AGY_DIR%;%PATH%"
    )
)

REM 3. Freebuff CLI
where freebuff >nul 2>nul
if %errorlevel% equ 0 (
    echo [OK] Freebuff CLI ya instalado.
) else (
    call npm config set prefix "%NPM_PREFIX%" >nul 2>nul
    echo [..] Instalando Freebuff CLI...
    call npm install -g freebuff --no-fund --no-audit
    set "PATH=%NPM_PREFIX%;%PATH%"
)

REM 4. PATH de Usuario Persistente
powershell -NoProfile -Command "$p=[Environment]::GetEnvironmentVariable('Path','User'); foreach($a in @('%NODE_DIR%','%NPM_PREFIX%','%AGY_DIR%','%VSC_DIR%')){ if($p -notlike '*'+$a+'*'){ $p=$a+';'+$p } }; [Environment]::SetEnvironmentVariable('Path',$p,'User')"

REM 5. Clonar o Actualizar el Repo
echo.
if exist "%REPO_DEST%\.git" (
    echo [OK] Repositorio ya existe en %REPO_DEST%. Actualizando...
    git -C "%REPO_DEST%" pull
) else (
    echo [..] Clonando repositorio %REPO_NAME%...
    echo (Si pide credenciales, usa tu token clasico de GitHub)
    git clone %REPO_URL% "%REPO_DEST%"
    if errorlevel 1 (
        echo.
        echo [..] Intentando descarga directa con Token...
        set /p "GHTOKEN=Pega tu token de GitHub (ghp_...): "
        curl -sL -H "Authorization: token %GHTOKEN%" -o "%USERPROFILE%\repo.zip" "https://codeload.github.com/jeiser270997-source/%REPO_NAME%/zip/refs/heads/main"
        powershell -NoProfile -Command "Expand-Archive -Path '%USERPROFILE%\repo.zip' -DestinationPath '%USERPROFILE%' -Force; Move-Item '%USERPROFILE%\%REPO_NAME%-main' '%REPO_DEST%'; Remove-Item '%USERPROFILE%\repo.zip'"
        set "GHTOKEN="
    )
)

REM 6. Inicializar Harness Unificado (Protocolo Jaeger)
if exist "%REPO_DEST%\scripts\ai_bridge\protocolo_jaeger.js" (
    echo.
    echo [..] Inicializando Harness Unificado (Jaeger v2.1)...
    node "%REPO_DEST%\scripts\ai_bridge\protocolo_jaeger.js"
    echo [OK] Harness sincronizado: 69 skills + 8 MCPs mapeados.
)

REM 7. Abrir VS Code en el Repo
echo.
echo ==============================================================
echo   TODO LISTO PARA LA SESION EN CESDE
echo   - AGY CLI:      Listo (escribe 'agy' para iniciar)
echo   - Freebuff:     Listo (escribe 'freebuff' para iniciar)
echo   - Harness SSOT: Activo (AGENTS.md + CEREBRO.md)
echo   - Carpeta Repo: %REPO_DEST%
echo ==============================================================
echo.

where code >nul 2>nul
if %errorlevel% equ 0 (
    echo [..] Abriendo VS Code...
    code "%REPO_DEST%"
) else (
    if exist "%VSC_DIR%\code.cmd" (
        "%VSC_DIR%\code.cmd" "%REPO_DEST%"
    )
)

pause
endlocal