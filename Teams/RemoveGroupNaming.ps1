$Setting["PrefixSuffixNamingRequirement"] =""  # remove group prefixes 
$Setting["CustomBlockedWordsList"]=""  #remove block words
Set-AzureADDirectorySetting -Id (Get-AzureADDirectorySetting | where -Property DisplayName -Value "Group.Unified" -EQ).id -DirectorySetting $Setting  #save
