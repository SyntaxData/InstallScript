@echo off
setlocal enabledelayedexpansion

echo This script is ONLY made for Windows 10 1709 (build 16299) or later. It won't work on any lower builds.
echo Are you sure you want to continue? Press Ctrl + C to exit.

pause

:: Define variables
set "githubRepoUrl=https://github.com/SyntaxData/InstallScript/releases/download/Zip/update.zip"  REM Replace with your GitHub repository URL
set "zipFileName=update.zip"  REM Replace with the desired name for the downloaded ZIP file
set "extractPath=."  REM Replace with the path where you want to extract the ZIP file
set "batchFilePath=%extractPath%\run.bat"  REM Replace with the path to your start.bat file

:: Download the ZIP file from GitHub
curl -LJO "%githubRepoUrl%"

:: Check if the ZIP file was downloaded successfully
if %errorlevel% neq 0 (
    echo Failed to download files. Please try again.
    pause
    exit /b 1
)

:: Extract the contents of the ZIP file
powershell -command "Expand-Archive -Path '%zipFileName%' -DestinationPath '%extractPath%'"

:: Run the start.bat file
if exist "%batchFilePath%" (
    cls
    call "%batchFilePath%"
) else (
    echo start.bat file not found at %batchFilePath%.
    pause
    exit /b 1
)

:: Clean up the downloaded ZIP file (optional)
del "%zipFileName%"

:: Exit the script
exit /b 0
