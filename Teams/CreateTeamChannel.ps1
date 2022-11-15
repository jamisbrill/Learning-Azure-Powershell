Get-Team -DisplayName "Technical Support" | New-TeamChannel -DisplayName "FAQ" -Description "A channel for Common issues , clients recieve"  #Identify team that you are going to add a channell to 

Get-Team -DisplayName "Technical Support" | Get-TeamChannel   # list the current channels within this team 
 
 Get-Team -DisplayName "Technical Support" | Set-TeamChannel -CurrentDisplayName "Technical Support" -NewDisplayName "Technical"  # Modify the current team 

Get-Team -DisplayName "Technical Support" | Remove-TeamChannel -DisplayName "Technical" #Remove a channel

Get-Team -DisplayName "Technical Managers" | New-TeamChannel -DisplayName "TechMan" -Description "Organising the tech team" -MembershipType Private

