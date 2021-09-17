#Script to go thru archives and extract the data // migrate the files first cut n past to folder 




Get-ChildItem  "D:\UserFiles\Games\Xbox Games" -Filter *.txt -Recurse | % { $_.FullName }

cd "D:\UserFiles\Games\Xbox Games"
$fileint = (Get-ChildItem | Measure-Object).Count # count the number of files and set that as the integer to use for the for loop 
$filepath = ""


for ($fileint; <Condition>; fileint++)
{
  
  Expand-Archive 

  
  
}
