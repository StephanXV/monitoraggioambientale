@echo off
:: ---- SETTINGS ----------------------------------------
:: db user name
set dbuser=enricomon
:: db user password
set dbpass=Qwerty15
:: db name
set dblist=monitoraggioamb
:: backup directory 
set bkupdir=C:\Users\enric\Desktop\dbBackups\files
:: db host 
set dbhost=db4free.net
:: MySQL folder
set mysqldir=C:\Program Files\MySQL\MySQL Server 5.7
:: -----------------------------------------------------
echo backing up %dblist% ...
"%mysqldir%\bin\mysqldump" --host=%dbhost% --user=%dbuser% --password=%dbpass% --databases %dblist% --opt --quote-names --allow-keywords --complete-insert > "%bkupdir%\%fn%_%dblist%.sql"
echo Done! 
