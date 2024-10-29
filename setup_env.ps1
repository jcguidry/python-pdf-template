param (
    [string]$envName = "myenv", # Default environment name
    [string]$pythonPath = "C:\Program Files\Python311\python.exe" # Path to Python executable
)

# Define the environment path within the project folder
[string]$envPath = ".\env"

# Create the virtual environment using venv
& "$pythonPath" -m venv $envPath

# Activate the virtual environment
[string]$activateScript = ".\env\Scripts\Activate.ps1"
& $activateScript

# Install pip if not included
& "$envPath\Scripts\python.exe" -m ensurepip

# Install requirements from requirements.txt using pip
if (Test-Path -Path "./requirements.txt") {
    & "$envPath\Scripts\python.exe" -m pip install -r requirements.txt
} else {
    Write-Host "requirements.txt not found. Skipping package installation."
}

# Deactivate the virtual environment
Write-Host "Environment setup complete for '$envName'. Environment is stored in $envPath."
