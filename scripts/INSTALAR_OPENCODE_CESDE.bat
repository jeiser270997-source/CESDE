@echo off
REM ============================================================
REM  INSTALAR_OPENCODE_CESDE.bat  (v1 - 2026-08-29)
REM  Setup CERO ADMIN para laptops CESDE - 1 CLICK:
REM    1. Node.js portable si falta (sin admin)
REM    2. OpenCode CLI (opencode-ai) - SKIP si ya instalado
REM    3. Configura Muse Spark 1.2 free en xhigh (sin login)
REM    4. Crea carpeta Jeiser junto al .bat y clona repo con token
REM    5. PATH usuario persistente
REM    6. Abre OpenCode directo en el repo
REM
REM  VENTAJA vs AGY/Freebuff: OpenCode NO pide login navegador,
REM  arranca directo con modelo free. 1 click y listo.
REM
REM  SEGURIDAD: token se pide en memoria, nunca se graba en .bat
REM ============================================================
setlocal
chcp 65001 >nul 2>nul
title Setup CESDE: OpenCode + Muse Spark 1.2 free (Cero Admin)
color 0A

set "NODE_VERSION=v24.18.0"
set "NODE_URL=https://nodejs.org/dist/%NODE_VERSION%/node-%NODE_VERSION%-win-x64.zip"
set "NODE_DIR=%LOCALAPPDATA%\PortableNode"
set "NPM_PREFIX=%USERPROFILE%\npm-global"
set "REPO_URL=https://github.com/jeiser270997-source/Asistente_Personal.git"
set "REPO_NAME=Asistente_Personal"
REM Carpeta Jeiser en la RAIZ donde esta el .bat (Desktop\Jeiser si el bat esta en Desktop)
set "BAT_DIR=%~dp0"
REM quita \ final
if "%BAT_DIR:~-1%"=="\" set "BAT_DIR=%BAT_DIR:~0,-1%"
set "REPO_DEST=%BAT_DIR%\Jeiser\%REPO_NAME%"
set "OPENCODE_CONFIG_DIR=%USERPROFILE%\.config\opencode"
set "OPENCODE_CONFIG=%OPENCODE_CONFIG_DIR%\opencode.json"

echo ==============================================================
echo   SETUP CESDE: OPENCODE + MUSE SPARK 1.2 FREE (1 CLICK)
echo   Sin login - Modelo free xhigh - Repo en .\Jeiser\
echo ==============================================================
echo.
echo Bat en: %BAT_DIR%
echo Destino: %REPO_DEST%
echo.

REM ---------- 1. Node.js ----------
where node >nul 2>nul && for /f "tokens=1 delims=v." %%A in ('node -v') do if %%A GEQ 18 goto node_ok
echo [..] Node.js portable...
if exist "%NODE_DIR%\node.exe" goto node_portable_ready
echo [..] Descargando Node.js portable...
powershell -NoProfile -Command "try { Invoke-WebRequest -Uri '%NODE_URL%' -OutFile '%TEMP%\node-portable.zip' -UseBasicParsing; exit 0 } catch { exit 1 }"
if errorlevel 1 goto fail_node
powershell -NoProfile -Command "Expand-Archive -Path '%TEMP%\node-portable.zip' -DestinationPath '%TEMP%\NodeTemp' -Force"
if not exist "%TEMP%\NodeTemp\node-%NODE_VERSION%-win-x64\node.exe" goto fail_node
if not exist "%NODE_DIR%" mkdir "%NODE_DIR%"
xcopy /e /q /y "%TEMP%\NodeTemp\node-%NODE_VERSION%-win-x64\*" "%NODE_DIR%\" >nul
del /q "%TEMP%\node-portable.zip" >nul 2>nul
rmdir /s /q "%TEMP%\NodeTemp" >nul 2>nul
:node_portable_ready
set "PATH=%NODE_DIR%;%PATH%"
:node_ok
call node -v
echo [OK] Node listo.

REM ---------- 2. OpenCode CLI ----------
where opencode >nul 2>nul
if %errorlevel% equ 0 (
    echo [OK] OpenCode YA instalado. Omitido.
    goto opencode_config
)
call npm config set prefix "%NPM_PREFIX%" >nul 2>nul
echo [..] Instalando OpenCode (1 min)...
call npm install -g opencode-ai --no-fund --no-audit
if errorlevel 1 (
    echo [WARN] Fallo npm opencode. Revisa internet.
    goto opencode_config
)
echo [OK] OpenCode instalado.
set "PATH=%NPM_PREFIX%;%NODE_DIR%;%PATH%"

:opencode_config
REM ---------- 3. Configurar Muse Spark 1.2 free xhigh ----------
if not exist "%OPENCODE_CONFIG_DIR%" mkdir "%OPENCODE_CONFIG_DIR%"
echo [..] Configurando Muse Spark 1.2 free (xhigh)...
REM Crea opencode.json con modelo free contributor si no existe o lo actualiza
powershell -NoProfile -Command ^
  "$cfg='%OPENCODE_CONFIG%'; $dir='%OPENCODE_CONFIG_DIR%'; if(!(Test-Path $dir)){New-Item -ItemType Directory -Path $dir -Force|Out-Null}; $json=@{model='opencode/muse-spark-1.2-contributor-free';permission=@{read='allow';edit='allow';write='allow';glob='allow';grep='allow';list='allow';bash='allow';terminal='allow';task='allow';lsp='allow';doom_loop='allow';skill='allow';todowrite='allow';todoread='allow';question='allow';webfetch='allow';websearch='allow';browser='allow';external_directory='allow';subagent='allow';mcp='allow'}}; $json | ConvertTo-Json -Depth 5 | Set-Content -Path $cfg -Encoding UTF8; Write-Host '[OK] opencode.json ->' $cfg"
if exist "%OPENCODE_CONFIG%" echo [OK] Configurada.

REM ---------- 4. PATH persistente ----------
powershell -NoProfile -Command "$p=[Environment]::GetEnvironmentVariable('Path','User'); if(-not $p){$p=''}; foreach($a in @('%NODE_DIR%','%NPM_PREFIX%')){ if($p -notlike '*'+$a+'*'){ $p=$a+';'+$p } }; [Environment]::SetEnvironmentVariable('Path',$p,'User')"
echo [OK] PATH usuario ok.

REM ---------- 5. Repo en .\Jeiser\ ----------
where git >nul 2>nul
if %errorlevel% neq 0 goto repo_zip
if exist "%REPO_DEST%\.git" (
    echo [OK] Repo ya existe en %REPO_DEST%. Pull...
    git -C "%REPO_DEST%" pull
    goto repo_done
)
if not exist "%BAT_DIR%\Jeiser" mkdir "%BAT_DIR%\Jeiser"
echo [..] Clonando %REPO_NAME% a %REPO_DEST% ...
git clone %REPO_URL% "%REPO_DEST%"
if not errorlevel 1 (
    echo [OK] Repo clonado.
    goto repo_done
)
echo [WARN] Clone fallo (token o internet). Intento ZIP...
:repo_zip
set "GH_TOKEN="
set /p "GH_TOKEN=Pega tu token GitHub ghp_... (solo memoria, no se guarda): "
if "%GH_TOKEN%"=="" goto repo_done
if not exist "%BAT_DIR%\Jeiser" mkdir "%BAT_DIR%\Jeiser"
echo [..] Descargando ZIP...
curl -sL -H "Authorization: token %GH_TOKEN%" -o "%TEMP%\%REPO_NAME%.zip" "https://codeload.github.com/jeiser270997-source/%REPO_NAME%/zip/refs/heads/main"
powershell -NoProfile -Command "Expand-Archive -Path '%TEMP%\%REPO_NAME%.zip' -DestinationPath '%TEMP%' -Force"
if exist "%TEMP%\%REPO_NAME%-main" (
    if not exist "%REPO_DEST%" move "%TEMP%\%REPO_NAME%-main" "%REPO_DEST%" >nul
    echo [OK] Repo extraido en %REPO_DEST%
)
del /q "%TEMP%\%REPO_NAME%.zip" >nul 2>nul
rmdir /s /q "%TEMP%\%REPO_NAME%-main" >nul 2>nul
set "GH_TOKEN="
:repo_done

REM ---------- 6. Inicializar Harness ----------
if exist "%REPO_DEST%\scripts\ai_bridge\protocolo_jaeger.js" (
    echo [..] Harness Jaeger v2.1...
    node "%REPO_DEST%\scripts\ai_bridge\protocolo_jaeger.js" >nul
    echo [OK] Harness 69 skills mapeado.
)

REM ---------- 7. Abrir OpenCode ----------
echo.
echo ==============================================================
echo   LISTO - DOBLE CLICK Y A CODIFICAR
echo   Repo: %REPO_DEST%
echo   Abre con: opencode
echo   Modelo: opencode/muse-spark-1.2-contributor-free
echo ==============================================================
echo.
where opencode >nul 2>nul
if %errorlevel% equ 0 (
    echo [..] Abriendo OpenCode en %REPO_DEST% ...
    start "" opencode "%REPO_DEST%"
) else (
    echo [WARN] opencode no en PATH. Reinicia PC o abre: %NPM_PREFIX%\opencode.cmd
)
pause
endlocal
goto :eof
:fail_node
echo [ERROR] No se pudo instalar Node.js. Revisa internet.
pause
endlocal
