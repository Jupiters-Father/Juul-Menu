@echo off
chcp 65001
:start
cls

echo  █     █░ ██░ ██      ██████  ██▓███   ▄▄▄       ███▄ ▄███▓▓█████  ██▀███  
echo ▓█░ █ ░█░▓██░ ██▒   ▒██    ▒ ▓██░  ██▒▒████▄    ▓██▒▀█▀ ██▒▓█   ▀ ▓██ ▒ ██▒
echo ▒█░ █ ░█ ▒██▀▀██░   ░ ▓██▄   ▓██░ ██▓▒▒██  ▀█▄  ▓██    ▓██░▒███   ▓██ ░▄█ ▒
echo ░█░ █ ░█ ░▓█ ░██      ▒   ██▒▒██▄█▓▒ ▒░██▄▄▄▄██ ▒██    ▒██ ▒▓█  ▄ ▒██▀▀█▄  
echo ░░██▒██▓ ░▓█▒░██▓   ▒██████▒▒▒██▒ ░  ░ ▓█   ▓██▒▒██▒   ░██▒░▒████▒░██▓ ▒██▒
echo ░ ▓░▒ ▒   ▒ ░░▒░▒   ▒ ▒▓▒ ▒ ░▒▓▒░ ░  ░ ▒▒   ▓▒█░░ ▒░   ░  ░░░ ▒░ ░░ ▒▓ ░▒▓░
echo   ▒ ░ ░   ▒ ░▒░ ░   ░ ░▒  ░ ░░▒ ░       ▒   ▒▒ ░░  ░      ░ ░ ░  ░  ░▒ ░ ▒░
echo   ░   ░   ░  ░░ ░   ░  ░  ░  ░░         ░   ▒   ░      ░      ░     ░░   ░ 
echo     ░     ░  ░  ░         ░                 ░  ░       ░      ░  ░   ░                                                                                                                        

title Webhook Tool ::By Jupiter's Father#4538 On Discord Dm For More scripts::
input f870 "Normal" "Base 64 encoded"
if %ERRORLEVEL% == 1 (
goto nhook)
if %ERRORLEVEL% == 2 (
goto bhook)
:bhook
cls
echo input the encoded webhook URL
set /p BWEBHOOK_URL=
if not exist "%homedrive%\temp\b64\" mkdir %homedrive%\temp\b64
cd %homedrive%\temp\b64\
echo %BWEBHOOK_URL% > encoded.txt
certutil -decode encoded.txt decoded.txt
set /p WEBHOOK_URL=<decoded.txt
cd %homedrive%\temp
@RD /S /Q "%homedrive%\temp\b64"
cls
input f870 "Delete" "Nuke" "alive check"
if %ERRORLEVEL% == 1 (goto del)
if %ERRORLEVEL% == 2 (goto spam)
if %ERRORLEVEL% == 2 (goto alive)
:ghook
cls
if not exist "%homedrive%\temp\githook\" mkdir %homedrive%\temp\githook
cd %homedrive%\temp\githook\
echo Enter the github gist link or Pastebin link here
set /p gistlink=
curl -o githook.txt %gistlink%
set /p WEBHOOK_URL=<githook.txt
cd %homedrive%\temp
@RD /S /Q "%homedrive%\temp\githook"
cls
echo Press 1 for Webhook delete
echo Press 2 for Webhook spam
echo Press 3 for alive check
set /p webhook=
if %webhook%==1 (goto del) else (goto g2)
:g2
if %webhook%==2 (goto spam) else (goto g3)
:g3
if %webhook%==3 (goto alive) else (goto start)
:nhook
cls
echo enter the normal webhook URL
set /p WEBHOOK_URL=
cls
input f870 "Delete" "Nuke" "alive check"
if %ERRORLEVEL% == 1 (goto del)
if %ERRORLEVEL% == 2 (goto spam)
if %ERRORLEVEL% == 2 (goto alive)
:alive
title Active?
cls
curl %WEBHOOK_URL%
timeout 2 /nobreak
echo if it says "Unknown webhook" this means the webhook has already been deleted and cannot be nuked
pause
goto start
:del
cls
title Deleting webhook
:deleting
cls
curl -X DELETE %WEBHOOK_URL%
cls
echo checking if the webhook is deleted
timeout 1 /nobreak
cls
curl %WEBHOOK_URL%
timeout 0
echo "Unknown webhook" means it worked!!
pause
goto start
:spam
title nuking hook
cls
echo enter the username
set /p user=
echo messeage to send
set /p msg=
echo how many times would you like to say this
set /p times=
echo how many times per second would you like to say this 0 = nodelay 2 is best for rate limits
set /p per=
for /L %%a in (1,1,%times%) do (
timeout %per%
curl -H "Content-Type: application/json" -d "{\"username\": \"%user%\", \"content\":\"%msg%\"}" %WEBHOOK_URL%
)
cls
echo Done spamming deleting the webhook now
timeout 3 /nobreak
curl -X DELETE %WEBHOOK_URL%
cls
echo Done! press a key to go back to start
pause
goto start