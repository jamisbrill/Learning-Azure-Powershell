#Creating tags n stuff
Connect-AzAccount
#Check current tags
Get-AzTag 
#Create a new tag 
New-AzTag -Name "IT" -Value "Developer" 
#Assign a tag to a resource group 
Set-AzResourceGroup -Name TestRG -Tag @{IT = 'Production'}
#View the tags again 
Get-AzTag -Name "IT"
#Add tags to resource
$resource = Get-AzResource -ResourceName 'FirstVM' -ResourceGroupName TestRG
Set-AzResource -Tag @{IT = "Developer"} -ResourceId $resource.ResourceId -Force
#remove the tag from the resource group 
Set-AzResourceGroup -Tag @{} -Name TestRG 
#Remove the tag from the resource 
Set-AzResource -Tag @{} -ResourceId $resource.ResourceId -Force 
#remove the tag 
Remove-AzTag -Name "IT" 
