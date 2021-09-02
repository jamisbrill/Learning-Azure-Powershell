#Changing the networking rules of a storage accoutn
#Display the status of the default rule 
(Get-AzStorageAccountNetworkRuleSet -ResourceGroupName "cloud-shell-storage-northeurope" -AccountName "csa1003200102ae7a25").DefaultAction
#Set the storage account to accept no connections 
Update-AzStorageAccountNetworkRuleSet -ResourceGroupName "cloud-shell-storage-northeurope" -Name "csa1003200102ae7a25" -DefaultAction Deny
