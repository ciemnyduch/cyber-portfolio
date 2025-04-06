<#
.SYNOPSIS
 This script configures the system to always require users to type in a username and password to elevate a running application. This prevents account enumeration.

.NOTES
    Author          : Taylor Walker
    LinkedIn        : linkedin.com/in/taylor-w-873b97274/
    GitHub          : github.com/ciemnyduch
    Date Created    : 2025-5-4
    Last Modified   : 2025-5-4
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000200

.TESTED ON
    Date(s) Tested  : 4/5/25
    Tested By       : Ciemnyduch
    Systems Tested  : Windows (Windows 10 Pro)
    PowerShell Ver. : Windows PowerShell 5.1

.USAGE
 Save and run the script in PowerShell ISE
  
    Example syntax:
    PS C:\> .\WN10-CC-000200.ps1
#>
# Define registry path and desired setting
$regPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\CredUI"
$regName = "EnumerateAdministrators"
$desiredValue = 0  # Disabled

# Create the registry path if it doesn't exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
    Write-Output "Created registry path: $regPath"
}

# Set the policy value
Set-ItemProperty -Path $regPath -Name $regName -Value $desiredValue -Type DWord
Write-Output "'Enumerate administrator accounts on elevation' has been set to 'Disabled' (Value: 0)."

