## This Script will check all the resource groups and update with the new tags

#Connect-AzAccount

Select-AzSubscription -Subscription 13917d14-a7e0-4435-8830-403a28246744


$ResourceGroups = Get-AzResourceGroup

#Write-Output $ResourceGroups.ResourceId

$resourceids = $ResourceGroups.ResourceId

$newtags = @{"testscript"="nov24"; "purpose"="powershell24" }

foreach ($resid in $resourceids)
{
   
   Write-Output $resid
   Update-AzTag -ResourceId $resid -Tag $newtags -Operation Merge


   Write-Output "updated the tags successfully $resourceid"
}


# this is for testing git changes 001