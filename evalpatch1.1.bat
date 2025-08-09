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
echo +--------------------------------------------+
echo l               EvalPatch v1.1               l
echo +--------------------------------------------+
echo l  1. Windows 10 Enterprise LTSC 2019/2021   l
echo l  2. Windows 10 Enterprise IoT LTSC 2021    l  
echo l  3. Windows 11 Enterprise LTSC 2024        l
echo l  4. Windows 11 Enterprise IoT LTSC 2024    l
echo l  0. Exit                                   l
echo +--------------------------------------------+
echo.
set /p choice=Select An Option: 

if "%choice%"=="1" goto OPTION1
if "%choice%"=="2" goto OPTION2
if "%choice%"=="3" goto OPTION3
if "%choice%"=="4" goto OPTION4
if "%choice%"=="0" exit /b

echo.   
echo Invalid choice. Try again.
pause >nul
goto menu

:OPTION1
cls
call :cscript_check
if not exist "%~dp0Windows 10 Enterprise LTSC 2019,2021\EnterpriseS" (
    echo Folder "EnterpriseS" not found in: "(Batch Directory)/Windows 10 Enterprise LTSC 2019,2021"
    pause
    goto menu
)
call :EnterpriseS
call :csvlk-pack
xcopy "%~dp0Windows 10 Enterprise LTSC 2019,2021\EnterpriseS\*" "C:\Windows\System32\spp\tokens\skus\EnterpriseS\" /E /H /C /I /Y /Z
xcopy "%~dp0Windows 10 Enterprise LTSC 2019,2021\csvlk-pack\*" "C:\Windows\System32\spp\tokens\skus\csvlk-pack\" /E /H /C /I /Y /Z
call :clean_key
cscript.exe %windir%\system32\slmgr.vbs /ipk M7XTQ-FN8P6-TTKYV-9D4CC-J462D > nul 2>&1
call :final
exit /b

:OPTION2
cls
call :cscript_check
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
call :IoTEnterpriseS
call :EnterpriseS
call :csvlk-pack
xcopy "%~dp0Windows 10 Enterprise IoT LTSC 2021\IoTEnterpriseS\*" "C:\Windows\System32\spp\tokens\skus\IoTEnterpriseS\" /E /H /C /I /Y /Z
xcopy "%~dp0Windows 10 Enterprise IoT LTSC 2021\csvlk-pack\*" "C:\Windows\System32\spp\tokens\skus\csvlk-pack\" /E /H /C /I /Y /Z
call :clean_key
cscript.exe %windir%\system32\slmgr.vbs /ipk QPM6N-7J2WJ-P88HH-P3YRH-YY74H > nul 2>&1
call :final
exit /b

:OPTION3
cls
call :cscript_check
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
call :EnterpriseS
call :csvlk-pack
xcopy "%~dp0Windows 11 Enterprise LTSC,IoT LTSC 2024\EnterpriseS\*" "C:\Windows\System32\spp\tokens\skus\EnterpriseS\" /E /H /C /I /Y /Z
xcopy "%~dp0Windows 11 Enterprise LTSC,IoT LTSC 2024\csvlk-pack\*" "C:\Windows\System32\spp\tokens\skus\csvlk-pack\" /E /H /C /I /Y /Z
call :clean_key
cscript.exe %windir%\system32\slmgr.vbs /ipk M7XTQ-FN8P6-TTKYV-9D4CC-J462D > nul 2>&1
call :final
exit /b

:OPTION4
cls
call :cscript_check
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
call :IoTEnterpriseS
call :EnterpriseS
call :csvlk-pack
xcopy "%~dp0Windows 11 Enterprise LTSC,IoT LTSC 2024\IoTEnterpriseS\*" "C:\Windows\System32\spp\tokens\skus\IoTEnterpriseS\" /E /H /C /I /Y /Z
xcopy "%~dp0Windows 11 Enterprise LTSC,IoT LTSC 2024\csvlk-pack\*" "C:\Windows\System32\spp\tokens\skus\csvlk-pack\" /E /H /C /I /Y /Z
call :clean_key
cscript.exe %windir%\system32\slmgr.vbs /ipk KBN8V-HFGQ4-MGXVD-347P6-PDQGT > nul 2>&1
call :final
exit /b

Rem ------------------Labels------------------

:cscript_check
>nul cscript || (
    echo(Enabling CSCRIPT ...
    set "defaultDisabled=0" 
    reg delete "HKCU\SOFTWARE\Microsoft\Windows Script Host\Settings" /v "Enabled" /f
    reg delete "HKLM\SOFTWARE\Microsoft\Windows Script Host\Settings" /v "Enabled" /f
)
exit /b

:clean_key
cscript.exe %windir%\system32\slmgr.vbs /rilc 
cscript.exe %windir%\system32\slmgr.vbs /upk >nul 2>&1
cscript.exe %windir%\system32\slmgr.vbs /ckms >nul 2>&1
cscript.exe %windir%\system32\slmgr.vbs /cpky >nul 2>&1
exit /b

:final
if exist "C:\Windows\System32\spp\tokens\skus\EnterpriseSEval" (
    call takeown /F "C:\Windows\System32\spp\tokens\skus\EnterpriseSEval" /R /D Y
    call icacls "C:\Windows\System32\spp\tokens\skus\EnterpriseSEval" /grant "%username%":F /T
    call rmdir /S /Q "C:\Windows\System32\spp\tokens\skus\EnterpriseSEval"
)

if exist "C:\Windows\System32\spp\tokens\skus\IoTEnterpriseSEval" (
    call takeown /F "C:\Windows\System32\spp\tokens\skus\IoTEnterpriseSEval" /R /D Y
    call icacls "C:\Windows\System32\spp\tokens\skus\IoTEnterpriseSEval" /grant "%username%":F /T
    call rmdir /S /Q "C:\Windows\System32\spp\tokens\skus\IoTEnterpriseSEval"
)
powershell -NoProfile -Command "Add-Type -Name WinAPI -Namespace Native -MemberDefinition '[DllImport(\"user32.dll\")] public static extern IntPtr GetShellWindow(); [DllImport(\"user32.dll\")] public static extern int SendMessageW(IntPtr hWnd, uint Msg, UIntPtr wParam, IntPtr lParam);'; $hwnd = [Native.WinAPI]::GetShellWindow(); $WM_COMMAND=0x0111; $ID_REFRESH=[UIntPtr]::new(41504); [Native.WinAPI]::SendMessageW($hwnd,$WM_COMMAND,$ID_REFRESH,[IntPtr]::Zero)" > nul 2>&1
if defined defaultDisabled if "%defaultDisabled%"=="0" (
    echo(Disabling CSCRIPT ... 
    reg add "HKCU\Software\Microsoft\Windows Script Host\Settings" /v "Enabled" /t REG_DWORD /d "0" /f
    reg add "HKLM\Software\Microsoft\Windows Script Host\Settings" /v "Enabled" /t REG_DWORD /d "0" /f
)
echo Windows Was De-Evaluated Succesfully! You Can Go Ahead and Activate it Now.
pause
exit /b

:csvlk-pack
if exist "C:\Windows\System32\spp\tokens\skus\csvlk-pack" (
    call takeown /F "C:\Windows\System32\spp\tokens\skus\csvlk-pack" /R /D Y
    call icacls "C:\Windows\System32\spp\tokens\skus\csvlk-pack" /grant "%username%":F /T
    call rmdir /S /Q "C:\Windows\System32\spp\tokens\skus\csvlk-pack"
)
exit /b

:EnterpriseS
if exist "C:\Windows\System32\spp\tokens\skus\EnterpriseS" (
    call takeown /F "C:\Windows\System32\spp\tokens\skus\EnterpriseS" /R /D Y
    call icacls "C:\Windows\System32\spp\tokens\skus\EnterpriseS" /grant "%username%":F /T
    call rmdir /S /Q "C:\Windows\System32\spp\tokens\skus\EnterpriseS"
)
exit /b

:IoTEnterpriseS
if exist "C:\Windows\System32\spp\tokens\skus\IoTEnterpriseS" (
    call takeown /F "C:\Windows\System32\spp\tokens\skus\IoTEnterpriseS" /R /D Y
    call icacls "C:\Windows\System32\spp\tokens\skus\IoTEnterpriseS" /grant "%username%":F /T
    call rmdir /S /Q "C:\Windows\System32\spp\tokens\skus\IoTEnterpriseS"
)
exit /b
