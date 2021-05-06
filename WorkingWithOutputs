#get services on this pc
Get-Service | Format-List *
Get-Service | Format-Table DisplayName, Status, RequiredServices

#Pipe to a file 
Get-Service | out-file C:\Users\jamis\Documents\servicelist.txt
Get-Service | export-csv C:\Users\jamis\Documents\servicelist.csv

#Grid View 

Get-Service | Out-GridView

#get services on this pc
Get-Service -examples
