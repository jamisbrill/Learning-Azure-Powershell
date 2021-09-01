Connect-AzureAD
[system.io.directory]::CreateDirectory(“D:\ADSample\”)

Get-AzureADUser -All $true | Export-Csv D:\ADSample\AllUsers.csv
Import-CSV D:\ADSample\AllUsers.csv | Foreach-Object { Remove-AzureADUser -ObjectId $_.UserPrincipalName }

#you may need adjust drive and add the folder 

#script needs fixing
