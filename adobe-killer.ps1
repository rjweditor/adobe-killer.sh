# Check if the script is being run with administrative privileges
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "Please run this script as an administrator."
    exit 1
}

# Define the process names to search for
$adobeProcesses = "Adobe*", "*adobe*"

# Kill Adobe-related processes
foreach ($processName in $adobeProcesses) {
    Get-Process -Name $processName -ErrorAction SilentlyContinue | ForEach-Object {
        Write-Host "Killing process: $($_.ProcessName) (ID: $($_.Id))"
        Stop-Process -Id $_.Id -Force
    }
}

Write-Host "Adobe processes have been terminated."
