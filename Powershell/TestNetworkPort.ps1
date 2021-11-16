#This script will only work with TCP Connections
$ipaddress = Read-Host "Please enter the ip to test"
$port = Read-Host "Please enter the port to test "
Test-NetConnection -ComputerName $ipaddress -Port $port
