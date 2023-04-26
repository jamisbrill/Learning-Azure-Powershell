#Script for creating a new call park policy & assigning it 
New-CsTeamsCallParkPolicy -Identity "TechnicalSupportPolicy" -AllowCallPark $true -PickupRangeStart 11 -PickupRangeEnd 15 -ParkTimeoutSeconds 300
Grant-CsTeamsCallParkPolicy -PolicyName "SalesPolicy" -Identity WicketWarrick@trustlabs.co.uk


#Turn off & delete 
#Set-CsTeamsCallParkPolicy -Identity "TechnicalSupportPolicy" -AllowCallPark $false
#Remove-CsTeamsCallParkPolicy -Identity "TechnicalSupportPolicy"
