$resourceGroupName = Read-Host -Prompt "Enter the Resource Group name"
$location = Read-Host -Prompt "Enter the location (i.e. ukwest,UkSouth)"
New-AzResourceGroupDeployment -ResourceGroupName $resourceGroupName -TemplateUri 'https://raw.githubusercontent.com/jamisbrill/Learning-Azure-Powershell/main/templates/template.json' -TemplateParameterUri 'https://raw.githubusercontent.com/jamisbrill/Learning-Azure-Powershell/main/templates/parameters.json'
