:: Version 1.0.0 
:: Released 2023 september 27



@echo off
:RestartScriptAgain
setlocal enabledelayedexpansion
set "file=haswinget.txt"

:: Check if the file "haswinget.txt" exists in the script's directory, for downloading winget
if exist "%~dp0%file%" (
    goto Selector
) else (
    goto InstallWinget
)

:: Selector, do not modify
:Selector
cls 

:: for companies 
REM goto CustomZone

echo This script includes multiple types of "app packages" that you can install. Please choose one.
echo Please enter the corresponding letter that you want to have.
echo "D" - Default package, it installs all the essentials.
echo "G" - Gaming package, it installs additional launchers and useful gaming apps. 
echo "C" - Custom, primarily intended for companies, it does nothing by default.
echo "I" - A bit of a Questions and Answears section

set /p choice=Enter your choice: 

if /i "%choice%"=="D" goto HasWinget
if /i "%choice%"=="G" goto Gaming
if /i "%choice%"=="C" goto CustomZone
if /i "%choice%"=="I" goto QandA

echo Invalid choice. Please try again.
pause
goto Selector

:: Default Package
:HasWinget
cls
echo Cleaning up...
del *.appx
del *.msixbundle
del *.txt
del *.ps1
cls
echo Installing apps...
winget install Valve.Steam
winget install Google.Chrome
winget install Malwarebytes.Malwarebytes
winget install RARLab.WinRAR
:: This list might get expanded, for now this is the "default" package
goto ActualEnd

:InstallWinget
echo "Installing winget, this may take a while..."
powershell.exe -executionpolicy remotesigned -File .\winget.ps1
echo "installed" > "%~dp0%file%"
goto WhyItaintworking

:: Restart Script
:WhyItaintworking
cls
echo Successfully installed.
echo.
echo Restarting the script...
timeout /t 5 >nul
start "" "%~dp0%~nx0"
exit

:: End
:ActualEnd
cls
echo Thank you for using Syntax's Install script. This script will close in 10 seconds.
timeout /t 10 >nul
del "%~dp0%~nx0"
exit

:: Gaming section
:Gaming
cls
echo Cleaning up...
del *.appx
del *.msixbundle
del *.txt
del *.ps1
cls
echo Installing apps...
winget install Valve.Steam
winget install Opera.OperaGX
winget install Malwarebytes.Malwarebytes
winget install EpicGames.EpicGamesLauncher
winget install 7zip.7zip
winget install RARLab.WinRAR
winget install VideoLAN.VLC
winget install GIMP.GIMP
winget install OBSProject.OBSStudio
winget install Microsoft.PowerToys
winget install Discord.Discord
goto ActualEnd

:: Companies or induviduals who want to set up a custom script here be dragons!
:CustomZone
REM Nothing here
goto RestartScriptAgain

:QandA
cls    
echo Q and A:
echo.
echo Q: Why did you make this?
echo A: I am lazy to redownload all my stuff on every reset I do, mostly.
echo.
echo Q: What is this for?
echo A: It downloads useful apps. In an age where scammers advertise fake software, it's hard for a "normie" to find the "actual" legit program.
echo.
echo Q: Why is the English in some sections messed up?
echo A: Simple, my native language is not English. I am trying, okay?
echo.
echo Press Enter to go back to the main section.
pause >nul
goto RestartScriptAgain
