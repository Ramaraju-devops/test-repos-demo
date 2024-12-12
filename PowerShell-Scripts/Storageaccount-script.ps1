## This Script will check all the storageAccounts and disable the Blob Public Access 

#Connect-AzAccount

Select-AzSubscription -Subscription 13917d14-a7e0-4435-8830-403a28246744

$ResourceGroups = Get-AzResourceGroup

# Write-Output $ResourceGroups.name

$RGnames = $ResourceGroups.ResourceGroupName #list the resource group names

foreach ($RG1 in $RGnames)
{
    Write-Output $RG1 # this is first RGname from list of RGs
    $StorageAccount = Get-AzResource -ResourceGroupName $RG1 -ResourceType "Microsoft.Storage/storageAccounts"

    $StorageAccountNames = $StorageAccount.Name

        foreach ($StorageAccountName in $StorageAccountNames)
            
            {
			
			Write-Host $StorageAccountName
			
            $Status = (Get-AzStorageAccount -Name $StorageAccountName -ResourceGroupName $RG1 ).AllowBlobPublicAccess

            Write-Host "$StorageAccountName - $Status"

            if($Status -eq "True")  #check if my storage account is enabled 
                {
                    
                    Set-AzStorageAccount -AccountName $StorageAccountName `
                      -ResourceGroupName $RG1 `
                     -AllowBlobPublicAccess $false

                     $Status = (Get-AzStorageAccount -Name $StorageAccountName -ResourceGroupName $RG1 ).AllowBlobPublicAccess
                     Write-Host "$StorageAccountName - $Status"

                }
            else
                {

                    Write-Host "$StorageAccountName AllowBlobPublicAccess is Already Disabled"
                }

                
           }


}
