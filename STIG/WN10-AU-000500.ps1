<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Taylor Walker
    LinkedIn        : linkedin.com/in/taylor-w-873b97274/
    GitHub          : github.com/ciemnyduch
    Date Created    : 2025-24-03
    Last Modified   : 2025-24-03
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000500

.TESTED ON
    Date(s) Tested  : 2025-24-03
    Tested By       : Ciemnyduch
    Systems Tested  : Windows (Windows 10 Pro)
    PowerShell Ver. : Windows PowerShell 5.1

.USAGE
    Save and run script in PowerShell ISE
    Example syntax:
    PS C:\> .\STIG-ID-WN10-AU-000500.ps1 
#>

# Define the registry key and value
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application"
$valueName = "MaxSize"
$valueData = 0x8000  # This is the hexadecimal value for the desired MaxSize

# Check if the registry path exists, if not, create it
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force
}

# Set the MaxSize value
Set-ItemProperty -Path $registryPath -Name $valueName -Value $valueData

Write-Host "MaxSize has been set to $valueData successfully."
