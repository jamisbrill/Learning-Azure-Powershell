#Add a data disk 
#vars
$resourceGroup = "TestRG" 
$location = 'Uk South'
$vmName = 'VM1'
$storageType = 'Premium_LRS'
$dataDiskName = $vmName+'_DataDisk1'
#Create the disk 
$diskconfig = New-AzDiskConfig -SkuName $storageType -Location $location -CreateOption Empty -DiskSizeGB 5 
$dataDisk1 = New-AzDisk -DiskName $dataDiskName -Disk $diskconfig -ResourceGroupName $resourceGroup
#Update the VM 
$vm = get-AzVM -Name $vmName -ResourceGroupName $resourceGroup 
$vm = Add-AzVMDataDisk -VM $vm -Name $dataDiskName -CreateOption Attach -ManagedDiskId $dataDisk1.id -lun 1
 
Update-AzVM -VM $vm -ResourceGroupName $resourceGroup 
#View the disk 
Get-AzDisk -ResourceGroupName $resourceGroup -DiskName $dataDiskName 
#initialise the disk manually 
