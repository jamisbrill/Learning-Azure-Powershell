Upgrade-DistributionGroup -DlIdentities technicalsupport@jam.com, accounting@jam.com
#multiple emails
Get-DistributionGroup| Foreach-Object{
Upgrade-DistributionGroup -DlIdentities $_.PrimarySMTPAddress
}
# Upgrading all eligble DL 

# Distribution List = DL 
