@echo off
setlocal

:: Update the source to a network UNC path (replace with your actual path)
set "source=%USERPROFILE%\Downloads\*cmis*"

:: Destination can remain local or be another network path
set "dest=%USERPROFILE%\test"

if not exist "%dest%" mkdir "%dest%"

:: This will search all subdirectories in the network location
for /f "delims=" %%i in ('dir /s /b "%source%"') do (
    copy /Y "%%i" "%dest%\"
)

echo All Files copied to "%dest%"
pause