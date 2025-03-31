<#
.SYNOPSIS
This script will configure the policy to prevent attachments from being downloaded from RSS feeds 

.NOTES
    Author          : Taylor Walker
    LinkedIn        : linkedin.com/in/taylor-w-873b97274/
    GitHub          : github.com/ciemnyduch
    Date Created    : 2025-31-2025
    Last Modified   : 2025-31-2025
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000295

.TESTED ON
    Date(s) Tested  : 3/31/25
    Tested By       : Ciemnyduch
    Systems Tested  : Windows (Windows 10 Pro)
    PowerShell Ver. : Windows PowerShell 5.1

.USAGE
 Save and run the script in PowerShell ISE
  
    Example syntax:
    PS C:\> .\WN10-CC-000295.ps1
#>
# Define registry path for RSS Feeds policy
$RegPath = "HKLM:\Software\Policies\Microsoft\Internet Explorer\Feeds"

# Ensure the registry path exists
if (!(Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
}

# Enable "Prevent downloading of enclosures"
Set-ItemProperty -Path $RegPath -Name "DisableEnclosureDownload" -Value 1 -Type DWord

# Force Group Policy update
gpupdate /force

Write-Output "RSS Feed enclosure downloads have been disabled successfully."
