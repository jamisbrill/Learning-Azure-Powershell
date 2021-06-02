#Assign a Role based access control Role 
#view all the roles first 
Get-AzRoleDefinition | FT Name , Description 
#View a specific role
Get-AzRoleDefinition "contributor" 
#List the actions of a specific role 
Get-AzRoleDefinition "contributor" | FL Actions , NotActions
#Create the subscriptionm variable 
Get-AzSubscription 
$subscriptionScope = "/subscription/Get-Your-Own-ID" 
#Assign a role to a resource group 
New-AzRoleAssignment -SignInName jamisbrillx@gmail.com -RoleDefinitionName Reader #-Scope $subscriptionScope 
#Assign a role to a resource group 
New-AzRoleAssignment -SignInName jamisbrillx@gmail.com -RoleDefinitionName Contributor -ResourceGroupName TestRG
#List role assignments at the scope leve 
Get-AzRoleAssignment -ResourceGroupName TestRG | FL DisplayName, RoleDefinitionName 
#List of roles assigned to a user 
Get-AzRoleAssignment -SignInName jamisbrillx@gmail.com | FL RoleDefinitionName, RoleAssignmentID
#Remove the role assignment 
Remove-AzRoleAssignment -SignInName jamisbrillx@gmail.com -RoleDefinitionName "Contributor" -ResourceGroupName TestRG 

