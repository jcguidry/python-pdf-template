# run_main.ps1
param (
    [string]$envName = "myenv" # Default environment name
)

# Define the environment path within the project folder
[string]$envPath = ".\env"

# Activate the environment and run main.py
Write-Host "Activating environment '$envName' and running main.py..."

# Run main.py using the Python executable within the virtual environment
& "$envPath\Scripts\python.exe" main.py

Write-Host "Execution of main.py completed."


