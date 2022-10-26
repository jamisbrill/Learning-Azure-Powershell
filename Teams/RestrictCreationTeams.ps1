$GroupName = "Technical"
$AllowGroupCreation = "False"

Connect-AzureAD   #connect to azure ad 

$settingsObjectID = (Get-AzureADDirectorySetting | Where-object -Property Displayname -Value "Group.Unified" -EQ).id  #

if(!$settingsObjectID){

$template = Get-AzureADDirectorySettingTemplate | Where-object {$_.displayname -eq "group.unified"}

$settingsCopy = $template.CreateDirectorySetting()

New-AzureADDirectorySetting -DirectorySetting $settingsCopy

$settingsObjectID = (Get-AzureADDirectorySetting | Where-object -Property Displayname -Value "Group.Unified" -EQ).id

}


$settingsCopy = Get-AzureADDirectorySetting -Id $settingsObjectID
$settingsCopy["EnableGroupCreation"] = $AllowGroupCreation   #allow group creation is false so sets it. 


if($GroupName)

{ $settingsCopy["GroupCreationAllowedGroupId"] = (Get-AzureADGroup -SearchString $GroupName).objectid

}


Set-AzureADDirectorySetting -Id $settingsObjectID -DirectorySetting $settingsCopy

(Get-AzureADDirectorySetting -Id $settingsObjectID).Values

#https://learn.microsoft.com/en-gb/training/modules/implement-lifecycle-management-governance-for-microsoft-teams/4-manage-microsoft-365-groups-creation
