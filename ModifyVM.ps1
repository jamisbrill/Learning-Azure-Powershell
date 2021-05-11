Connect-AzAccount
#check for azure vms 
Get-AzVM 
$vm = Get-AzVM 
$vmRGname = $vm.resourceGroupName #Check the resource group name
$vm.HardwareProfile.VmSize = "standard_A3"
echo $vmRGname
Update-AzVM -vm $vm -ResourceGroupName $vmname
