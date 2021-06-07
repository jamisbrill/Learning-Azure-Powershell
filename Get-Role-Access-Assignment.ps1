#Get Role Information from resource , object , users. 
Get-AzRoleAssignment -SignInName "Samx@jamisbrillxgmail.onmicrosoft.com" | FL DisplayName, RoleDefinitionName, Scope
#Get Roleassignment from a resource
Get-AzRoleAssignment -scope "/subscriptions/SUBID/resourceGroups/cloud-shell-storage-northeurope/providers/Microsoft.Storage/storageAccounts/csa1003200102ae7a25"
#Get Roleassignment from a resourcegroup
Get-AzRoleAssignment -ResourceGroupName TestRG 
