<# 
character classes [ae] - simple
character class range [a-z]
character class range digits [0-9]
character class negated [^....]
character class negated range [^a-z]
#>

'gray' -match 'gr[ae]y' | Out-Null
$matches.values

'grey' -match 'gr[ae]y' | Out-Null
$matches.values

# returns the values matched
'gray','grey' -match 'gr[ae]y'

# matches the first instance
'gray grey' -match 'gr[ae]y' | Out-Null
$matches | ForEach-Object {$_.Values}

# Matches D, the first character instance
'Dom Clayton' -match '[a-z]' | Out-Null
$matches | ForEach-Object {$_.Values}

# Matches Do, the first two characters
'Dom Clayton' -match '[a-z].' | Out-Null
$matches | ForEach-Object {$_.Values}

# Matches Dom and Clayton
'Dom','Clayton' -match '[a-z]' 

# Matches Dom
'Dom Clayton' -match '[a-z]*' | Out-Null
$matches | ForEach-Object {$_.Values}

# Matches C
'Dom Clayton' -match '[^dom]' | Out-Null
$matches | ForEach-Object {$_.Values}

# Matches object can be used when using select-string
'gray & grey' | Select-String -Pattern 'gr[ae]y' -AllMatches `
| ForEach-Object Matches | ForEach-Object {$_.Value}

# All Set and Reset cmdlets for every module available on system.
$Count = 0
Get-Module -ListAvailable | ForEach-Object {

    Get-Command -Module $_ | Where-Object {$_.Name -Match 'Set-'} | ForEach-Object {
        $Count++
    }
}
$a = $Count

# All Get cmdlets for every module available on the system.
$Count = 0
Get-Module -ListAvailable | ForEach-Object {

    Get-Command -Module $_ | Where-Object Name -Match 'Get-' | ForEach-Object {
        $Count++
    }
} 
$b = $Count


$Count = 0
Get-Module -ListAvailable | ForEach-Object {

    Get-Command -Module $_ | Where-Object Name -Match '[GS]et-' | ForEach-Object {
        $Count++
    }
} 
$c = $Count

# Does -match 'Set-' and match 'get-' equal match '[GS]et-'?
If ($a + $b -eq $c){
    $True
} Else {
    $false
}

# If you need to match a square bracket then this should be defined first and opposing
# e.g. '[][]'
# backslash needs escaping too along with many others
'[Dominic] \\Clayton\\' -replace '[][\\]',''

# Very simple regex to validate an IP address - this is not 100% accurate
# matches within the range of digits 1 or more up to 3.
(Get-NetIpAddress -InterfaceAlias WiFi -AddressFamily Ipv4).IPAddress `
-match '^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$'
$matches | ForEach-Object {
    $_.Values
}

# Case sensitive matching
'REGEX' -cmatch '[a-z]'
'REGEX' -cmatch '[A-Z]'
'REGEX','regex' -cmatch '[A-Za-z]'

# Negated character classes
# ^ allows you match something you don't want e.g. [^ ] match anything that is not a space


# splitting strings; split on anything that isn't a character within the alphabet.
'dominic.clayton@domain.com' -split '[^a-z]'


