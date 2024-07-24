@echo off

for /f "tokens=2 delims==" %%I in ('wmic os get localdatetime /format:list') do set datetime=%%I
set "datetime=%datetime:~0,8%"
echo Date: %datetime%

set "sourcePath=C:\Users\subha\test"
if not exist "%sourcePath%\" (
    echo %sourcePath% not found.
)
for /f %%i in ('forfiles /P "%sourcePath%" /M *.json /D -0 /C "cmd /c if @isdir==FALSE echo @FILE" ^| find /c ".json"') do set json=%%i
for /f %%i in ('forfiles /P "%sourcePath%" /M *.pdf /D -0 /C "cmd /c if @isdir==FALSE echo @FILE" ^| find /c ".pdf"') do set pdf=%%i
for /f %%i in ('forfiles /P "%sourcePath%" /M *.txt /D -0 /C "cmd /c if @isdir==FALSE echo @FILE" ^| find /c ".txt"') do set txt=%%i
rem for /f %%i in ('dir %sourcePath%\*.txt /b ^| find /c ".txt"') do set result=%%i
echo PATH: %sourcePath% JSON: %json% PDF: %pdf% TEXT: %txt%

set "sourcePath=C:\Users\subha\test2"
if not exist "%sourcePath%\" (
    echo %sourcePath% not found.
)
for /f %%i in ('forfiles /P "%sourcePath%" /M *.json /D -0 /C "cmd /c if @isdir==FALSE echo @FILE" ^| find /c ".json"') do set json=%%i
for /f %%i in ('forfiles /P "%sourcePath%" /M *.pdf /D -0 /C "cmd /c if @isdir==FALSE echo @FILE" ^| find /c ".pdf"') do set pdf=%%i
for /f %%i in ('forfiles /P "%sourcePath%" /M *.txt /D -0 /C "cmd /c if @isdir==FALSE echo @FILE" ^| find /c ".txt"') do set txt=%%i
rem for /f %%i in ('dir %sourcePath%\*.txt /b ^| find /c ".txt"') do set result=%%i
echo PATH: %sourcePath% JSON: %json% PDF: %pdf% TEXT: %txt%

pause
