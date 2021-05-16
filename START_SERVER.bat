@echo off
title minecraft-server
echo Starting Minecraft Server...
echo Note: If you want to save and stop the server, type /stop

set DIR_NAME=%cd%
set WORLD=%DIR_NAME%\world

for /r %%i in (*.jar) do set SERVER_JAR=%%~nxi
if exist %WORLD% (
 java -Xmx1024M -Xms1024M -jar %SERVER_JAR% nogui
) else (
  echo unable to locate world folder, make sure it is in the same directory
  echo current directory: %cd%
)
pause
