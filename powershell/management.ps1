# To install Azure PowerShell, see:
# https://github.com/Azure/azure-powershell

# Note There are 32-bit and 64-bit versions of Powershell.
# In Windows 10, the "Windows Powershell" shortcut runs the 64-bit version of Powershell, and the "Windows Powershell (x86)" shortcut runs the 32-bit version of Powershell.
# Powershell modules for the 32-bit version of Powershell are stored in C:\Program Files (x86)\WindowsPowerShell\Modules\.
# Powershell modules for the 64-bit version of Powershell are stored in C:\Program Files\WindowsPowerShell\Modules\.
# If you install the Azure Powershell commandlets using the 32-bit version of Powershell, you will not be able to access them from the 64-bit version of Powershell.
# Likewise, if you install the Azure Powershell commandlets using the 64-bit version of Powershell, you will not be able to access them from the 32-bit version of Powershell.

# The name of the Azure resource group in which you want to create the resource.
# You can find resource groups in the Azure Dashboard under Home > Resource groups.
$resource_group_name = "TODO_REPLACE";

echo "Connecting to Azure account."
Connect-AzAccount

# For more information see:
# https://docs.microsoft.com/en-us/powershell/module/az.cognitiveservices/get-azcognitiveservicesaccount?view=azps-3.3.0
echo "Resources in resource group $resource_group_name:"
Get-AzCognitiveServicesAccount -ResourceGroupName $resource_group_name

# Uncomment this to list all available resource kinds, SKUs, and locations for your Azure account.
# For more information see:
# https://docs.microsoft.com/en-us/powershell/module/az.cognitiveservices/get-azcognitiveservicesaccountsku?view=azps-3.3.0
#Get-AzCognitiveServicesAccountSku

# For more information see:
# https://docs.microsoft.com/en-us/powershell/module/az.cognitiveservices/new-azcognitiveservicesaccount?view=azps-3.3.0
echo "Creating a resource with kind Text Translation, SKU F0 (free tier), location global."
$result = New-AzCognitiveServicesAccount -ResourceGroupName $resource_group_name -Name "test_resource" -Type "TextTranslation" -SkuName "F0" -Location "Global"
echo "Result:"
echo $result

# For more information see:
# https://docs.microsoft.com/en-us/powershell/module/az.cognitiveservices/remove-azcognitiveservicesaccount?view=azps-3.3.0
echo "Removing resource."
Remove-AzCognitiveServicesAccount -ResourceGroupName $resource_group_name -Name "test_resource"
