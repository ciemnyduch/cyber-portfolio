<#
.SYNOPSIS
  This script turns off the Inventory Collector to prevent it from collecting and sending data

.NOTES
    Author          : Taylor Walker
    LinkedIn        : linkedin.com/in/taylor-w-873b97274/
    GitHub          : github.com/ciemnyduch
    Date Created    : 2025-31-2025
    Last Modified   : 2025-31-2025
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000175

.TESTED ON
    Date(s) Tested  : 3/31/25
    Tested By       : Ciemnyduch
    Systems Tested  : Windows (Windows 10 Pro)
    PowerShell Ver. : Windows PowerShell 5.1

.USAGE
Run PowerShell ISE in administrator mode 
Save and run script below
    Example syntax:
    PS C:\> .\WN10-CC-000175.ps1
#>
# Define registry path for Application Compatibility policy
$RegPath = "HKLM:\Software\Policies\Microsoft\Windows\AppCompat"

# Ensure the registry path exists
if (!(Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
}

# Enable "Turn off Inventory Collector"
Set-ItemProperty -Path $RegPath -Name "DisableInventory" -Value 1 -Type DWord

# Force Group Policy update
gpupdate /force

Write-Output "Inventory Collector has been disabled successfully."


