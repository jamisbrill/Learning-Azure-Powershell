Connect-AzureAD # log in to the AzAD instance 
[system.io.directory]::CreateDirectory(“D:\ADusers\”) #create a folder to store list of all the users 

Get-AzureADUser -All $true | Export-Csv D:\ADusers\AllUsers.csv #Create a file and export it to csv and save it to the listed location
Import-CSV D:\ADusers\AllUsers.csv | Foreach-Object { Remove-AzureADUser -ObjectId $_.UserPrincipalName } # go through each user and delete them 
Remove-Item 'D:\ADusers\'  # Delete the folder that was created // Clean up the dir 


#you may need adjust drive and add the folder 

#script needs fixing
