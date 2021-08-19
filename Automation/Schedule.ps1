#Create an Azure Automation runbook
New-AzResourceGroup -Name 'StandardAutomationRG' -Location 'South Uk' -Tag @{'Env'='Test'} #create a rg to store the automation stuff in 
New-AzureAutomationAccount -ResourceGroupName StandardAutomationRG -Name AzureAutomationAccount -Location "Uk South" #create a automation account 
$TimeZone = ([System.TimeZoneInfo]::Local).Id

New-AzureAutomationRunbook -Name RetrieveData_SendMail -Type PowerShell -ResourceGroupName StandardAutomationRG -AutomationAccountName AzureAutomationAccount 


Import-AzureAutomationRunbook -Name "Start VM" -Path "D:\GetData.ps1" -Type PowerShell -ResourceGroupName StandardAutomationRG -AutomationAccountName AzureAutomationAccount –Force
#see if we can add a URL Path to github instead  #This will append the script to the the run book 


Publish-AzureAutomationRunbook -AutomationAccountName AzureAutomationAccount -ResourceGroupName StandardAutomationRG -Name "Start VM" #publish the automation script. 


New-AzAutomationSchedule -AutomationAccountName "StandardAutomation" -Name "Schedule01" -StartTime "23:00" -OneTime -ResourceGroupName "new" -TimeZone $TimeZone

#Stub please expand. 
# adds a schedule to the automation account/ Requires a automation account ... Needs linking to a run book/Script etc 
