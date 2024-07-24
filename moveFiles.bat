@echo off

set "sourcePath=C:\Users\subha\test"
set "destinationPath=C:\Users\subha\test2"

for /f "tokens=2 delims==" %%I in ('wmic os get localdatetime /format:list') do set datetime=%%I
set "datetime=%datetime:~0,8%" 
echo Date: %datetime%

if not exist "%sourcePath%\" (
    echo %sourcePath% not found.
	goto end
)
if exist "%destinationPath%\" (
	if not exist "%destinationPath%\%datetime%\" (
		echo %destinationPath%\%datetime% not found.
		mkdir %destinationPath%\%datetime%
		echo %destinationPath%\%datetime% created.
	)
	forfiles /P "%sourcePath%" /M *.txt /D -2 /C "cmd /c if @isdir==FALSE move @FILE "%destinationPath%\%datetime%""
	rem	echo files moved successfully to %destinationPath%\%datetime%.
) else (
    echo %destinationPath% not found.
)
:end
pause