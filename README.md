# Activate Windows 10 Enterprise LTSC/IoT LTSC (Windows 11 Support Coming Soon)

Current Upgradable Versions From Evaluation With EvalPatch v1:
- Windows 10 Enterprise IoT LTSC 2021
- Windows 10 Enterprise LTSC 2021

  _**!!!WARNING!!! EvalPatch v1 DOES NOT guarantee support with ISOs that are IoT LTSC out of the box. its coming soon in EvalPatch v1.1 tho so stay tuned!**_

# Activate Windows 10/11 Enterprise LTSC

**Step 1.** Copy The Folders Named: **csvlk-pack** and **EnterpriseS** to _C:\Windows\System32\spp\tokens\skus_

**Step 2.** Run these commands on an CMD instance with Administrative Permissions:
- cscript.exe %windir%\system32\slmgr.vbs /rilc 
- cscript.exe %windir%\system32\slmgr.vbs /upk >nul 2>&1
- cscript.exe %windir%\system32\slmgr.vbs /ckms >nul 2>&1
- cscript.exe %windir%\system32\slmgr.vbs /cpky >nul 2>&1
- takeown /F "C:\Windows\System32\spp\tokens\skus\EnterpriseSEval" /R /D Y
- icacls "C:\Windows\System32\spp\tokens\skus\EnterpriseSEval" /grant %username%:F /T
- rmdir /S /Q "C:\Windows\System32\spp\tokens\skus\EnterpriseSEval"
- taskkill /f /im explorer.exe
- start explorer.exe

**Step 3.** Insert Your Own Key In The Settings To Activate _(OR USE **MAS BY MASSGRAVEL** WHICH IM NOT GONNA PROVIDE THE SCRIPT FOR, AND SELECT KMS38. WHICH IS NOT RECOMMENDED THO SINCE ITS A TEMPORARY ACTIVATION AND ITS **AGAINST THE GUIDELINES BY MICROSOFT**)_

# Activate Windows 10 Enterprise IoT LTSC (Windows 11 Coming Soon)

**Step 1.** Copy The Folders Named: **csvlk-pack** , **EnterpriseS** and **IoTEnterpriseS** to _C:\Windows\System32\spp\tokens\skus_

**Step 2.** Run these commands on an CMD instance with Administrative Permissions:
- cscript.exe %windir%\system32\slmgr.vbs /rilc
- cscript.exe %windir%\system32\slmgr.vbs /upk >nul 2>&1
- cscript.exe %windir%\system32\slmgr.vbs /ckms >nul 2>&1
- cscript.exe %windir%\system32\slmgr.vbs /cpky >nul 2>&1
- takeown /F "C:\Windows\System32\spp\tokens\skus\EnterpriseSEval" /R /D Y
- icacls "C:\Windows\System32\spp\tokens\skus\IoTEnterpriseSEval" /grant %username%:F /T
- rmdir /S /Q "C:\Windows\System32\spp\tokens\skus\EnterpriseSEval"
- taskkill /f /im explorer.exe
- start explorer.exe

**Step 3.** Insert Your Own Key In The Settings To Activate _(OR USE **MAS BY MASSGRAVEL** WHICH IM NOT GONNA PROVIDE THE SCRIPT FOR, AND SELECT HWID WHICH EVEN THO ITS PERMANENT UNLIKE KMS38, ITS STILL NOT RECOMMENDED SINCE ITS **AGAINST THE GUIDELINES BY MICROSOFT**)_
