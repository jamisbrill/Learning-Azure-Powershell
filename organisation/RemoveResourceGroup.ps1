#Delete and remove all content in and the resourcegroup. 
$ResourceGroup = Read-Host -Prompt "Enter the Resourcegroup " #enter the name of the RG (select RG) 
Write-Output "ResourceGroup will be deleted"  -Confirm
Remove-AzResourceGroup $ResourceGroup -Force -Verbose #Delete the selected resourcegroup 
