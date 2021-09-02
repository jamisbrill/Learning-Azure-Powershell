#Creating a file share 
Connect-AzAccount
#Vars 
$location = 'Uk South' 
$Rg = 'TestRG' 
$StoAccName = 'storage777sam' 
$Filesharename = 'simpleshare'
$path = 'files'
$Sharename = 'simpleshare'

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
# Upload a file to the azure file share 
Set-AzStorageFileContent -ShareName $Sharename -Source "C:\Users\jamis\documents\mcgeneratorsettings.json" -Path $path -Context $context 
#View the file that was just uploaded
Get-AzStorageFile -ShareName $Sharename -Path $path -Context $context | Get-AzStorageFile
#Download a file to the local system 
Get-AzStorageFileContent -ShareName $Sharename -Path "files\mcgeneratorsettings.json" -Destination "C:\Users\jamis\Desktop\mcgeneratorsettings.json" -Context $context 
 



