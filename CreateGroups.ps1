#connect to your azAD account 
Connect-AzureAD
#Create a group
New-AzADGroup -DisplayName "ComputerEngineers" -MailNickname ComputerEngineers
#Add members to the group 
Add-AzADGroupMember -MemberUserPrincipalName "Sam@jamisbrillxgmail.onmicrosoft.com" -TargetGroupDisplayName ComputerEngineers 
Get-AzADGroupMember -GroupDisplayName ComputerEngineers
