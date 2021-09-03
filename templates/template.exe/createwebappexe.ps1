Connect-AzAccount

#create a resourcegroup to put the web app in 
$resourceGroupName = "WebAppRG"
New-AzResourceGroup `
  -Name $resourceGroupName `
  -Location "Central US"

$templateFile = Read-Host -Prompt "Enter the template file path and file name"
$templateparameterFile = Read-Host -Prompt "Enter the template parameter file path and file name"

New-AzResourceGroupDeployment `
  -Name DeployLocalTemplate `
  -ResourceGroupName $resourceGroupName `
  -TemplateFile $templateFile `
  -TemplateParameterFile $templateparameterfile `
  -verbose
