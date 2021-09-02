#Create a vpn gateway
#Requires a virtual network to start 
#Script still needs validating 
Connect-AzAccount
$RG = "TestRG2"
$Location = "UK South" 
$VnetName = "UkSouthVnet"
#Create the gateway subnet
$vnet = Get-AzVirtualNetwork -ResourceGroupName $RG -name $VnetName 
Add-AzVirtualNetworkSubnetConfig -Name "GatewaySubnet" -AddressPrefix 10.2.1.0/27 -VirtualNetwork $vnet 
$vnet | Set-AzVirtualNetwork 
#Get public ip address 
$Gatewayip = New-AzPublicIpAddress -Name USWIP -ResourceGroupName $RG -Location $Location 
#Creat the gateway ip address config
$vnet = Get-AzVirtualNetwork -Name $VnetName -ResourceGroupName $RG 
$subnet = Get-AzVirtualNetworkSubnetConfig -Name "GatewaySubnet" -VirtualNetwork $vnet
$gatewayipconfiguration = New-AzVirtualNetworkGatewayIpConfig -Name  gatewayipconfiguration1 -SubnetId $subnet -PublicIpAddressId $Gatewayip id
#Create the VPN gateway 
New-AzVirtualNetworkGateway -Name UKSW -ResourceGroupName $RG -Location $Location -IpConfigurations $gatewayipconfiguration -GatewayType Vpn -VpnType RouteBased -GatewaySku VpnGw1 









