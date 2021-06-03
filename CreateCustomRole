
#Connect-AzAccount
#Creating a custom roles 
Get-AzRoleDefinition | select Name, ISCustom, Description
#get actions 
(Get-AzRoleDefinition "Virtual Machine USer Login").Actions  #shows what actions this role has 
Get-AzProviderOperation "Microsoft.Compute/virtualmachines/*" | select Operation   #show all the vm roles that are available 



$role = Get-AzRoleDefinition "virtual Machine User Login"
$role.Id = $null #cclear the id so it can have anew one
$role.Name = "Virtual machine restarter " 
$role.Description = "Can restart vms obvs" 

$role.Actions.Add("Microsoft.Compute/virtualMachines/start/action")
$role.Actions.Add("Microsoft.Compute/virtualMachines/restart/action")

$role.AssignableScopes.Clear()
$role.AssignableScopes.Add("/subscriptions/SubscriptionIDGoesHERE") #Get-AzSubscription 

New-AzRoleDefinition -Role $role
