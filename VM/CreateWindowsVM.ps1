New-AzResourceGroup -Name myResourceGroup -Location EastUS
New-AzVm `
    -ResourceGroupName "VM-RG" `
    -Name "myVM" `
    -Location "Uk South" `
    -VirtualNetworkName "Vnet1" `
    -SubnetName "VMSubnet1" `
    -SecurityGroupName "myNetworkSecurityGroup" `
    -PublicIpAddressName "PublicIpAddress" `
    -OpenPorts 80,3389
    
    $pubip = Get-AzPublicIpAddress -ResourceGroupName "VM-RG" | Select "IpAddress"
    mstsc /v:$pubip #OPens RTP connect to the create VM



#https://docs.microsoft.com/en-us/azure/virtual-machines/windows/quick-create-powershell
#Install-WindowsFeature -name Web-Server -IncludeManagementTools //instal webserver 
