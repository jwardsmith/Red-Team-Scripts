$out = @()
$Hostname = $Env:ComputerName
$DNSName = Resolve-DnsName -Name $Env:ComputerName | Select-Object Name | select -First 1| foreach-object {write "$('{0:N2}' -f ($_.Name))"}
$arch = Get-CimInstance Win32_OperatingSystem | Select-Object OSArchitecture
$osWin = Get-CimInstance Win32_OperatingSystem | Select-Object  Caption
$proc = Get-CimInstance CIM_Processor | Select-Object Name| select -First 1
$os = Get-CimInstance CIM_OperatingSystem | Select-Object SerialNumber
$osVer = Get-CimInstance CIM_OperatingSystem | Select-Object Version
$BIOS = Get-CimInstance CIM_BIOSElement | Select-Object Version
$biosRelDate = Get-CimInstance CIM_BIOSElement | Select-Object ReleaseDate
$computerBIOS = Get-CimInstance CIM_BIOSElement | Select-Object Manufacturer
$macaddress = (Get-WmiObject win32_networkadapterconfiguration -ComputerName $env:COMPUTERNAME | Where{$_.IpEnabled -Match "True"} | Select-Object -Expand macaddress) -join ","
$ipaddress = @(@(Get-WmiObject Win32_NetworkAdapterConfiguration | Select-Object -ExpandProperty IPAddress) -like "*.*")
$model = Get-CimInstance -ClassName Win32_ComputerSystem | Select-Object Model
$ossp = Get-CimInstance CIM_OperatingSystem | Select-Object ServicePackMajorVersion
$coreCPU= Get-WmiObject -ClassName Win32_Processor | Measure-Object -Property NumberOfCores -Sum | select -Property Sum |foreach-object {write "$('{0:N0}' -f ($_.Sum))"}
$GatewayNR = Get-NetRoute -DestinationPrefix "0.0.0.0/0" | Select-Object -ExpandProperty "NextHop"
$LocalTime = Get-Date
$Timeout = (Get-ItemProperty -Path "Registry::\HKEY_USERS\.DEFAULT\Control Panel\Desktop" -Name "ScreenSaveTimeOut" -ErrorAction silentlyContinue).ScreenSaveTimeOut
$AVName = (Get-Package -ProviderName msi | Where-Object {$_.Name -like "McAfee Agent*"} | Select-Object -ExpandProperty Name)
$AVersion = (Get-Package -ProviderName msi | Where-Object {$_.Name -like "McAfee Agent*"} | Select-Object -ExpandProperty Version)
$ram = (Get-CimInstance Win32_PhysicalMemory | Measure-Object -Property capacity -Sum | Foreach {"{0:N2}" -f ([math]::round(($_.Sum / 1GB),2))})
$hddFree = ((Get-PSDrive C).Free / 1GB)
$hddUsed = ((Get-PSDrive C).Used / 1GB)

$DeviceInfo= @{}
$DeviceInfo.add("Hostname", [string]$Hostname)
$DeviceInfo.add("DNS Name", [string]$DNSName)
$DeviceInfo.add("OS", [string]$osWin.Caption)
$DeviceInfo.add("OS Version", $osVer.Version)
$DeviceInfo.add("OS Architecture", [string]$arch.OSArchitecture)
$DeviceInfo.add("CPU Model", [string]$proc.Name)
$DeviceInfo.add("Number of CPUs",[string]$coreCPU)
$DeviceInfo.add("BIOS Manufacturer", [string]$computerBIOS.Manufacturer)
$DeviceInfo.add("BIOS Version", [string]$BIOS.Version)
$DeviceInfo.add("BIOS Release Date", [string]$biosRelDate.ReleaseDate)
$DeviceInfo.add("MAC Address", [string]$macaddress)
$DeviceInfo.add("IP Address", [string]$ipaddress)
$DeviceInfo.add("Model", [string]$model.Model)
$DeviceInfo.add("OS Service Pack", [string]$ossp.ServicePackMajorVersion)
$DeviceInfo.add("OS Serial Number", [string]$os.SerialNumber)
$DeviceInfo.add("Gateway", [string]$GatewayNR)
$DeviceInfo.add("Current Time", [string]$LocalTime)
$DeviceInfo.add("Timeout", [string]$Timeout)
$DeviceInfo.add("Antivirus Name", [string]$AVName)
$DeviceInfo.add("Antivirus Version", [string]$AVersion)
$DeviceInfo.add("RAM", [string]$ram)
$DeviceInfo.add("HDD Free GB", [string]$hddFree)
$DeviceInfo.add("HDD Used GB", [string]$hddUsed)

$out += New-Object PSObject -Property $DeviceInfo | Select-Object `
       "Hostname","DNS Name","OS","OS Version","OS Architecture","CPU Model","Number of CPUs","BIOS Manufacturer","BIOS Version","BIOS Release Date","MAC Address","IP Address","Model","OS Service Pack","OS Serial Number","Gateway","Current Time","Timeout","Antivirus Name","Antivirus Version","RAM","HDD Free GB","HDD Used GB"

Write-Verbose ($out | Out-String) -Verbose
$out | Export-CSV C:\temp\SysInfo_Win_Result.csv -NoTypeInformation
$import = get-content C:\temp\SysInfo_Win_Result.csv
$import | Select-Object -Skip 1 | Set-Content C:\temp\SysInfo_Result.csv

