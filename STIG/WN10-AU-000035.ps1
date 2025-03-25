<#
.SYNOPSIS
    This PowerShell script ensures that User Account Management records events such as creating, changing, deleting, renaming, disabling, or enabling user accounts.

.NOTES
    Author          : Taylor Walker
    LinkedIn        : linkedin.com/in/taylor-w-873b97274/
    GitHub          : github.com/ciemnyduch
    Date Created    : 2025-25-2025
    Last Modified   : 2025-25-2025
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000035

.TESTED ON
    Date(s) Tested  : 3/25/2025
    Tested By       : Ciemnyduch
    Systems Tested  : Windows (Windows 10 Pro)
    PowerShell Ver. : Windows PowerShell 5.1

.USAGE
    Open a Command Prompt with elevated privileges ("Run as Administrator").
Enter "AuditPol /get /category:*".
If "Failure" isn't selected under Account Management >> "Audit User Account Management", save and run the following script.
    Example syntax:
    PS C:\> .\WN10-AU-000035.ps1 
#>

# Elevate script to run as Administrator
$RunAsAdmin = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
$IsAdmin = $RunAsAdmin.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

if (-not $IsAdmin) {
    Write-Host "This script requires Administrator privileges. Please run as Administrator."
    exit
}

# Get current audit policy for the "User Account Management" category
$AuditPolicy = AuditPol /get /category:"Account Management"

# Output the current policy to confirm what it is
Write-Host "Current Audit Policy for Account Management - User Account Management: "
$AuditPolicy

# Set the "User Account Management" policy to "Failure"
Write-Host "Setting Account Management >> User Account Management to 'Failure'"

# Change the audit policy for "User Account Management" to Failure
AuditPol /set /subcategory:"User Account Management" /failure:enable

Write-Host "Audit policy successfully set to 'Failure' for Account Management >> User Account Management."
