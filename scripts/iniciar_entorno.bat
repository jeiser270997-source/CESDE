@echo off
TITLE Entorno Portable CESDE - Jeiser
echo =======================================================
echo   Iniciando Entorno Portable CESDE (Sin permisos Admin)
echo =======================================================
powershell -ExecutionPolicy Bypass -File "%~dp0setup_cesde.ps1"
pause
