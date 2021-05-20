Connect-AzAccount
$RG = New-AzResourceGroup -ResourceGroupName "LoadBalancerRG" -Location "Uk South"
$IP = New-AzPublicIpAddress -ResourceGroupName "LoadBalancerRG" -Location 'UK South' -Name "LoadBalancerpublicIp"

$frontend = New-AzLoadBalancerFrontendIpConfig -Name "FrontEnd1" -PublicIpAddress $IP
$backend = New-AzLoadBalancerBackendAddressPoolConfig -Name "BackEnd1"
$healthProbe = New-AzLoadBalancerProbeConfig -Name "Http-probe" -RequestPath "/" -Protocol Http -Port 80 -IntervalInSeconds 30 -ProbeCount 2 

$loadbalancerRule = New-AzLoadBalancerRuleConfig -Name "LBRule1" -FrontendIpConfiguration $frontend -BackendAddressPool $backend -Protocol TCP -FrontendPort 80 -BackendPort 80 -Probe $healthProbe

$loadbalancer = New-AzLoadBalancer -Name "LoadBalancer" -ResourceGroupName "LoadBalancerRG" -Location 'UK South' -FrontendIpConfiguration $fronend -BackendAddressPool $backend -Probe $healthprobe -LoadBalancingRule $loadbalancerRule


#Still need to validate this script 
