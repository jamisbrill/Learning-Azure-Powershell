Get-AzADGroup -SearchString Developers #can get  role access for Group, User, Service Principal (App) , managed Identity
(Get-AzADGroup -DisplayName Developers).id   #get object id of the group 
$objectId =  (Get-AzADGroup -DisplayName Developers).id

Get-AzRoleDefinition | FT Name, IsCustom, Id  #Check all the roles out 
Get-AzRoleDefinition "Desktop Virtualization Reader" 
#Identity the scope . (Rg, Subscription, Resource , Management group )
$subscriptionid = (Get-AzSubscription).id #subscription access scope
$subscope = "/subscriptions/"
$subscopefinal = $subscope + $subscriptionid #concatenate the /subscriptions/ and ID 

New-AzRoleAssignment -ObjectId $objectId -RoleDefinitionName "Desktop Virtualization Reader" -Scope $subscopefinal


#Based on https://docs.microsoft.com/en-us/azure/role-based-access-control/role-assignments-powershell 
