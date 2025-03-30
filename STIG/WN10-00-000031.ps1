<#
.SYNOPSIS
    This script is designed to set up a BitLocker PIN for pre-boot authentication on a Windows 10 system.

.NOTES
    Author          : Taylor Walker
    LinkedIn        : linkedin.com/in/taylor-w-873b97274/
    GitHub          : github.com/ciemnyduch
    Date Created    : 2025-30-2025
    Last Modified   : 2025-30-2025
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-00-000031

.TESTED ON
    Date(s) Tested  : 3/30/25
    Tested By       : Ciemnyduch
    Systems Tested  : Windows (Windows 10 Pro)
    PowerShell Ver. : Windows PowerShell 5.1

.USAGE
  To check BitLocker status run: manage-bde -status
  This will show the encryption status of all drives.
  If status shows as not compliant save and run the following script in PowerShell ISE
  
    Example syntax:
    PS C:\> .\WN10-00-000031.ps1
#>
# Define registry paths for BitLocker policy settings
$RegPath = "HKLM:\Software\Policies\Microsoft\FVE"

# Ensure the registry path exists
if (!(Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
}

# Enable "Require additional authentication at startup"
Set-ItemProperty -Path $RegPath -Name "UseAdvancedStartup" -Value 1 -Type DWord

# Set "Configure TPM Startup PIN" to "Require startup PIN with TPM"
Set-ItemProperty -Path $RegPath -Name "UseTPMPIN" -Value 1 -Type DWord

# Set "Configure TPM startup key and PIN" to "Require startup key and PIN with TPM"
Set-ItemProperty -Path $RegPath -Name "UseTPMKeyPIN" -Value 1 -Type DWord

# Force Group Policy update
gpupdate /force

Write-Output "BitLocker policy configured successfully. Please restart the system for changes to take effect."


