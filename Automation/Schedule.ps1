New-AzResourceGroup -Name 'StandardAutomationRG' -Location 'South Uk' -Tag @{'Env'='Test'} #create a rg to store the automation stuff in 
New-AzureRmAutomationAccount -ResourceGroupName StandardAutomationRG -Name AzureAutomationAccount -Location "Uk South" #create a automation account 
$TimeZone = ([System.TimeZoneInfo]::Local).Id
New-AzAutomationSchedule -AutomationAccountName "StandardAutomation" -Name "Schedule01" -StartTime "23:00" -OneTime -ResourceGroupName "new" -TimeZone $TimeZone
#Stub please expand. 
# adds a schedule to the automation account/ Requires a automation account ... Needs linking to a run book/Script etc 
