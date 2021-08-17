$TimeZone = ([System.TimeZoneInfo]::Local).Id
New-AzAutomationSchedule -AutomationAccountName "StandardAutomation" -Name "Schedule01" -StartTime "23:00" -OneTime -ResourceGroupName "new" -TimeZone $TimeZone
#Stub please expand. 
# adds a schedule to the automation account/ Requires a automation account ... Needs linking to a run book/Script etc 
