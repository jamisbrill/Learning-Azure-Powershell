#assign Permissions group access to azure resources 
$location = 'Uk South'
#Connect-AzAccount
Connect-AzureAD
New-AzureADGroup -DisplayName "RBACGroup" -MailEnabled $false -SecurityEnabled $true -MailNickName "NotSet"  #create a new group
New-AzResourceGroup -Name "rbacrg" -Location $location
$groupstuff = AzureADGroup -SearchString "RBACGroup" | Where-Object -Property ObjectId
$groupid = $groupstuff.ObjectId  
echo $groupid
$subscope1 = Get-AzSubscription 
$subscope2 = $subscope1.id
$subscope3 = "/subscriptions/"
$subscopefinal = $subscope3 + $subscope2 

echo $subscopefinal
#grant access 
New-AzRoleAssignment -ObjectId $groupId -RoleDefinitionName "Reader" -Scope $subscopefinal #Assign the role Reader at the sbuscription scope
New-AzRoleAssignment -ObjectId $groupId -RoleDefinitionName "Contributor" -ResourceGroupName "rbacrg"
#Check access
Get-AzRoleAssignment -ObjectId $groupId -Scope $subScopefinal
Get-AzRoleAssignment -ObjectId $groupId -ResourceGroupName "rbacrg"




