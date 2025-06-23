@echo off
:: Check for admin rights
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting Administrative Privileges...
    powershell -Command "Start-Process -FilePath '%~f0' -Verb RunAs"
    exit /b
)

cd /d "%~dp0"

title Evaluation Patch By ItzAntonis2012
:menu
cls
echo ╔══════════════════════════════════════════╗
echo ║               EvalPatch v1.1             ║
echo ╠══════════════════════════════════════════╣
echo ║  1. Windows 10 Enterprise LTSC 2019/2021 ║
echo ║  2. Windows 10 Enterprise IoT LTSC 2021  ║     
echo ║  3. Windows 11 Enterprise LTSC 2024      ║
echo ║  4. Windows 11 Enterprise IoT LTSC 2024  ║
echo ║  0. Exit                                 ║
echo ╚══════════════════════════════════════════╝
echo.
set /p choice=Select An Option: 

if "%choice%"=="1" goto OPTION1
if "%choice%"=="2" goto OPTION2
if "%choice%"=="3" goto OPTION3
if "%choice%"=="4" goto OPTION4
if "%choice%"=="5" goto OPTION5
if "%choice%"=="0" exit /b

echo Invalid choice. Try again.
pause
goto menu

:OPTION1
cls
if not exist "%~dp0EnterpriseS" if not exist "C:\Windows\System32\spp\tokens\skus\EnterpriseS" (
    echo EnterpriseS folder not found. Please Move it either on the batch directory or C:\Windows\System32\spp\tokens\skus\
    pause
    goto menu
)
cscript.exe %windir%\system32\slmgr.vbs /rilc 
cscript.exe %windir%\system32\slmgr.vbs /upk >nul 2>&1
cscript.exe %windir%\system32\slmgr.vbs /ckms >nul 2>&1
cscript.exe %windir%\system32\slmgr.vbs /cpky >nul 2>&1
cscript.exe %windir%\system32\slmgr.vbs /ipk M7XTQ-FN8P6-TTKYV-9D4CC-J462D
if exist "C:\Windows\System32\spp\tokens\skus\EnterpriseSEval" (
    call takeown /F "C:\Windows\System32\spp\tokens\skus\EnterpriseSEval" /R /D Y
    call icacls "C:\Windows\System32\spp\tokens\skus\EnterpriseSEval" /grant %username%:F /T
    call rmdir /S /Q "C:\Windows\System32\spp\tokens\skus\EnterpriseSEval"
)

if exist "C:\Windows\System32\spp\tokens\skus\IoTEnterpriseSEval" (
    call takeown /F "C:\Windows\System32\spp\tokens\skus\IoTEnterpriseSEval" /R /D Y
    call icacls "C:\Windows\System32\spp\tokens\skus\IoTEnterpriseSEval" /grant %username%:F /T
    call rmdir /S /Q "C:\Windows\System32\spp\tokens\skus\IoTEnterpriseSEval"
)
taskkill /f /im explorer.exe
start explorer.exe
echo Windows Was De-Evaluated Succesfully! You Can Go Ahead and Activate it Now.
pause
exit

:OPTION2
cls
if not exist "%~dp0EnterpriseS" if not exist "C:\Windows\System32\spp\tokens\skus\EnterpriseS" (
    echo EnterpriseS folder not found. Please Move it either on the batch directory or C:\Windows\System32\spp\tokens\skus\
    pause
    goto menu
)

if not exist "%~dp0IoTEnterpriseS" if not exist "C:\Windows\System32\spp\tokens\skus\IoTEnterpriseS" (
    echo IoTEnterpriseS folder not found. Please Move it either on the batch directory or C:\Windows\System32\spp\tokens\skus\
    pause
    goto menu
)
cscript.exe %windir%\system32\slmgr.vbs /rilc
cscript.exe %windir%\system32\slmgr.vbs /upk >nul 2>&1
cscript.exe %windir%\system32\slmgr.vbs /ckms >nul 2>&1
cscript.exe %windir%\system32\slmgr.vbs /cpky >nul 2>&1
cscript.exe %windir%\system32\slmgr.vbs /ipk QPM6N-7J2WJ-P88HH-P3YRH-YY74H
if exist "C:\Windows\System32\spp\tokens\skus\EnterpriseSEval" (
    call takeown /F "C:\Windows\System32\spp\tokens\skus\EnterpriseSEval" /R /D Y
    call icacls "C:\Windows\System32\spp\tokens\skus\EnterpriseSEval" /grant %username%:F /T
    call rmdir /S /Q "C:\Windows\System32\spp\tokens\skus\EnterpriseSEval"
)

if exist "C:\Windows\System32\spp\tokens\skus\IoTEnterpriseSEval" (
    call takeown /F "C:\Windows\System32\spp\tokens\skus\IoTEnterpriseSEval" /R /D Y
    call icacls "C:\Windows\System32\spp\tokens\skus\IoTEnterpriseSEval" /grant %username%:F /T
    call rmdir /S /Q "C:\Windows\System32\spp\tokens\skus\IoTEnterpriseSEval"
)
taskkill /f /im explorer.exe
start explorer.exe
pause
exit

:OPTION3
cls
if not exist "%~dp0EnterpriseS" if not exist "C:\Windows\System32\spp\tokens\skus\EnterpriseS" (
    echo EnterpriseS folder not found. Please Move it either on the batch directory or C:\Windows\System32\spp\tokens\skus\
    pause
    goto menu
)
cscript.exe %windir%\system32\slmgr.vbs /rilc
cscript.exe %windir%\system32\slmgr.vbs /upk >nul 2>&1
cscript.exe %windir%\system32\slmgr.vbs /ckms >nul 2>&1
cscript.exe %windir%\system32\slmgr.vbs /cpky >nul 2>&1
cscript.exe %windir%\system32\slmgr.vbs /ipk M7XTQ-FN8P6-TTKYV-9D4CC-J462D
if exist "C:\Windows\System32\spp\tokens\skus\EnterpriseSEval" (
    call takeown /F "C:\Windows\System32\spp\tokens\skus\EnterpriseSEval" /R /D Y
    call icacls "C:\Windows\System32\spp\tokens\skus\EnterpriseSEval" /grant %username%:F /T
    call rmdir /S /Q "C:\Windows\System32\spp\tokens\skus\EnterpriseSEval"
)

if exist "C:\Windows\System32\spp\tokens\skus\IoTEnterpriseSEval" (
    call takeown /F "C:\Windows\System32\spp\tokens\skus\IoTEnterpriseSEval" /R /D Y
    call icacls "C:\Windows\System32\spp\tokens\skus\IoTEnterpriseSEval" /grant %username%:F /T
    call rmdir /S /Q "C:\Windows\System32\spp\tokens\skus\IoTEnterpriseSEval"
)
taskkill /f /im explorer.exe
start explorer.exe
pause
exit

:OPTION4
cls
cls
if not exist "%~dp0EnterpriseS" if not exist "C:\Windows\System32\spp\tokens\skus\EnterpriseS" (
    echo EnterpriseS folder not found. Please Move it either on the batch directory or C:\Windows\System32\spp\tokens\skus\
    pause
    goto menu
)

if not exist "%~dp0IoTEnterpriseS" if not exist "C:\Windows\System32\spp\tokens\skus\IoTEnterpriseS" (
    echo IoTEnterpriseS folder not found. Please Move it either on the batch directory or C:\Windows\System32\spp\tokens\skus\
    pause
    goto menu
)
cscript.exe %windir%\system32\slmgr.vbs /rilc
cscript.exe %windir%\system32\slmgr.vbs /upk >nul 2>&1
cscript.exe %windir%\system32\slmgr.vbs /ckms >nul 2>&1
cscript.exe %windir%\system32\slmgr.vbs /cpky >nul 2>&1
cscript.exe %windir%\system32\slmgr.vbs /ipk KBN8V-HFGQ4-MGXVD-347P6-PDQGT
if exist "C:\Windows\System32\spp\tokens\skus\EnterpriseSEval" (
    call takeown /F "C:\Windows\System32\spp\tokens\skus\EnterpriseSEval" /R /D Y
    call icacls "C:\Windows\System32\spp\tokens\skus\EnterpriseSEval" /grant %username%:F /T
    call rmdir /S /Q "C:\Windows\System32\spp\tokens\skus\EnterpriseSEval"
)

if exist "C:\Windows\System32\spp\tokens\skus\IoTEnterpriseSEval" (
    call takeown /F "C:\Windows\System32\spp\tokens\skus\IoTEnterpriseSEval" /R /D Y
    call icacls "C:\Windows\System32\spp\tokens\skus\IoTEnterpriseSEval" /grant %username%:F /T
    call rmdir /S /Q "C:\Windows\System32\spp\tokens\skus\IoTEnterpriseSEval"
)
taskkill /f /im explorer.exe
start explorer.exe
pause
exit


