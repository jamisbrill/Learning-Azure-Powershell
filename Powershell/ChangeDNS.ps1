#Set-DNSClientServerAddress –interfaceIndex 12 –ServerAddresses (“192.168.1.50”,”192.168.1.1”)
Set-DNSClientServerAddress –interfaceIndex 8 –ServerAddresses (“192.168.1.50”,"192.168.1.1")
Get-NetIPInterface #-InterfaceAlias
