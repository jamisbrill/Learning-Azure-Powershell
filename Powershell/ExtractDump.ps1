#Script to go thru archives and extract the data // migrate the files first cut n past to folder 


cd \\192.168.1.50\Random\games\ # set the current directory to the one with the games in it 
Move-Item -Path C:\192.168.1.50\Random\games\ -Destination "D:\UserFiles\Games\Xbox Games"
Get-ChildItem -Path ".\*.iso" -Recurse | Move-Item -Destination "D:\UserFiles\Games\Xbox Games"
 
Get-CimInstance -ClassName Win32_LogicalDisk | Select-Object -Property DeviceID,@{'Name' = 'FreeSpace (GB)'; Expression= { [int]($_.FreeSpace / 1GB) }}
# output current space on disk ... to avoid dissapointment  

$filePath = "D:\UserFiles\Games\Xbox Games" 
$files = Get-ChildItem "D:\UserFiles\Games\Xbox Games" 

#foreach ($f in $files){
#    $outfile = $f.FullName + "out" 
#    Get-Content $f.FullName | Where-Object { ($_ -match 'step4' -or $_ -match 'step9') } | Set-Content $outfile
#}

$fileNames = Get-ChildItem -Path $filePath -Recurse -Include *.iso




$data[1] ##array to store the file paths 


Get-ChildItem  "D:\UserFiles\Games\Xbox Games" -Filter *.txt -Recurse | % { $_.FullName }

cd "D:\UserFiles\Games\Xbox Games"
$fileint = (Get-ChildItem | Measure-Object).Count # count the number of files and set that as the integer to use for the for loop 
$filepath = ""


for ($fileint; <Condition>; fileint++)
{
  
  Expand-Archive 

  
  
}
