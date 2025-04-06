<#
.SYNOPSIS
This renames the built-in Guest account to something other than "Guest" to prevent attackers from targeting a known account name.
It enhances system security by reducing the risk of unauthorized access through a commonly known account.

.NOTES
    Author          : Taylor Walker
    LinkedIn        : linkedin.com/in/taylor-w-873b97274/
    GitHub          : github.com/ciemnyduch
    Date Created    : 2025-5-4
    Last Modified   : 2025-5-4
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-SO-000025

.TESTED ON
    Date(s) Tested  : 4/5/25
    Tested By       : Ciemnyduch
    Systems Tested  : Windows (Windows 10 Pro)
    PowerShell Ver. : Windows PowerShell 5.1

.USAGE
 Save and run the script in PowerShell ISE
  
    Example syntax:
    PS C:\> .\WN10-SO-000025.ps1
#>
# Define the new name for the Guest account
$newGuestName = "DisabledGuest"  # You can change this to any non-Guest name

# Get the Guest account object
$guestAccount = Get-LocalUser | Where-Object { $_.Name -eq "Guest" }

# Rename the account if it exists and hasn't been renamed
if ($guestAccount) {
    if ($guestAccount.Name -ne $newGuestName) {
        Rename-LocalUser -Name "Guest" -NewName $newGuestName
        Write-Output "Guest account has been renamed to '$newGuestName'."
    } else {
        Write-Output "Guest account is already renamed to '$newGuestName'."
    }
} else {
    Write-Output "Guest account does not exist or has already been renamed."
}

