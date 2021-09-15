 
 
 $checkfilebool = Test-Path -Path .\VMNameVars.txt -PathType Leaf

 
if ( !$checkfilebool )
{
 $VMName = Read-Host "Please enter the virtual machine name"
}
 
 echo $VMName| Out-File -FilePath .\VMNameVars.txt
 Get-Content -Path .\VMNameVars.txt # output the virtual machine name to a file to store for later 

 
 Stop-AzVM -ResourceGroupName "ResourceGroup" -Name $VMName #Deollocate the vm  
 
 
 #test if loop etc 15/09/21 
