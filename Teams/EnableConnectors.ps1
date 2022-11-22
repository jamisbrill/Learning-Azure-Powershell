Set-OrganizationConfig -ConnectorsEnabled:$true
Set-OrganizationConfig -ConnectorsEnabledForTeams:$true
Set-OrganizationConfig -ConnectorsActionableMessagesEnabled:$true

#Set-OrganizationConfig -ConnectorsEnabled:$false. disable connectors 
#Set-OrganizationConfig -ConnectorsActionableMessagesEnabled:$false. disable actionable messages for the tenant.

