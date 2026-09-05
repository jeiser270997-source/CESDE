@echo off
TITLE Cierre de Clase CESDE - Backup y Limpieza
echo =======================================================
echo   Finalizando Dia de Clase CESDE (Backup + Limpieza)
echo =======================================================
powershell -ExecutionPolicy Bypass -File "%~dp0finalizar_dia_cesde.ps1"
pause
