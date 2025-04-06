<#
.SYNOPSIS
This script sets the machine to lock after 15 minutes of inactivity, enhancing security by preventing unattended access.

.NOTES
    Author          : Taylor Walker
    LinkedIn        : linkedin.com/in/taylor-w-873b97274/
    GitHub          : github.com/ciemnyduch
    Date Created    : 2025-5-4
    Last Modified   : 2025-5-4
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-SO-000070

.TESTED ON
    Date(s) Tested  : 4/5/25
    Tested By       : Ciemnyduch
    Systems Tested  : Windows (Windows 10 Pro)
    PowerShell Ver. : Windows PowerShell 5.1

.USAGE
 Save and run the script in administrator mode in PowerShell ISE
  
    Example syntax:
    PS C:\> .\WN10-SO-000070.ps1
#>
# Define the desired inactivity limit in seconds (900 seconds = 15 minutes)
$inactivityLimit = 900

# Set the inactivity limit for interactive logon
$regPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
$regName = "InactivityTimeoutSecs"

# Create the registry path if it doesn't exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
    Write-Output "Created registry path: $regPath"
}

# Set the registry value for machine inactivity limit
Set-ItemProperty -Path $regPath -Name $regName -Value $inactivityLimit -Type DWord
Write-Output "Machine inactivity limit has been set to $inactivityLimit seconds (15 minutes)."

