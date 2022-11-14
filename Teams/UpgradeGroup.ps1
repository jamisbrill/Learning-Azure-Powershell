 # First use CreatM365Group.ps1
 $group = Get-UnifiedGroup -Identity TechnicalSupport@test.com   # Assings the tech supp group to the var 
New-Team -GroupID $group.ExternalDirectoryObjectID -Visibility Private  # change visisiblity of group to private  & convert to team 
