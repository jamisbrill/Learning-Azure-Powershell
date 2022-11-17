  $group = Get-AzureADGroup -SearchString "Technical support department"

$members = Get-AzureADGroupMember -ObjectId $group.ObjectId -All $true | Where-Object {$_.ObjectType -eq "User"}

$members | ForEach-Object { Grant-CsTeamsAppPermissionPolicy -PolicyName "Technical support App Permission Policy" -Identity $_.EmailAddress}


