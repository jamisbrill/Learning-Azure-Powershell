#script to create a singular 

$SubscriptionId = ''
$resourceGroupName = "Test-RG"
$location = "Uk South"

$adminSqlLogin = Read-Host "Admin Username"
$sqlpassword = Read-Host "Enter the password for the sql"

$serverName = "SQL-Server-$(Get-Random)"
$DBsuffix = Read-Host "What do you want to call the database?"
$databaseName = "Database-$DBsuffix"

# The ip address range that you want to allow to access your server
$startIp = "0.0.0.0"
$endIp = "0.0.0.0"

# Set subscription 
Set-AzContext -SubscriptionId $subscriptionId 

$resourceGroup = New-AzResourceGroup -Name $resourceGroupName -Location $location

$server = New-AzSqlServer -ResourceGroupName $resourceGroupName `
    -ServerName $serverName `
    -Location $location `
    -SqlAdministratorCredentials $(New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $adminSqlLogin, $(ConvertTo-SecureString -String $password -AsPlainText -Force))


# Create a server firewall rule that allows access from the specified IP range
$serverFirewallRule = New-AzSqlServerFirewallRule -ResourceGroupName $resourceGroupName `
    -ServerName $serverName `
    -FirewallRuleName "AllowedIPs" -StartIpAddress $startIp -EndIpAddress $endIp

# Create a blank database with an S0 performance level
$database = New-AzSqlDatabase  -ResourceGroupName $resourceGroupName `
    -ServerName $serverName `
    -DatabaseName $databaseName `
    -RequestedServiceObjectiveName "S0" `
    -SampleName "AdventureWorksLT"
    







#adapted script from
#https://docs.microsoft.com/en-us/azure/azure-sql/database/scripts/create-and-configure-database-powershell
