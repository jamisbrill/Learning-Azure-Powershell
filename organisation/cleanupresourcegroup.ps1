
$ResourceGroup = Read-Host -Prompt "Enter the Resourcegroup " #enter the name of the RG (select RG) 
Get-AzResource -ResourceGroupName $ResourceGroup  #Check the resource first
Remove-AzResourceGroup $ResourceGroup -Force -Verbose #Delete the selected resourcegroup 
New-AzResourceGroup -Name $ResourceGroup -Location 'Uk South' -Tag @{'Environment'='Development'} # Replace the group 
#This script will remove the resources within a RG + recreate the RG . (There may be a better way to do this) 
