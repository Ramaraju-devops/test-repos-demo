## This Script will check all the resource groups and update with the new tags

#Connect-AzAccount

Select-AzSubscription -Subscription 13917d14-a7e0-4435-8830-403a28246744

$ResourceGroups = Get-AzResourceGroup

#Write-Output $ResourceGroups.ResourceId
#$rgnames = $ResourceGroups.ResourceGroupName

$resourceids = $ResourceGroups.ResourceId

Write-Output $ResourceGroups.ResourceId

$newtags = @{"owner"="rama"; "source"="local ps"}

foreach ($rscid in $resourceids)
{
   
   Write-Output $rscid
   Update-AzTag -ResourceId $rscid -Tag $newtags -Operation Merge

}

# this is for testing git changes 001
