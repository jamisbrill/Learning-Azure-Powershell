New-AzResourceGroup -Name "LinuxVmRG" -Location "EastUS"


New-AzVm `
    -ResourceGroupName "LinuxVmRG" `
    -Name "UbuntuVM" `
    -Location "Uk South" `
    -Image UbuntuLTS `
    -size Standard_B2s `
    -PublicIpAddressName myPubIP `
    -OpenPorts 80,22 `
    -GenerateSshKey `
    -SshKeyName mySSHKey
    
Get-AzPublicIpAddress -ResourceGroupName "LinuxVmRG" | Select "IpAddress"
#Private key is saved to /home/user/.ssh/1234567891
#Open SSH Client 
#ssh -i ~/.ssh/1234567891 azureuser@10.111.12.123
