$groupId = (Get-UnifiedGroup <TechnicalSupport@test.com>).ExternalDirectoryObjectID   #Change the membership type of a group
$dynamicMembershipRule = ‘user.department -eq "Technical Support"’   # Setup dyanmic membership rule condition

Set-AzureAdMsGroup -Id $groupId -GroupTypes $groupTypes.ToArray() -MembershipRuleProcessingState "On" -MembershipRule $dynamicMembershipRule   #Turn dynamic rules on the group 

groupTypes = (Get-AzureAdMsGroup -Id $groupId).GroupTypes
$groupTypes.Add("DynamicMembership")  

#get the group types of the existing group and add the String "dynamicMembership"
