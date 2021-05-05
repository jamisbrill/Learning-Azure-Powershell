#Creating config Network sec group 
Connect-AzAccount
# Vars 
$RG='TestRG'
$Location='UK South'
$NSGname = 'AllowHTTP'
#Creatiung the NSG 
New-AzNetworkSecurityGroup -Name $NSGname -ResourceGroupName $RG -Location $Location 
#Create a rule :) 
#New-AzNetworkSecurityGroup -Name $NSGname -ResourceGroupName TestRG -Location $Location 
New-AzNetworkSecurityRuleConfig -Name $NSGname -Description "ALLOW THE HTTP :)" -Access Allow -Protocol Tcp -Direction Inbound -Priority 101 -SourceAddressPrefix Internet -SourcePortRange * -DestinationAddressPrefix * -DestinationPortRange 80 # allow port 80 = http 
  