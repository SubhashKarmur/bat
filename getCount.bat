@echo off

set "sourcePath=C:\Users\subha\test"

if not exist "%sourcePath%\" (
    echo %sourcePath% not found.
	goto end
)

for /f "tokens=2 delims==" %%I in ('wmic os get localdatetime /format:list') do set datetime=%%I
set "datetime=%datetime:~0,8%"
echo Date: %datetime%

for /f %%i in ('forfiles /P "%sourcePath%" /M *.txt /D -0 /C "cmd /c if @isdir==FALSE echo @FILE" ^| find /c ".txt"') do set result=%%i
rem for /f %%i in ('dir %sourcePath%\*.txt /b ^| find /c ".txt"') do set result=%%i

echo %result%

:end
pause