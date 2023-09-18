# adobe-killer.sh
# macOS Adobe Process Killing Script

## Overview

This Bash script is designed to kill Adobe-related processes on macOS. It uses the `pkill` command to terminate any processes containing the strings "Adobe" and "adobe" in their command lines. This can be useful when you need to forcefully close Adobe applications or background processes.

## Prerequisites

- macOS: This script is intended for use on macOS systems.
- `sudo` privileges: You need to run this script with administrative privileges using `sudo`.

## Usage

1. Download or create a script file (e.g., `adobe-killer.sh`) with the following content:

   ```bash
   #!/bin/bash

   # Check if the script is being run with sudo
   if [ "$EUID" -ne 0 ]; then
     echo "Please run this script with sudo:"
     echo "sudo $0"
     exit 1
   fi

   # Kill processes containing "Adobe" and "adobe"
   sudo pkill -f Adobe
   sudo pkill -f adobe

   echo "Adobe processes have been killed."

2. Make the script executable: chmod +x kill_adobe_processes.sh
3. Run the script with sudo to kill Adobe processes: sudo ./kill_adobe_processes.sh

#PowerShell Version:

'''# Check if the script is being run with administrative privileges
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

   
