 # Vm stop script to store the valye 
 $checkfilebool = Test-Path -Path .\VMNameVars.txt -PathType Leaf #true or false whether file exists or not. 

if ( !$checkfilebool ) #if file has not been created , create it
{
 $VMName = Read-Host "Please enter the virtual machine name" # prompt the user to enter the name of the virtual machine 
}
 
echo $VMName| Out-File -FilePath .\VMNameVars.txt  # put the virtual machine name in a file to save for later 
Get-Content -Path .\VMNameVars.txt # output the virtual machine name to a file to store for later 

Stop-AzVM -ResourceGroupName "ResourceGroup" -Name $VMName #Deollocate the vm  
 
