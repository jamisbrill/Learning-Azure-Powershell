#Get the details of the users in the current teams. 

try { $null = Get-CsTenant } catch { Connect-MicrosoftTeams } {echo "Signing into teams" }

$Teams = Get-Team

#create directory to store csv in 
New-Item "C:\temp\" -itemType Directory

#place in this directory

$FolderPath = 'c:\temp\uniqueusers.csv'
#Create variable array
$users = @()


#iterate through all the users 
ForEach( $i in $Teams.GroupId){

$users += Get-TeamUser -GroupId $i

}
echo $users
#Remove duplicates?  
$uniqUsers = $users | sort UserId -Unique
#export the data from variable into 
$uniqUsers | Export-Csv -Path $FolderPath 

#adapted script https://dailysysadmin.com/KB/Article/3607/microsoft-teams-powershell-commands-to-list-all-members-and-owners/
