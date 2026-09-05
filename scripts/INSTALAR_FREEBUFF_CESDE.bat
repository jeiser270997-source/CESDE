@echo off
REM ============================================================
REM  INSTALAR_FREEBUFF_CESDE.bat  (v3 - 2026-08-15)
REM  Setup CERO ADMIN para laptops CESDE (VS Code VIRGEN):
REM    1. Node.js portable si falta
REM    2. Freebuff CLI (SKIP si ya instalado)
REM    3. AGY / Antigravity CLI (SKIP si ya instalado)
REM    4. PATH de USUARIO (persistente, sin admin)
REM    5. Descarga del repo (git clone con GCM, o ZIP con token)
REM    6. VS Code (instala User Setup si no existe) + perfil
REM       "CESDE-LifeOS" + TODAS las extensiones automaticamente
REM
REM  SEGURIDAD: el token de GitHub se pega en TIEMPO DE EJECUCION,
REM  nunca queda grabado en este archivo ni en el repo.
REM ============================================================
setlocal
chcp 65001 >nul 2>nul
title Setup CESDE: Freebuff + AGY + VS Code + Repo (Cero Admin)
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
echo   SETUP CESDE: FREEBUFF + AGY + VS CODE + REPO  (CERO ADMIN)
echo ==============================================================
echo.

REM ---------- 1. Node.js (solo si falta o es viejo) ----------
set "HAVE_NODE=0"
where node >nul 2>nul && for /f "tokens=1 delims=v." %%A in ('node -v') do (
    if %%A GEQ 18 set "HAVE_NODE=1"
)
if "%HAVE_NODE%"=="1" (
    echo [OK] Node.js detectado:
    call node -v
    goto node_ok
)
echo [..] Node.js no encontrado o viejo. Buscando portable...
if exist "%NODE_DIR%\node.exe" goto node_portable_ready
echo [..] Descargando Node.js portable (1-2 min)...
powershell -NoProfile -Command "try { Invoke-WebRequest -Uri '%NODE_URL%' -OutFile '%TEMP%\node-portable.zip' -UseBasicParsing; exit 0 } catch { exit 1 }"
if errorlevel 1 goto fail_download
powershell -NoProfile -Command "Expand-Archive -Path '%TEMP%\node-portable.zip' -DestinationPath '%TEMP%\NodeTemp' -Force"
if not exist "%TEMP%\NodeTemp\node-%NODE_VERSION%-win-x64\node.exe" goto fail_download
if not exist "%NODE_DIR%" mkdir "%NODE_DIR%"
xcopy /e /q /y "%TEMP%\NodeTemp\node-%NODE_VERSION%-win-x64\*" "%NODE_DIR%\" >nul
del /q "%TEMP%\node-portable.zip" >nul 2>nul
rmdir /s /q "%TEMP%\NodeTemp" >nul 2>nul
:node_portable_ready
set "PATH=%NODE_DIR%;%PATH%"
echo [OK] Node.js portable listo en %NODE_DIR%
call node -v
:node_ok

REM ---------- 2. Freebuff (SKIP si ya instalado) ----------
where freebuff >nul 2>nul
if %errorlevel% equ 0 (
    echo [OK] Freebuff YA instalado. Omitido.
) else (
    call npm config set prefix "%NPM_PREFIX%" >nul 2>nul
    echo [..] Instalando Freebuff CLI (1-2 min)...
    call npm install -g freebuff --no-fund --no-audit
    if errorlevel 1 (
        echo [WARN] Fallo la instalacion de Freebuff. Revisa internet.
    ) else (
        echo [OK] Freebuff instalado.
    )
)

REM ---------- 3. AGY / Antigravity CLI (SKIP si ya instalado) ----------
where agy >nul 2>nul
if %errorlevel% equ 0 (
    echo [OK] AGY YA instalado. Omitido.
) else (
    if exist "%AGY_DIR%\agy.exe" (
        echo [OK] AGY ya existe en %AGY_DIR%. Omitido.
        goto agy_ok
    )
    echo [..] Instalando AGY (Antigravity CLI)...
    curl -fsSL https://antigravity.google/cli/install.cmd -o "%TEMP%\agy_install.cmd"
    if errorlevel 1 (
        echo [WARN] No se pudo descargar el instalador de AGY. Revisa internet.
    ) else (
        call "%TEMP%\agy_install.cmd"
        del /q "%TEMP%\agy_install.cmd" >nul 2>nul
    )
    if exist "%AGY_DIR%\agy.exe" (
        echo [OK] AGY instalado en %AGY_DIR%
    ) else (
        echo [WARN] AGY no confirmado (luego: curl -fsSL https://antigravity.google/cli/install.cmd -o i.cmd ^&^& i.cmd)
    )
)
:agy_ok
set "PATH=%AGY_DIR%;%NPM_PREFIX%;%NODE_DIR%;%PATH%"

REM ---------- 4. PATH permanente de USUARIO (sin admin) ----------
powershell -NoProfile -Command "$p=[Environment]::GetEnvironmentVariable('Path','User'); if(-not $p){$p=''}; foreach($add in @('%NODE_DIR%','%NPM_PREFIX%','%AGY_DIR%')){ if($p -notlike '*'+$add+'*'){ $p=$add+';'+$p } }; [Environment]::SetEnvironmentVariable('Path',$p,'User')"
echo [OK] PATH de usuario actualizado (persistente).

REM ---------- 5. Repo ----------
where git >nul 2>nul
if %errorlevel% neq 0 (
    echo [..] Git no instalado. Usare descarga ZIP con token.
    goto repo_zip
)
if exist "%REPO_DEST%\.git" (
    echo [OK] Repo ya existe en %REPO_DEST%. Actualizando...
    git -C "%REPO_DEST%" pull
    goto repo_done
)
echo [..] Clonando %REPO_NAME% (privado, requiere tu token)...
echo.
echo    Cuando Git pida credenciales:
echo      Username:  tu token de GitHub (o el nombre de usuario)
echo      Password:  el token de GitHub
echo    Git Credential Manager lo guarda seguro (Windows Credential Manager).
echo.
git clone %REPO_URL% "%REPO_DEST%"
if errorlevel 1 (
    echo [WARN] El clone fallo (token invalido o sin internet). Intento ZIP...
    goto repo_zip
)
echo [OK] Repo clonado en %REPO_DEST%
goto repo_done

:repo_zip
set "GH_TOKEN="
set /p "GH_TOKEN=Pega aqui tu token de GitHub (solo se usa en memoria): "
if "%GH_TOKEN%"=="" (
    echo [WARN] Sin token. Repo no descargado.
    goto repo_done
)
echo [..] Descargando ZIP de %REPO_NAME% con el token...
curl -sL -H "Authorization: token %GH_TOKEN%" -o "%USERPROFILE%\%REPO_NAME%.zip" "https://codeload.github.com/jeiser270997-source/%REPO_NAME%/zip/refs/heads/main"
if not exist "%USERPROFILE%\%REPO_NAME%.zip" (
    echo [WARN] Descarga fallo. Token invalido o sin acceso.
    set "GH_TOKEN="
    goto repo_done
)
powershell -NoProfile -Command "Expand-Archive -Path '%USERPROFILE%\%REPO_NAME%.zip' -DestinationPath '%USERPROFILE%' -Force"
if exist "%USERPROFILE%\%REPO_NAME%-main" (
    if not exist "%REPO_DEST%" ren "%USERPROFILE%\%REPO_NAME%-main" "%REPO_NAME%"
    echo [OK] Repo extraido en %REPO_DEST% (sin .git: no podras hacer push desde el ZIP).
) else (
    echo [WARN] Extraccion no confirmada. Revisa %USERPROFILE%\%REPO_NAME%.zip
)
del /q "%USERPROFILE%\%REPO_NAME%.zip" >nul 2>nul
set "GH_TOKEN="
:repo_done

REM ---------- 6. VS Code (VIRGEN: instalar si falta) + perfil + extensiones ----------
where code >nul 2>nul
if %errorlevel% neq 0 (
    if not exist "%VSC_DIR%\code.cmd" (
        echo [..] VS Code no encontrado. Descargando instalador USER (sin admin)...
        curl -fsSL -L "https://update.code.visualstudio.com/latest/win32-x64-user/stable" -o "%TEMP%\vscode_setup.exe"
        if errorlevel 1 (
            echo [WARN] No se pudo descargar VS Code. Revisa internet.
            goto vscode_skip
        )
        "%TEMP%\vscode_setup.exe" /VERYSILENT /NORESTART /MERGETASKS=!runcode
        del /q "%TEMP%\vscode_setup.exe" >nul 2>nul
    )
    if exist "%VSC_DIR%\code.cmd" (
        set "PATH=%VSC_DIR%;%PATH%"
        echo [OK] VS Code user instalado en espacio de usuario.
    ) else (
        echo [WARN] VS Code no confirmado. Instalalo manualmente desde code.visualstudio.com
        goto vscode_skip
    )
) else (
    echo [OK] VS Code detectado.
)

set "EXT_LIST=%REPO_DEST%\data\config\vscode_extensions.txt"
if not exist "%EXT_LIST%" (
    echo [WARN] No se encontro la lista de extensiones en el repo: %EXT_LIST%
    goto vscode_skip
)
echo [..] Creando perfil "CESDE-LifeOS" e instalando TODAS las extensiones (puede tardar varios minutos)...
powershell -NoProfile -Command "Get-Content '%EXT_LIST%' | ForEach-Object { code --profile 'CESDE-LifeOS' --install-extension $_ }"
echo [OK] Perfil "CESDE-LifeOS" creado con todas las extensiones.
:vscode_skip

REM ---------- 7. Resumen ----------
echo.
echo ==============================================================
echo   LISTO!
echo   - Freebuff:  freebuff login   (primera vez)  luego: freebuff
echo   - AGY:       agy              (abre navegador para login)
echo   - VS Code:   code --profile "CESDE-LifeOS" .
echo   - Repo:      cd "%REPO_DEST%"
echo ==============================================================
echo.
pause
endlocal
