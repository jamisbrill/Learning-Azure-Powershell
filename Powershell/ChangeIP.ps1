
#[int]$ethernetinterface = 


#$ethernetinterface   =  Get-NetAdapter -Name Ethernet | Format-List -Property ifIndex -OutVariable ifIndex

$ethernetinterfaceint   =  Get-NetAdapter -Name Ethernet | Select-Object -ExpandProperty 'ifIndex'

$ethernetinterfaceint


echo "what ip do you want? "
$useripinput = Read-Host   
echo "This will be your ip ..... " $useripinput

echo "IP	CIDR
128.0.0.0	/1
192.0.0.0	/2
224.0.0.0	/3
240.0.0.0	/4
248.0.0.0	/5
252.0.0.0	/6
254.0.0.0	/7
255.0.0.0	/8 (A)
255.128.0.0	/9
255.192.0.0	/10
255.224.0.0	/11
255.240.0.0	/12
255.248.0.0	/13
255.252.0.0	/14
255.254.0.0	/15
255.255.0.0	/16 (B)
255.255.128.0	/17
255.255.192.0	/18
255.255.224.0	/19
255.255.240.0	/20
255.255.248.0	/21
255.255.252.0	/22
255.255.254.0	/23
255.255.255.0	/24 (C)
255.255.255.128	/25
255.255.255.192	/26
255.255.255.224	/27
255.255.255.240	/28
255.255.255.248	/29
255.255.255.252	/30
255.255.255.254	/31
255.255.255.255	/32
"  
echo "what subnetmask do you want?" 

$cidrnotation = Read-Host   #aka subnetmask 
 

Set-NetIPAddress -InterfaceIndex $ethernetinterfaceint -IPAddress $useripinput -PrefixLength $cidrnotation
