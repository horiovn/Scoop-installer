@echo off
title Scoop installer
:start
echo ------------------------------------------------
echo Unofficial scoop installer! - Made by horiovn
echo ------------------------------------------------
echo.
echo What would you like todo? (1/2)
echo 1. install scoop manager
echo 2. install extras bucket
echo.
echo If you just installed scoop and want to install extras bucket, quit this session and reopen the program!
echo.
set /p installation="> "
if %installation% EQU 1 (
goto :scoopoption
cls
)
if %installation% EQU 2 (
goto :bucket
cls
)
else (
echo Invalid option!
timeout /t 3 /nobreak
goto :start
)

:scoopoption
echo ------------------------------------------------
echo Unofficial scoop installer! - Made by horiovn
echo ------------------------------------------------
echo.
echo Would you like to install scoop package manager? (y/n)
set /p choice=">"
if %choice% EQU y (
powershell -NoProfile -Command "Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser; Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression"
powershell -Command "[System.Environment]::SetEnvironmentVariable('Path', [System.Environment]::GetEnvironmentVariable('Path', [System.EnvironmentVariableTarget]::User), [System.EnvironmentVariableTarget]::Process)"
pause
echo do you want to go back to choice menu? (y/n)
set /p choicemenu="> "
if %choicemenu% EQU y (
cls
goto :start
)
if %choicemenu% EQU n (
exit
)
else (
echo Invalid option!
timeout /t 3 /nobreak
exit 
)
if %choice% EQU n (
exit
)



:bucket
echo Would you like to add the extras bucket to scoop? (y/n)
set /p bucket=">"
if %bucket% EQU y (
goto :extrasbucket
)
else (
exit
)




:extrasbucket
powershell -command "scoop install git"
if %errorlevel% EQU 0 (
goto :nextstep
)
else (
echo couldnt install git, maybe git servers are down?
pause 
exit
)

:nextstep
powershell -command "scoop bucket add extras"
if %errorlevel% EQU 0 (
goto :bucketsuccess
)
else (
echo couldnt add extras bucket? Make sure git installed successfully
pause
exit

:bucketsuccess
echo Successfully installed Git and Extras bucket. Open cmd and type "scoop search" to list all programs to be installed!
pause
exit


