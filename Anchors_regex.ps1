# Start of line anchor ^ - works from the lefthand side
'set','reset' -match '^Set'

# End of line anchor $ - works from the righthand side
'Script','Scripts' -match 'Scripts$'

$Count = 0
Get-Module -ListAvailable | ForEach-Object {

    Get-Command -Module $_ | Where-Object Name -Match '^[GS]et-' | ForEach-Object {
        $Count++
    }
}
$count

