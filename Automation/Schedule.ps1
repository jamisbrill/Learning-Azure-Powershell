#Create an Azure Automation runbook
New-AzResourceGroup -Name 'StandardAutomationRG' -Location 'Uksouth' -Tag @{'Env'='Test'} #create a rg to store the automation stuff in 
New-AzAutomationAccount -ResourceGroupName StandardAutomationRG -Name AzureAutomationAccount -Location "Uk South" #create a automation account 
$TimeZone = ([System.TimeZoneInfo]::Local).Id #get the local timezone 

New-AzAutomationRunbook -Name RetrieveData_SendMail -Type PowerShell -ResourceGroupName StandardAutomationRG -AutomationAccountName AzureAutomationAccount 
Import-AZAutomationRunbook -Name "Start VM" -Path "C:\Users\jamis\Documents\Azure\Powershell\StartVm.ps1" -Type PowerShell -ResourceGroupName StandardAutomationRG -AutomationAccountName AzureAutomationAccount –Force

#see if we can add a URL Path to github instead  #This will append the script to the the run book 
Publish-AzAutomationRunbook -AutomationAccountName AzureAutomationAccount -ResourceGroupName StandardAutomationRG -Name "Start VM" #publish the automation script. 
New-AzAutomationSchedule -AutomationAccountName "StandardAutomation" -Name "Schedule01" -StartTime "21:40" -ResourceGroupName "StandardAutomationRG" -TimeZone $TimeZone

#Stub please expand. 
# adds a schedule to the automation account/ Requires a automation account ... Needs linking to a run book/Script etc 
# Needs testing 22/08/21   
