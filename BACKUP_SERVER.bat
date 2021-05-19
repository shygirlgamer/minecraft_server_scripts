@echo off
if not defined in_subprocess (cmd /k set in_subprocess=y ^& %0 %*) & exit )

:start
title Minecraft Server Backup Script
echo Starting Backup Script! Make sure this script is located in the minecraft server directory
echo .

set DIR_NAME=%cd%
set DEFAULT_FOLDER=%DIR_NAME%\SERVER_BACKUPS
set SETTINGS_FILE=%DIR_NAME%\backup_server_settings.txt

if exist %SETTINGS_FILE% (
 goto existingfile
) else (
 goto userchoice
)

:existingfile
echo .
echo Grabbing Previously Specified Backup Folder from backup_server_settings.txt 
set /p STORED_FILE=<%SETTINGS_FILE%
echo %STORED_FILE%
if exist %STORED_FILE% (
 goto backup
) else (
 echo .
 echo .
 echo Oops! looks like the original backup folder no longer exists
 echo Please check if the value in backup_server_settings.txt is correct
 echo Or simply delete backup_server_settings.txt to set it again
 goto end
)

:userchoice
set choice=
echo %DEFAULT_FOLDER%
echo .
set /p choice=Are you ok with saving backups to the above default path? (y/n): 
if '%choice%'=='y' goto backup
if '%choice%'=='n' goto :newfolder
echo %choice% is not valid, try again
goto userchoice

:newfolder
echo .
echo Please enter the full path to your preferred folder
set /p NEW_FOLDER=Make sure not to add any extra spaces:
if exist %NEW_FOLDER% (
 echo .
echo ***********************************************************************
 echo Saving Preferred Folder Path Setting to 
 echo %DIR_NAME%\backup_server_settings.txt
 echo NOTE: you can modify this txt file to update your path as well for next time
echo ***********************************************************************
 echo .
 echo %NEW_FOLDER%>backup_server_settings.txt
 echo New backup folder is set to %NEW_FOLDER%
) else (
 echo Please make sure the folder path exists
 goto newfolder
)

:backup
if defined NEW_FOLDER (
 set BACKUP_FOLDER=%NEW_FOLDER%
) else (
 if defined STORED_FILE (
  set BACKUP_FOLDER=%STORED_FILE%
 ) else (
  set BACKUP_FOLDER=%DEFAULT_FOLDER%
 )
)
echo.
echo backing up to folder...
set DATE=%BACKUP_FOLDER%\world_%date:/=%
pause
set WORLD=%DIR_NAME%\world
set TIME=%time: =%
set DATETIME=%DATE%_%TIME::=-%
set INPUT_TO=%DATETIME:~0,-6%
echo .
echo backing up with filename: %INPUT_TO%
if exist %WORLD% (
 if not exist %BACKUP_FOLDER% (
  mkdir %BACKUP_FOLDER%
 )
 mkdir %INPUT_TO%
 xcopy "world" %INPUT_TO% /E /Y /F
echo .
 echo backed up to %INPUT_TO%
) else (
echo .
 echo no world folder found, make sure this file is in the minecraft server directory.
)
:end
pause
