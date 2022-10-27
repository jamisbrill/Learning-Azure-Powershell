$Setting = Get-AzureADDirectorySetting -Id (Get-AzureADDirectorySetting | where -Property DisplayName -Value "Group.Unified" -EQ).id
$Setting.Values   # get current naming policies 

$Setting["PrefixSuffixNamingRequirement"] ="The_[GroupName]"  #add prefix

$Setting["CustomBlockedWordsList"]="Payroll,CEO"  #block words for group name 

Set-AzureADDirectorySetting -Id (Get-AzureADDirectorySetting | where -Property DisplayName -Value "Group.Unified" -EQ).id -DirectorySetting $Setting
# update the config 
