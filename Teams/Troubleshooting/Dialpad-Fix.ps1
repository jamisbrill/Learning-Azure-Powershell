#Dial pad is missing in Teams


# So it only runs connect to teams once 
# checks whether tenant is there 
try { $null = Get-CsTenant } catch { Connect-MicrosoftTeams } {echo "Signing into teams" }

#Run Test -> Dial pad missing
#If Enterprise Voice shows Disabled
Echo "Please enter email of user"
$email = read-host
Set-CsPhoneNumberAssignment -Identity "$username" -EnterpriseVoiceEnabled $False
Set-CsPhoneNumberAssignment -Identity "$username" -EnterpriseVoiceEnabled $True
#Toggle on and off to force an update to the backend


#If tool shows the user isnt configured correctly with routing policy 
#Direct Routing-enabled users missing dial pad
Grant-CsOnlineVoiceRoutingPolicy -Identity "$username" -PolicyName $Null
Grant-CsOnlineVoiceRoutingPolicy -Identity "$username" -PolicyName "RedmondOnlineVoiceRoutingPolicy"
