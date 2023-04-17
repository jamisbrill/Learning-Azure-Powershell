
# Script to add admin role to admin profile & remove it 
#& assign a user teams communications admin 


# only connect to teams once 
# checks whether tenant is there 
try { $null = Get-CsTenant } catch { Connect-MicrosoftTeams } {echo "Signing into teams" }

#connect to azure
Connect-AzureAD


# Create variables to store role data etc

$userName="davyjones@trustlabs.co.uk"
$roleName="Teams Communications Administrator"
$role = Get-AzureADDirectoryRole | Where {$_.displayName -eq $roleName} 

#assign the role 
Add-AzureADDirectoryRoleMember -ObjectId $role.ObjectId -RefObjectId (Get-AzureADUser | Where {$_.UserPrincipalName -eq $userName}).ObjectID

#get the ids of the user 
$memberid = Get-AzureADUser -ObjectId "davyjones@trustlabs.co.uk"

#remove the role from the user 
Remove-AzureADDirectoryRoleMember -ObjectId $role.ObjectId -MemberId $memberid.ObjectId 
