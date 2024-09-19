@echo off
for /f "tokens=1" %%i in ('jps -l ^| find "SearchReplace.jar"') do taskkill /F /PID %%i
pause