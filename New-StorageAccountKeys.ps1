#Manually rotate access keys

#store the first key in the var
$storageAccountKey =    (Get-AzStorageAccountKey -ResourceGroupName cloud-shell-storage-northeurope -Name csa1003200102ae7a25 ).Value[0]
echo $storageAccountKey #check the key 
#Manually rotate access keys
#Update the connection strings in your apps code to use key 2
New-AzStorageAccountKey -ResourceGroupName cloud-shell-storage-northeurope -Name csa1003200102ae7a25 -KeyName key1  #Regen key 1
#Update the connection strings in your apps code to use key 1
New-AzStorageAccountKey -ResourceGroupName cloud-shell-storage-northeurope -Name csa1003200102ae7a25 -KeyName key2  #Regen key 2
