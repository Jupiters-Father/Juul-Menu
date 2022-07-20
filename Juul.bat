@echo off
title Juul
:load
dwrite "Welcome To The Juul Menu" 100
cls 
goto :main
:main
mode 25,5
input f870 "DoS" "Webhook Tool" "YT" "OISNT" "Github Repo"
if %ERRORLEVEL% == 1 (start GeoDoS.bat && cls && goto :main)
if %ERRORLEVEL% == 2 (start wt.bat && cls && goto :main)
if %ERRORLEVEL% == 3 (start www.youtube.com && cls && goto :main)
if %ERRORLEVEL% == 4 (start https://osintframework.com/ && cls && goto :main)
if %ERRORLEVEL% == 5 (start https://github.com/Jupiters-Father/Juul-Menu && cls && goto :main )
