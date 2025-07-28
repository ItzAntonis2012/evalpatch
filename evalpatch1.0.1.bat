@echo off
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
echo ║             EvalPatch v1.0.1             ║
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
if "%choice%"=="0" exit /b

echo Invalid choice. Try again.
pause
goto menu

:OPTION1
cls
>nul cscript || (
    echo(Enabling CSCRIPT ...
    set "defaultDisabled=0" 
    reg delete "HKCU\SOFTWARE\Microsoft\Windows Script Host\Settings" /v "Enabled" /f
    reg delete "HKLM\SOFTWARE\Microsoft\Windows Script Host\Settings" /v "Enabled" /f
)
if not exist "%~dp0Windows 10 Enterprise LTSC 2019,2021\EnterpriseS" (
    echo Folder "EnterpriseS" not found in: "(Batch Directory)\Windows 10 Enterprise LTSC 2019,2021"
    pause
    goto menu
)

if not exist "%~dp0Windows 10 Enterprise LTSC 2019,2021\csvlk-pack" (
    echo Folder "csvlk-pack" not found in: "%~dp0Windows 10 Enterprise LTSC 2019,2021"
    pause
    goto menu
)
if exist "C:\Windows\System32\spp\tokens\skus\EnterpriseS" (
    call takeown /F "C:\Windows\System32\spp\tokens\skus\EnterpriseS" /R /D Y
    call icacls "C:\Windows\System32\spp\tokens\skus\EnterpriseS" /grant %username%:F /T
    call rmdir /S /Q "C:\Windows\System32\spp\tokens\skus\EnterpriseS"
)
if exist "C:\Windows\System32\spp\tokens\skus\csvlk-pack" (
    call takeown /F "C:\Windows\System32\spp\tokens\skus\csvlk-pack" /R /D Y
    call icacls "C:\Windows\System32\spp\tokens\skus\csvlk-pack" /grant %username%:F /T
    call rmdir /S /Q "C:\Windows\System32\spp\tokens\skus\csvlk-pack"
)
xcopy "%~dp0Windows 10 Enterprise LTSC 2019,2021\EnterpriseS\*" "C:\Windows\System32\spp\tokens\skus\EnterpriseS\" /E /H /C /I /Y /Z
xcopy "%~dp0Windows 10 Enterprise LTSC 2019,2021\csvlk-pack\*" "C:\Windows\System32\spp\tokens\skus\csvlk-pack\" /E /H /C /I /Y /Z
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
if defined defaultDisabled if "%defaultDisabled%"=="0" (
    echo(Disabling CSCRIPT ... 
    reg add "HKCU\Software\Microsoft\Windows Script Host\Settings" /v "Enabled" /t REG_DWORD /d "0" /f
    reg add "HKLM\Software\Microsoft\Windows Script Host\Settings" /v "Enabled" /t REG_DWORD /d "0" /f
)
pause
exit /b

:OPTION2
cls
>nul cscript || (
    echo(Enabling CSCRIPT ...
    set "defaultDisabled=0" 
    reg delete "HKCU\SOFTWARE\Microsoft\Windows Script Host\Settings" /v "Enabled" /f
    reg delete "HKLM\SOFTWARE\Microsoft\Windows Script Host\Settings" /v "Enabled" /f
)
if not exist "%~dp0Windows 10 Enterprise IoT LTSC 2021\IoTEnterpriseS" (
    echo Folder "IoTEnterpriseS" not found in: "(Batch Directory)\Windows 10 Enterprise IoT LTSC 2021"
    pause
    goto menu
)

if not exist "%~dp0Windows 10 Enterprise IoT LTSC 2021\csvlk-pack" (
    echo Folder "csvlk-pack" not found in: "(Batch Directory)\Windows 10 Enterprise IoT LTSC 2021"
    pause
    goto menu
)
if exist "C:\Windows\System32\spp\tokens\skus\IoTEnterpriseS" (
    call takeown /F "C:\Windows\System32\spp\tokens\skus\IoTEnterpriseS" /R /D Y
    call icacls "C:\Windows\System32\spp\tokens\skus\IoTEnterpriseS" /grant %username%:F /T
    call rmdir /S /Q "C:\Windows\System32\spp\tokens\skus\IoTEnterpriseS"
)
if exist "C:\Windows\System32\spp\tokens\skus\csvlk-pack" (
    call takeown /F "C:\Windows\System32\spp\tokens\skus\csvlk-pack" /R /D Y
    call icacls "C:\Windows\System32\spp\tokens\skus\csvlk-pack" /grant %username%:F /T
    call rmdir /S /Q "C:\Windows\System32\spp\tokens\skus\csvlk-pack"
)
xcopy "%~dp0Windows 10 Enterprise IoT LTSC 2021\IoTEnterpriseS\*" "C:\Windows\System32\spp\tokens\skus\IoTEnterpriseS\" /E /H /C /I /Y /Z
xcopy "%~dp0Windows 10 Enterprise IoT LTSC 2021\csvlk-pack\*" "C:\Windows\System32\spp\tokens\skus\csvlk-pack\" /E /H /C /I /Y /Z
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
echo Windows Was De-Evaluated Succesfully! You Can Go Ahead and Activate it Now.
if defined defaultDisabled if "%defaultDisabled%"=="0" (
    echo(Disabling CSCRIPT ... 
    reg add "HKCU\Software\Microsoft\Windows Script Host\Settings" /v "Enabled" /t REG_DWORD /d "0" /f
    reg add "HKLM\Software\Microsoft\Windows Script Host\Settings" /v "Enabled" /t REG_DWORD /d "0" /f
)
pause
exit /b

:OPTION3
cls
>nul cscript || (
    echo(Enabling CSCRIPT ...
    set "defaultDisabled=0" 
    reg delete "HKCU\SOFTWARE\Microsoft\Windows Script Host\Settings" /v "Enabled" /f
    reg delete "HKLM\SOFTWARE\Microsoft\Windows Script Host\Settings" /v "Enabled" /f
)
if not exist "%~dp0Windows 11 Enterprise LTSC,IoT LTSC 2024\EnterpriseS" (
    echo Folder "EnterpriseS" not found in: "(Batch Directory)\Windows 11 Enterprise LTSC,IoT LTSC 2024"
    pause
    goto menu
)

if not exist "%~dp0Windows 11 Enterprise LTSC,IoT LTSC 2024\csvlk-pack" (
    echo Folder "csvlk-pack" not found in: "(Batch Directory)\Windows 11 Enterprise LTSC,IoT LTSC 2024"
    pause
    goto menu
)
if exist "C:\Windows\System32\spp\tokens\skus\EnterpriseS" (
    call takeown /F "C:\Windows\System32\spp\tokens\skus\EnterpriseS" /R /D Y
    call icacls "C:\Windows\System32\spp\tokens\skus\EnterpriseS" /grant %username%:F /T
    call rmdir /S /Q "C:\Windows\System32\spp\tokens\skus\EnterpriseS"
)
if exist "C:\Windows\System32\spp\tokens\skus\csvlk-pack" (
    call takeown /F "C:\Windows\System32\spp\tokens\skus\csvlk-pack" /R /D Y
    call icacls "C:\Windows\System32\spp\tokens\skus\csvlk-pack" /grant %username%:F /T
    call rmdir /S /Q "C:\Windows\System32\spp\tokens\skus\csvlk-pack"
)
xcopy "%~dp0Windows 11 Enterprise LTSC,IoT LTSC 2024\EnterpriseS\*" "C:\Windows\System32\spp\tokens\skus\EnterpriseS\" /E /H /C /I /Y /Z
xcopy "%~dp0Windows 11 Enterprise LTSC,IoT LTSC 2024\csvlk-pack\*" "C:\Windows\System32\spp\tokens\skus\csvlk-pack\" /E /H /C /I /Y /Z
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
if defined defaultDisabled if "%defaultDisabled%"=="0" (
    echo(Disabling CSCRIPT ... 
    reg add "HKCU\Software\Microsoft\Windows Script Host\Settings" /v "Enabled" /t REG_DWORD /d "0" /f
    reg add "HKLM\Software\Microsoft\Windows Script Host\Settings" /v "Enabled" /t REG_DWORD /d "0" /f
)
pause
exit /b

:OPTION4
cls
>nul cscript || (
    echo(Enabling CSCRIPT ...
    set "defaultDisabled=0" 
    reg delete "HKCU\SOFTWARE\Microsoft\Windows Script Host\Settings" /v "Enabled" /f
    reg delete "HKLM\SOFTWARE\Microsoft\Windows Script Host\Settings" /v "Enabled" /f
)
if not exist "%~dp0Windows 11 Enterprise LTSC,IoT LTSC 2024\IoTEnterpriseS" (
    echo Folder "IoTEnterpriseS" not found in: "(Batch Directory)\Windows 11 Enterprise LTSC,IoT LTSC 2024"
    pause
    goto menu
)

if not exist "%~dp0Windows 11 Enterprise LTSC,IoT LTSC 2024\csvlk-pack" (
    echo Folder "csvlk-pack" not found in: "(Batch Directory)\Windows 11 Enterprise LTSC,IoT LTSC 2024"
    pause
    goto menu
)
if exist "C:\Windows\System32\spp\tokens\skus\IoTEnterpriseS" (
    call takeown /F "C:\Windows\System32\spp\tokens\skus\IoTEnterpriseS" /R /D Y
    call icacls "C:\Windows\System32\spp\tokens\skus\IoTEnterpriseS" /grant %username%:F /T
    call rmdir /S /Q "C:\Windows\System32\spp\tokens\skus\IoTEnterpriseS"
)
if exist "C:\Windows\System32\spp\tokens\skus\csvlk-pack" (
    call takeown /F "C:\Windows\System32\spp\tokens\skus\csvlk-pack" /R /D Y
    call icacls "C:\Windows\System32\spp\tokens\skus\csvlk-pack" /grant %username%:F /T
    call rmdir /S /Q "C:\Windows\System32\spp\tokens\skus\csvlk-pack"
)
xcopy "%~dp0Windows 11 Enterprise LTSC,IoT LTSC 2024\IoTEnterpriseS\*" "C:\Windows\System32\spp\tokens\skus\IoTEnterpriseS\" /E /H /C /I /Y /Z
xcopy "%~dp0Windows 11 Enterprise LTSC,IoT LTSC 2024\csvlk-pack\*" "C:\Windows\System32\spp\tokens\skus\csvlk-pack\" /E /H /C /I /Y /Z
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
echo Windows Was De-Evaluated Succesfully! You Can Go Ahead and Activate it Now.
if defined defaultDisabled if "%defaultDisabled%"=="0" (
    echo(Disabling CSCRIPT ... 
    reg add "HKCU\Software\Microsoft\Windows Script Host\Settings" /v "Enabled" /t REG_DWORD /d "0" /f
    reg add "HKLM\Software\Microsoft\Windows Script Host\Settings" /v "Enabled" /t REG_DWORD /d "0" /f
)
pause
exit /b
