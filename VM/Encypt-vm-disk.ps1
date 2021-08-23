#Encrypt a disk 
#Vars
$resourceGroup = 'TestRG'
$vmname = 'VM12'
$loation = 'Uk South' 
$keyvaultname = 'kv1'
$keyvault = Get-AzKeyVault -VaultName $keyvaultname -ResourceGroupName $resourceGroup
$diskencryptkeyvaulturl = $keyvault.VaultUri 
$keyvaultResourceId = $keyvault.ResourceId 
#Create a key vault
New-AzKeyVault -Name $keyvaultname -ResourceGroupName $resourceGroup -Location $location -EnabledForDiskEncryption
#Enable encyption
$keyvault = Get-AzKeyVault -VaultName $keyvaultname -ResourceGroupName $resourceGroup
Set-AzVMDiskEncryptionExtension -ResourceGroupName $resourceGroup -VMName $vmname -DiskEncryptionKeyVaultUrl $keyvault.VaultUri -DiskEncryptionKeyVaultId $keyvault.ResourceId
#verify the encyption
Get-AzVMDiskEncryptionStatus -ResourceGroupName $resourceGroup -VMName $vmname 
#Disable encyption
Disable-AzVMDiskEncryption -ResourceGroupName $resourceGroup -VMName $vmname 
