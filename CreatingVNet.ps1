Connect-AzAccount
New-AzResourceGroup -Name TestRG2 -Location 'UK West'
New-AzVirtualNetwork -ResourceGroupName TestRG2 -Name 'vnet' -AddressPrefix '10.0.0.0/16' -Location 'UK West'


#two ways to layout the command.  using the grave key (top left of keyboard) 

New-AzVirtualNetwork -ResourceGroupName TestRG2 `
 -Name 'vnet3' `
  -AddressPrefix '10.0.0.0/16' `
  -Location 'UK West'

  # Create a peer from one vnet to another
  Add-AzVirtualNetworkPeering -Name 'peertopeer' -VirtualNetwork 'vnet1' -RemoteVirtualNetworkId 'vnet'.Id
  #


  #delete what we just made lol 
  Remove-AzResourceGroup -Name TestRG2 -Force





 #  changing subnet name or something 
 # Variables
 $RG ='gang' 
 $Location = 'Uk South' 
 $VNetName = 'Vnet' 

 # Create Resource Gruop
 New-AzResourceGroup -Name $RG -Location $Location 
 # Create the Virtual Network (This will run the command + Append it to a var) 
 $virtualNetwork = New-AzVirtualNetwork -ResourceGroupName $RG -Location $Location -Name $VNetName -AddressPrefix 10.5.0.0/16


 # Create some subnets
 Add-AzVirtualNetworkSubnetConfig -Name subnet1 -AddressPrefix 10.5.0.0/24 -VirtualNetwork $virtualNetwork 
 Add-AzVirtualNetworkSubnetConfig -Name subnet2 -AddressPrefix 10.5.1.0/24 -VirtualNetwork $virtualNetwork 


 # Link the subnets to virtual network 
 Set-AzVirtualNetwork -VirtualNetwork $virtualNetwork 


 #Remove the vnet 
 Remove-AzVirtualNetwork -Name $VnetName -ResourceGroupName $RG