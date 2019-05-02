# Looks for directories named Users
Set-Location c:\
Get-ChildItem | ForEach-Object {$_ -match 'Users'}

# Outputs any matches
$matches | ForEach-Object {$_.Values}

# Looks for data within a file
Set-Location d:\
Get-ChildItem -Filter *doc* -Recurse

# Replaces specific characters....
'dc=cloud,dc=domain,dc=local' -match 'cloud,dc=domain,dc=local' | out-null
$matches | ForEach-Object {$_.Values -replace ',dc=','.'}



