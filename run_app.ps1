# run_main.ps1
param (
    [string]$envName = "myenv", # Default environment name
    [string]$condaPath = "C:\Users\888861\AppData\Local\miniconda3\Scripts\conda.exe" # Full path to conda.exe
)

# Activate the environment and run main.py
Write-Host "Activating environment '$envName' and running main.py..."

# Use `conda run` to bypass direct activation in a single command
& "$condaPath" run --name $envName --no-capture-output python main.py

Write-Host "Execution of main.py completed."
