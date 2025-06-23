# Activate Windows 10/11 Enterprise LTSC/IoT LTSC

Current Upgradable Versions From Evaluation With EvalPatch v1.1:
- Windows 10 Enterprise LTSC 2019
- Windows 10 Enterprise IoT LTSC 2021
- Windows 10 Enterprise LTSC 2021
- Windows 11 Enterprise IoT LTSC 2024
- Windows 11 Enterprise LTSC 2024

The Following Steps are For Manual Execution. If you wish to proceed with an automated version, you can download the repository and do the following steps. Step 1: Move the batch file into your desired's version folder (e.g. Windows 10 LTSC & IoT LTSC 2021). Step 2: Open the batch and select the version you pasted the batch Into. And you're done!

# For Windows 10 Enterprise
**| Activate Windows 10 Enterprise LTSC |**

**Step 1.** Copy The Folders Named: **csvlk-pack** and **EnterpriseS** to _C:\Windows\System32\spp\tokens\skus_

**Step 2.** Run these commands on an CMD instance with Administrative Permissions:
```
cscript.exe %windir%\system32\slmgr.vbs /rilc 
cscript.exe %windir%\system32\slmgr.vbs /upk >nul 2>&1
cscript.exe %windir%\system32\slmgr.vbs /ckms >nul 2>&1
cscript.exe %windir%\system32\slmgr.vbs /cpky >nul 2>&1
cscript.exe %windir%\system32\slmgr.vbs /ipk M7XTQ-FN8P6-TTKYV-9D4CC-J462D
takeown /F "C:\Windows\System32\spp\tokens\skus\EnterpriseSEval" /R /D Y
takeown /F "C:\Windows\System32\spp\tokens\skus\IoTEnterpriseSEval" /R /D Y
icacls "C:\Windows\System32\spp\tokens\skus\EnterpriseSEval" /grant %username%:F /T
icacls "C:\Windows\System32\spp\tokens\skus\IoTEnterpriseSEval" /grant %username%:F /T
rmdir /S /Q "C:\Windows\System32\spp\tokens\skus\EnterpriseSEval"
rmdir /S /Q "C:\Windows\System32\spp\tokens\skus\IoTEnterpriseSEval"
taskkill /f /im explorer.exe
start explorer.exe
exit
```

**Step 3.** Insert Your Own Key In The Settings To Activate _(OR USE **MAS BY MASSGRAVEL** WHICH IM NOT GONNA PROVIDE THE SCRIPT FOR, AND SELECT HWID. ITS NOT RECOMMENDED THO SINCE ITS **AGAINST THE GUIDELINES BY MICROSOFT**)_

**| Activate Windows 10 Enterprise IoT LTSC (Only For Windows 10 IoT LTSC 2021) |**

**Step 1.** Copy The Folders Named: **csvlk-pack** , **EnterpriseS** and **IoTEnterpriseS** to _C:\Windows\System32\spp\tokens\skus_

**Step 2.** Run these commands on an CMD instance with Administrative Permissions:
```
cscript.exe %windir%\system32\slmgr.vbs /rilc
cscript.exe %windir%\system32\slmgr.vbs /upk >nul 2>&1
cscript.exe %windir%\system32\slmgr.vbs /ckms >nul 2>&1
cscript.exe %windir%\system32\slmgr.vbs /cpky >nul 2>&1
cscript.exe %windir%\system32\slmgr.vbs /ipk QPM6N-7J2WJ-P88HH-P3YRH-YY74H
takeown /F "C:\Windows\System32\spp\tokens\skus\EnterpriseSEval" /R /D Y
takeown /F "C:\Windows\System32\spp\tokens\skus\IoTEnterpriseSEval" /R /D Y
icacls "C:\Windows\System32\spp\tokens\skus\EnterpriseSEval" /grant %username%:F /T
icacls "C:\Windows\System32\spp\tokens\skus\IoTEnterpriseSEval" /grant %username%:F /T
rmdir /S /Q "C:\Windows\System32\spp\tokens\skus\EnterpriseSEval"
rmdir /S /Q "C:\Windows\System32\spp\tokens\skus\IoTEnterpriseSEval"
taskkill /f /im explorer.exe
start explorer.exe
exit
```

**Step 3.** Insert Your Own Key In The Settings To Activate _(OR USE **MAS BY MASSGRAVEL** WHICH IM NOT GONNA PROVIDE THE SCRIPT FOR, AND SELECT HWID. ITS NOT RECOMMENDED SINCE ITS **AGAINST THE GUIDELINES BY MICROSOFT**)_

# For Windows 11 Enterprise

**| Activate Windows 11 Enterprise LTSC |**

**Step 1.** Copy The Folders Named: **csvlk-pack** , **EnterpriseS** and **IoTEnterpriseS** to _C:\Windows\System32\spp\tokens\skus_

**Step 2.** Run these commands on an CMD instance with Administrative Permissions:
```
cscript.exe %windir%\system32\slmgr.vbs /rilc
cscript.exe %windir%\system32\slmgr.vbs /upk >nul 2>&1
cscript.exe %windir%\system32\slmgr.vbs /ckms >nul 2>&1
cscript.exe %windir%\system32\slmgr.vbs /cpky >nul 2>&1
cscript.exe %windir%\system32\slmgr.vbs /ipk M7XTQ-FN8P6-TTKYV-9D4CC-J462D
takeown /F "C:\Windows\System32\spp\tokens\skus\EnterpriseSEval" /R /D Y
takeown /F "C:\Windows\System32\spp\tokens\skus\IoTEnterpriseSEval" /R /D Y
icacls "C:\Windows\System32\spp\tokens\skus\EnterpriseSEval" /grant %username%:F /T
icacls "C:\Windows\System32\spp\tokens\skus\IoTEnterpriseSEval" /grant %username%:F /T
rmdir /S /Q "C:\Windows\System32\spp\tokens\skus\EnterpriseSEval"
rmdir /S /Q "C:\Windows\System32\spp\tokens\skus\IoTEnterpriseSEval"
taskkill /f /im explorer.exe
start explorer.exe
exit
```

**Step 3.** Insert Your Own Key In The Settings To Activate _(OR USE **MAS BY MASSGRAVEL** WHICH IM NOT GONNA PROVIDE THE SCRIPT FOR, AND SELECT HWID. ITS NOT RECOMMENDED SINCE ITS **AGAINST THE GUIDELINES BY MICROSOFT**)_

**| Activate Windows 11 Enterprise IoT LTSC |**

**Step 1.** Copy The Folders Named: **csvlk-pack** , **EnterpriseS** and **IoTEnterpriseS** to _C:\Windows\System32\spp\tokens\skus_

**Step 2.** Run these commands on an CMD instance with Administrative Permissions:
```
cscript.exe %windir%\system32\slmgr.vbs /rilc
cscript.exe %windir%\system32\slmgr.vbs /upk >nul 2>&1
cscript.exe %windir%\system32\slmgr.vbs /ckms >nul 2>&1
cscript.exe %windir%\system32\slmgr.vbs /cpky >nul 2>&1
cscript.exe %windir%\system32\slmgr.vbs /ipk KBN8V-HFGQ4-MGXVD-347P6-PDQGT
takeown /F "C:\Windows\System32\spp\tokens\skus\EnterpriseSEval" /R /D Y
takeown /F "C:\Windows\System32\spp\tokens\skus\IoTEnterpriseSEval" /R /D Y
icacls "C:\Windows\System32\spp\tokens\skus\EnterpriseSEval" /grant %username%:F /T
icacls "C:\Windows\System32\spp\tokens\skus\IoTEnterpriseSEval" /grant %username%:F /T
rmdir /S /Q "C:\Windows\System32\spp\tokens\skus\EnterpriseSEval"
rmdir /S /Q "C:\Windows\System32\spp\tokens\skus\IoTEnterpriseSEval"
taskkill /f /im explorer.exe
start explorer.exe
exit
```

**Step 3.** Insert Your Own Key In The Settings To Activate _(OR USE **MAS BY MASSGRAVEL** WHICH IM NOT GONNA PROVIDE THE SCRIPT FOR, AND SELECT HWID. ITS NOT RECOMMENDED SINCE ITS **AGAINST THE GUIDELINES BY MICROSOFT**)_
