<#
.SYNOPSIS
    This script disables unauthorized lockscreen camera access.

.NOTES
    Author          : Taylor Walker
    LinkedIn        : linkedin.com/in/taylor-w-873b97274/
    GitHub          : github.com/ciemnyduch
    Date Created    : 2025-25-2025
    Last Modified   : 2025-26-2025
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000005

.TESTED ON
    Date(s) Tested  : 3/26/2025
    Tested By       : Ciemnyduch
    Systems Tested  : Windows (Windows 10 Pro)
    PowerShell Ver. : Windows PowerShell 5.1

.USAGE
   Open Powershell ISE run and save following script, administrative priviledges required.
    Example syntax:
    PS C:\> .\WN10-CC-000005.ps1 
#>
# Registry path and value
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization"
$regValueName = "NoLockScreenCamera"

# Check if the registry path exists
if (Test-Path $regPath) {
    Write-Host "Registry path exists, checking the value."

    # Check if the registry value is set correctly (1 = disabled)
    $currentValue = Get-ItemProperty -Path $regPath -Name $regValueName -ErrorAction SilentlyContinue

    if ($null -eq $currentValue) {
        Write-Host "Registry value does not exist, creating and setting it to 1."
        Set-ItemProperty -Path $regPath -Name $regValueName -Value 1 -Type DWord
    } elseif ($currentValue.$regValueName -ne 1) {
        Write-Host "Registry value exists but is not correctly configured, setting it to 1."
        Set-ItemProperty -Path $regPath -Name $regValueName -Value 1 -Type DWord
    } else {
        Write-Host "Registry value is already set correctly (1)."
    }
} else {
    Write-Host "Registry path does not exist, creating the path and setting the value."
    New-Item -Path $regPath -Force
    Set-ItemProperty -Path $regPath -Name $regValueName -Value 1 -Type DWord
}

# Disable camera by disabling the device through device manager
$deviceName = "Camera"

# Get the device ID for the camera
$cameraDevice = Get-WmiObject Win32_PnPEntity | Where-Object { $_.Description -like '*Camera*' }

if ($cameraDevice) {
    foreach ($device in $cameraDevice) {
        Write-Host "Disabling camera: $($device.Description)"
        # Disable the camera device
        $device.PSBase.InvokeMethod('Disable', $null)
    }
} else {
    Write-Host "No camera detected. Camera is already disabled by registry setting."
}

