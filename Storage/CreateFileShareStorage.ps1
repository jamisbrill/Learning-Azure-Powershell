#Creating a file share 
Connect-AzAccount
#Vars 
$location = 'Uk South' 
$Rg = Read-Host -Prompt "Enter the Resourcegroup "
$StoAccName = Read-Host -Prompt "Enter a Storage Account Name"
$Filesharename = Read-Host -Prompt "Enter a File Share Name"
$path = 'files'
$Sharename = Read-Host -Prompt "Enter a Share Name"

#get context 
$key = (Get-AzStorageAccountKey -ResourceGroupName $Rg -StorageAccountName $StoAccName ) | Where-Object {$_.KeyName -eq "key1"}
$key = ($key).value
#$key = Convert-String -InputObject $key
$context = New-AzStorageContext -StorageAccountName $StoAccName -StorageAccountKey $key 
#Create a file share 
New-AzStorageShare -Name $Filesharename -Context $context 
#View the file share 
Get-AzStorageShare -Context $context 
#Create a new directory 
New-AzStorageDirectory -ShareName $Filesharename -Path $path -Context $context 

#Test this script. 
