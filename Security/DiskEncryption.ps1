# Enable disk encryption on a disk... 

$ResourceGroup = "RG"
$vmname = "VM1"
$Location = "Uk South" 
$KeyvaultName = "McKeys"
$Keyvault = Get-AzKeyVault -VaultName $KeyvaultName -ResourceGroupName $ResourceGroup
$diskencryptionkeyvaulturl = $Keyvault.VaultUri
$keyvaultresourceid = $Keyvault.ResourceId 
# create key vault
New-AzKeyVault -Name $KeyvaultName -ResourceGroupName $ResourceGroup -Location $Location -EnabledForDiskEncryption
#enable encryption 
$Keyvault = Get-AzKeyVault -VaultName $KeyvaultName -ResourceGroupName $ResourceGroup

Set-AzVMDiskEncryptionExtension -ResourceGroupName $ResourceGroup -VMName $vmname -DiskEncryptionKeyVaultUrl $Keyvault.VaultUri -DiskEncryptionKeyVaultId $Keyvault.ResourceId
#verify the encyption 
Get-AzVMDiskEncryptionStatus -ResourceGroupName $ResourceGroup -VMName $vmName 
