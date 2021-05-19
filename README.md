Thank you for downloading!

# Minecraft Files You Can Simply Double Click On To  
## Run Your Server Or  
## Backup Your Server  

Only compatible with Windows.

Setup:
------
- Download a minecraft server .jar from the minecraft website: https://www.minecraft.net/en-us/download/server
- Paste it into a folder on your computer, can call it "Minecraft Server" folder.
- Place both .bat files in your "Minecraft Server" folder

How to Use:
-----------
**START_SERVER.bat** will start your minecraft server for you. Simply double-click on it to use. You will see a window come up, once the window says "Done!" your server is ready for use. DO NOT CLOSE if you want to keep the server up. If you want to STOP the server, type /stop and it will save and stop the server for you.

**BACKUP_SERVER.bat** by default will generate a folder for you named "SERVER_BACKUPS" if its not already there and save a backup of your server's "world" folder according to the date and time it was saved at. Simple double-click on it to use. You can click this file each time you want to save the state of your server.

Backups are saved with the filename ex. world_2021-05-19_2-02-38  
world_YYYY-MM-DD_Hour-Minute-Second  

You also have the ability to specify your own backup folder. Simply:
- create your backup folder
- copy the path to your backup folder
- upon your first time running BACKUP_SERVER.bat you will be given a prompt to type "y" or "n", type "n"
- paste your backup folder path
- a settings file will be generated, **backup_server_settings.txt** which holds your preferred backup folder path
- Note: you can also edit the contents of this file to a different folder path if you wish

How to Restore a Backup:
------------------------
Replace your "world" folder with one of the folders in SERVER_BACKUPS

For a More In-Depth Tutorial with Screenshots, visit here: https://www.shygirlgamer.com/2021/05/16/minecraft-backup-run-server/
