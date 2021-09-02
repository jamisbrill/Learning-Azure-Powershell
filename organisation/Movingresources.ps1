#Moving Resources Across resource groups
Get-AzResource -ODataQuery "`$filter=resourcegroup eq 'TestRG'" | Format-Table -Property ResourceID 
#Move the resource 
Move-AzResource -DestinationResourceGroupName "NewTestRG" -ResourceId "/subscriptions/ResourceID/resourceGroups/TestRG/providers/Microsoft.Network/virtualNetworks/TestRG-vnet"  # Put a resource id here 
#Check on the resource we just moved
Get-AzResource -ODataQuery "`$filter=resourcegroup eq 'NewTestRG'" | Format-Table -Property ResourceID 

