# A Virtual machines deploy that prompts the user for a custom deplotment 
$resourceGroupName = Read-Host -Prompt "Mc"
$location = Read-Host -Prompt "centralus"
$adminUsername = Read-Host -Prompt "jam"
$adminPassword = Read-Host -Prompt "password" -AsSecureString  #Please change this .... (Probably wont let you use this pass) 
#$dnsLabelPrefix = Read-Host -Prompt "Enter an unique DNS name for the public IP"

New-AzResourceGroup -Name $resourceGroupName -Location "$location"
New-AzResourceGroupDeployment `
    -ResourceGroupName $resourceGroupName `
    -TemplateUri "https://raw.githubusercontent.com/jamisbrill/Learning-Azure-Powershell/main/templates/SimpleVM1.json" `
    -adminUsername $adminUsername `
    -adminPassword $adminPassword `
    -dnsLabelPrefix $dnsLabelPrefix

 (Get-AzVm -ResourceGroupName $resourceGroupName).name
