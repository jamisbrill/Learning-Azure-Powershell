
Connect-MicrosoftTeams 
#Create user, add user to team 



#add to team 
#Add-TeamUser -Role Owner -User 

$teamgroupid = Get-Team 

 echo $teamgroupid
 
 echo $teamgroupid.GroupId 

 Add-TeamUser -GroupId $teamgroupid -User sam.towers@.com 
 Start-Sleep -Seconds 20 

 Remove-TeamUser -GroupId $teamgroupid -User sam.towers@.com
