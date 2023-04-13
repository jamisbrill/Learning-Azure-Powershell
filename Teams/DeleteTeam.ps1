#Permanently delete a team, has to be deleted first. 
Get-AzureADMSDeletedGroup
Remove-AzureADMSDeletedDirectoryObject -Id <objectId>
#replace objectid with id given in first cmdlet 
