#connect to your azAD account
#Connect-AzAccount
Connect-AzureAD
#Managing Az Ad 
#Check for users named sam :) 
get-azADuser -DisplayName sam
#create a new user account // password in plaintext 
$Password = New-Object -TypeName Microsoft.Open.AzureAD.Model.PasswordProfile 
$Password.Password = 'Danster123'
echo $userpass
New-AzureADUser -DisplayName Danny -Passwordprofile $Password  -UserPrincipalName Danny@jamisbrillxgmail.onmicrosoft.com -MailNickname "BigDanny"
#Check danny has been created
get-azADuser 
