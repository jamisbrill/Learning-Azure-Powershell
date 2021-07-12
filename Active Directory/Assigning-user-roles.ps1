#Assign Azure roles using Azure PowerShell
#Azure role-based access control (Azure RBAC) is the authorization system you use to manage access to Azure resources. To grant access, you assign roles to users, groups, service principals, or managed identities at a particular scope. 
#can get  role access for Group, User, Service Principal (App) , managed Identity
Get-AzADUser -StartsWith sam #find user with name Sam :)
(Get-AzADUser -DisplayName sam).id   #get object id of user 
$objectId = (Get-AzADUser -DisplayName sam).id 

#Check all the roles out 
Get-AzRoleDefinition | FT Name, IsCustom, Id
Get-AzRoleDefinition owner 
#Identity the scope //which is the scope of access to give  (Rg, Subscription, Resource , Management group )
#Get-AzSubscription #subscription access scope
#Get-AzManagementGroup // management scope
Get-AzResourceGroup -name TestRG #get the id of the resource group 

New-AzRoleAssignment -ObjectId $objectId -RoleDefinitionName owner -ResourceGroupName TestRG
