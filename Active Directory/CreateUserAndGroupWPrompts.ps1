#For creating singular users and assigning them to a newly created group // Not the most convenient script.
#Variables
$password = Read-Host "Please enter the password for the user"
$username = Read-Host "please enter the username"
$mailNickName = $username 
$domain = Read-Host "Enter the domain of the Az Ad Instance" 
$at = "@" # part of the concatenation of strings 
$userPrincipalName = $username+$at+$domain #  concat strings
$groupDisplayName = Read-Host "Please enter te groups name "  # variable for group name

Connect-AzureAD


New-AzADGroup -DisplayName $groupDisplayName -MailNickname $groupDisplayName #create a new group 

$SecureStringPassword = ConvertTo-SecureString -String $password -AsPlainText -Force  #Example password 
New-AzADUser -DisplayName $username -UserPrincipalName $userPrincipalName -Password $SecureStringPassword -MailNickname $mailNickName

Add-AzADGroupMember -MemberUserPrincipalName $userPrincipalName -TargetGroupDisplayName $groupDisplayName  #add the user you just created and add them to the group 

