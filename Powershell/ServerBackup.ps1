#Check for web server
Get-WindowsFeature -Name Web-Server
#Install webserver
Get-WindowsFeature -Name Web-Server | Install-WindowsFeature 
#install Win backup
Get-WindowsFeature -Name Windows-Server-Backup | Install-WindowsFeature 
#Creatin a backup
$policy = New-WBPolicy
$Filespec = New-WBFileSpec -FileSpec "C:\Users\jamis\Desktop\Ark Backup\text.txt"
#$Disks = Get-WBDisk #getdiskname 
#echo $Disks 
#$DiskBackupLocation = New-WBBackupTarget -Disk $Disks[0] 

$backuplocation = New-WBBackupTarget -VolumePath "C:" #Example
Add-WBBackupTarget -Policy $policy -Target $backuplocation
Add-WBFileSpec -Policy $policy -FileSpec $Filespec 
 
Set-WBSchedule -Policy $policy 09:00 #Run at 9oclock
Set-WBPolicy -Policy $policy  #Set the policy
$backuppolicy = Get-WBPolicy  
Start-WBBackup -Policy $backuppolicy #Force Run 

#Error // Connect Extra Drive Required / Shared Folder  https://docs.microsoft.com/en-us/powershell/module/windowsserverbackup/add-wbbackuptarget?view=windowsserver2019-ps
##Set-WBPolicy : The backup storage location is invalid. You cannot use a volume 
##that is included in the backup as a storage location.
