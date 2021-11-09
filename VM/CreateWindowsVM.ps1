New-AzResourceGroup -Name myResourceGroup -Location EastUS
New-AzVm `
    -ResourceGroupName "myResourceGroup" `
    -Name "myVM" `
    -Location "East US" `
    -VirtualNetworkName "myVnet" `
    -SubnetName "mySubnet" `
    -SecurityGroupName "myNetworkSecurityGroup" `
    -PublicIpAddressName "myPublicIpAddress" `
    -OpenPorts 80,3389
    
    $pubip = Get-AzPublicIpAddress -ResourceGroupName "myResourceGroup" | Select "IpAddress"
    mstsc /v:$pubip #OPens RTP connect to the create VM



#https://docs.microsoft.com/en-us/azure/virtual-machines/windows/quick-create-powershell
#Install-WindowsFeature -name Web-Server -IncludeManagementTools //instal webserver 
