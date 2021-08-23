#Setup vars for az automation
$AzureAutomationAccountName = AzureAutomationAccount
$runbookName = StartVM
$scheduleName = StartVmSchedule

#Create an Azure Automation runbook
New-AzResourceGroup -Name 'StandardAutomationRG' -Location 'Uksouth' -Tag @{'Env'='Test'} #create a rg to store the automation stuff in 
New-AzAutomationAccount -ResourceGroupName StandardAutomationRG -Name AzureAutomationAccount -Location "Uk South" #create a automation account 
$TimeZone = ([System.TimeZoneInfo]::Local).Id #get the local timezone 

New-AzAutomationRunbook -Name RetrieveData_SendMail -Type PowerShell -ResourceGroupName StandardAutomationRG -AutomationAccountName AzureAutomationAccount 
Import-AZAutomationRunbook -Name "StartVM" -Path "C:\Users\jamis\Documents\Azure\Powershell\StartVm.ps1" -Type PowerShell -ResourceGroupName StandardAutomationRG -AutomationAccountName AzureAutomationAccount –Force

#see if we can add a URL Path to github instead  #This will append the script to the the run book 
Publish-AzAutomationRunbook -AutomationAccountName AzureAutomationAccount -ResourceGroupName StandardAutomationRG -Name "Start VM" #publish the automation script. 
New-AzAutomationSchedule -AutomationAccountName "AzureAutomationAccount" -Name "StartVmSchedule" -StartTime "6:40" -ResourceGroupName "StandardAutomationRG" -TimeZone $TimeZone -DayInterval 1
#link to the schedule to the runbook 
Register-AzureAutomationScheduledRunbook –AutomationAccountName $automationAccountName –Name $runbookName –ScheduleName $scheduleName #–Parameters $params
#Not sure what the params are for.... 

#Stub please expand. 
# adds a schedule to the automation account/ Requires a automation account ... Needs linking to a run book/Script etc 
# Needs testing 22/08/21 
#powershell script deploys fine but wont run ? ?
# Start-AzVm : The term 'Start-AzVm' is not recognized as the name of a cmdlet, function, script file, or operable program. Check the spelling of the name, or if a path was included, verify that the path is correct and try again. At line:1 char:1 + Start-AzVm -ResourceGroupName "Mc" -Name McVM1 #Allocate + ~~~~~~~~~~ + CategoryInfo : ObjectNotFound: (Start-AzVm:String) [], CommandNotFoundException + FullyQualifiedErrorId : CommandNotFoundException
