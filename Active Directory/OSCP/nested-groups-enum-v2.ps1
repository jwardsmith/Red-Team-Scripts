$EMPTY = ""
$PAD = "    "
$BRANCH = "|- "

$DIS_PREFIX = "DC=$("
$DIS_SUFFIX = ")"

$LDAP_PREFIX = "LDAP://"
$LDAP_SEP = "/"

$REGEX = '^CN=([^,]*)'
$QUERY_PREFIX = "(&(objectClass=Group)(name="
$QUERY_SUFFIX = "))"

$domain = [System.DirectoryServices.ActiveDirectory.Domain]::GetCurrentDomain()
$pdc = ($domain.PdcRoleOwner).Name
$dis = $DIS_PREFIX
$dis += $domain.Name.Replace('.',',DC=')
$dis += $DIS_SUFFIX
$ldap_provider_path = $LDAP_PREFIX + $pdc + $LDAP_SEP + $dis
# $ldap_provider_path

$directory_searcher = New-Object System.DirectoryServices.DirectorySearcher([ADSI]$ldap_provider_path)
$directory_entry = New-Object System.DirectoryServices.DirectoryEntry
$directory_searcher.SearchRoot = $directory_entry

function Get-Result {
    param(
        [Parameter(Position=0,Mandatory=$true)]$qry,
        [Parameter(Position=1,Mandatory=$true)]$indent
    )

    $directory_searcher.filter = $qry
    $results = $directory_searcher.FindAll()
    foreach($result in $results){
        $t = $EMPTY
        for ($i=0;$i -lt $indent;$i++){
            $t += $PAD
        }
        $t += $BRANCH
        $t += $result.Properties.name
        Write-Host $t

        $s = [string] $result.Properties.member
        $p = [regex] $REGEX
        $null = $s -match $p

        if ($Matches -ne $false) {
            $n = [string]($Matches[1])
            # ensure this is not equal to the current name
            if ( $result.Properties.name -ne $n) {
                [string] $q = $QUERY_PREFIX
                $q += $n
                $q += $QUERY_SUFFIX
                $inc = $indent+1
                # do not keep diving if we're 20 levels down (we may be going in a circle)
                if ( $inc -lt 20 ) {
                    Get-Result $q $inc
                }
            }
        }
    }
}

Get-Result "(objectClass=Group)" 0
