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

