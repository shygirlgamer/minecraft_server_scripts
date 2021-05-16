@echo off
title Minecraft Server Backup Script
echo Starting Backup Script! Make sure this script is located in the minecraft server directory

set DIR_NAME=%cd%
set BACKUP_FOLDER=%DIR_NAME%\SERVER_BACKUPS
set DATE=%BACKUP_FOLDER%\world_%date:/=%
set WORLD=%DIR_NAME%\world
set TIME=%time: =%
set DATETIME=%DATE%_%TIME::=-%
set INPUT_TO=%DATETIME:~0,-6%

echo %INPUT_TO%

if exist %WORLD% (
 if not exist %BACKUP_FOLDER% (
  mkdir %BACKUP_FOLDER%
 )
 mkdir %INPUT_TO%
 xcopy "world" %INPUT_TO% /E /Y /F
 echo backed up to %INPUT_TO%
) else (
 echo no world folder found, make sure this file is in the minecraft server directory.
)