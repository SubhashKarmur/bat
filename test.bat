@echo off

set "sourcePath=C:\Users\subha"

set "myValues=test test2 test3"

for /f "tokens=2 delims==" %%I in ('wmic os get localdatetime /format:list') do set datetime=%%I
set "datetime=%datetime:~0,8%"
echo Date: %datetime%

for %%x in (%myValues%) do (
	if exist "%sourcePath%\%%x\" (
		for /f %%i in ('forfiles /P "%sourcePath%\%%x" /M *.txt /D -0 /C "cmd /c if @isdir==FALSE echo @FILE" ^| find /c ".txt"') do set result=%%i
		rem echo forfiles /P "%sourcePath%\%%x" /M *.txt /D -0 /C "cmd /c if @isdir==FALSE echo @FILE" ^| find /c ".txt"
		rem for /f %%i in ('dir %sourcePath%\*.txt /b ^| find /c ".txt"') do set result=%%i
		echo %result%
		
	) else (
		rem echo %sourcePath%\%%x not found.	
		echo 0
	)
)
:end
pause