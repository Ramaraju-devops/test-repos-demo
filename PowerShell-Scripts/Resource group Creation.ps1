Login-AzAccount
Select-AzSubscription -Subscription "subscription-name"
New-AzResourceGroup -Location "West Europe" -Name resourcegroupname -Tag @{IteraplanID="*******"; Owner="********"; Owner_Email="****@***"; Environment = "Production" } -Force


$rgname = "testlocpsrg003"

New-AzStorageAccount -ResourceGroupName $rgname -Name <account-name> -Location $location -SkuName Standard_RAGRS -Kind StorageV2 -AllowBlobPublicAccess $false -MinimumTlsVersion TLS1_2
