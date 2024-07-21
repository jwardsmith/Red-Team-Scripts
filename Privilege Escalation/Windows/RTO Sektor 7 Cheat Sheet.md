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

### Unsecured Objects

### Execution Flow Hijacking

### Getting SYSTEM
