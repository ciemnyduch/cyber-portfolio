<#
.SYNOPSIS
  This script configures the "Allow Basic authentication" policy for Windows Remote Management (WinRM) to Disabled

.NOTES
    Author          : Taylor Walker
    LinkedIn        : linkedin.com/in/taylor-w-873b97274/
    GitHub          : github.com/ciemnyduch
    Date Created    : 2025-31-2025
    Last Modified   : 2025-31-2025
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000345

.TESTED ON
    Date(s) Tested  : 3/31/25
    Tested By       : Ciemnyduch
    Systems Tested  : Windows (Windows 10 Pro)
    PowerShell Ver. : Windows PowerShell 5.1

.USAGE
 Save and run script in PowerShell ISE 
    Example syntax:
    PS C:\> .\WN10-CC-000345.ps1
#>
# Define the registry path for WinRM Service policy
$RegPath = "HKLM:\Software\Policies\Microsoft\Windows\WinRM\Service"

# Ensure the registry path exists
if (!(Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
}

# Disable "Allow Basic authentication"
Set-ItemProperty -Path $RegPath -Name "AllowBasic" -Value 0 -Type DWord

# Force Group Policy update
gpupdate /force

Write-Output "Basic authentication for WinRM has been disabled successfully."
