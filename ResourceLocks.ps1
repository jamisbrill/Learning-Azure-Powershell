#Apply resource locks 
Connect-AzAccount
#New-AzResourceLock -Lockname 
New-AzResourceLock -Lockname NoDelete -LockLevel CanNotDelete -LockNotes "You will be unable to delete resources" -ResourceGroupName TestRG 

#view the current locks 
Get-AzResourceLock
#view all the locks for a resource group 
Get-AzResourceLock -ResourceGroupName TestRG 
#Delete a resource Lock 
Remove-AzResourceLock -LockName NoDelete -ResourceGroupName TestRG 

