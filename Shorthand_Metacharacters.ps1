<#
\w - word character a-zA-Z0-9_
\s - whitespace
\d - digits
\W - negated, not a word character
\D - negated digits
\S - negated whitespace
. - matches any character
\n - new line
\t - tab
\r - carriage return
#>

'svc_account' -match '\w\w\w\waccount'
$Matches | ForEach-Object {$_.Values}

$matchAnything = 'a',1,'!',' '
$matchAnything -match '.'

$wordCharTest = 'a','b',' ',2,'$'
$wordCharTest -match '\w'

(Get-NetIpAddress -InterfaceAlias WiFi -AddressFamily Ipv4).IPAddress `
-match '\d\d\d\.\d\d\d\.\d\d\d\.\d\d\d' # this won't work as its looking for all octets to be present.

#My IP Address is xxx.xxx.xxx.xx
# So the regex in this example will need to be
#'\d\d\d\.\d\d\d\.\d\d\d\.\d\d'
(Get-NetIpAddress -InterfaceAlias WiFi -AddressFamily Ipv4).IPAddress `
-match '\d\d\d\.\d\d\d\.\d\d\d\.\d\d'
$matches | ForEach-Object {$_.Values}

# This only splits on a single whitespace
$textwithwhitespace = "This text  contains
whitespaces  and  a newline"
$textwithwhitespace.Split(' ')

# Favour two whitespaces over a single whitespace
$textwithwhitespace -Split '\s\s|\s'

# Favour one whitespace over two single whitespaces
$textwithwhitespace -Split '\s|\s\s'

# Convert an array to a string
Get-WmiObject Win32_ComputerSystem | Select-Object Roles

$roles = @()

$roles = (Get-WmiObject Win32_ComputerSystem).Roles
$roles
$rolestring = ($roles | Out-String) -replace '\n',','
$rolestring = $rolestring -replace '\n',','
$rolestring = $rolestring.Trim(',')

$obj = [PSCustomObject]@{ComputerName=$env:COMPUTERNAME;roles=$rolestring}
$obj | Format-Table -Wrap
