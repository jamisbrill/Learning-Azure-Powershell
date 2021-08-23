Set-AzVMExtension -ResourceGroupName Mc -Location uksouth -Publisher "Microsoft" -VMName VM1 -ExtensionType Microsoft.Azure.Extensions.CustomScript


#Notes 
#Comeback to this later 
#Get-AzVMExtensionImage -Type IaaSAntimalware -PublisherName "Microsoft.Azure.Security" -Location "CentralUS"
#https://docs.ukcloud.com/articles/azure/azs-how-configure-custom-script-extension.html?tabs=tabid-1%2Ctabid-a
