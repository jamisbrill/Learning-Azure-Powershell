Get-AzResourceGroup TestRG #check resourceGroupExists 
#create storage account 
 New-AzStorageAccount -name filestorestorage5 -ResourceGroupName TestRG -SkuName Standard_LRS -location "Uk South" -kind Storagev2
  
 #Adjust to ZRS
Set-AzStorageAccount -ResourceGroupName TestRG  -AccountName filestorestorage5  -SkuName Standard_GRS

#delete storage account
Get-AzStorageAccount #check storage accountexists before deleting
Remove-AzStorageAccount -name filestorestorage5 -ResourceGroupName TestRG
