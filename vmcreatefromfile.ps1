$resourceGroupName = Read-Host -Prompt "Enter the Resource Group name"
$location = Read-Host -Prompt "Enter the location (i.e. ukwest,UkSouth)"
New-AzResourceGroupDeployment -ResourceGroupName $resourceGroupName -TemplateFile 'C:\Users\jamis\Documents\Azure\Azure templates\mcVmTemplate\template.json' -TemplateParameterFile "C:\Users\jamis\Documents\Azure\Azure templates\mcVmTemplate\parameters.json"  -Location $location
#find a way to prompt user for password implementation as a safer way to add pass. 
#Creates a virtual machine with the parameters listed in the files.  
