# setup.ps1
param (
    [string]$envName = "myenv", # Default environment name
    [string]$pythonVersion = "3.9", # Specify Python version
    [string]$condaPath = "C:\Users\888861\AppData\Local\miniconda3\Scripts\conda.exe" # Full path to conda
)

# Define the environment path within the project folder
[string]$envPath = ".\env"

# Create the conda environment with a specific path
& "$condaPath" create --prefix $envPath python=$pythonVersion -y

# Install pip within the Conda environment (if not already included)
& "$condaPath" run --prefix $envPath --no-capture-output conda install pip -y

# Install requirements from requirements.txt using pip
if (Test-Path -Path "./requirements.txt") {
    & "$condaPath" run --prefix $envPath --no-capture-output pip install -r requirements.txt
} else {
    Write-Host "requirements.txt not found. Skipping package installation."
}

# Save the environment specification (optional, for reproducibility)
& "$condaPath" run --prefix $envPath --no-capture-output conda env export > environment.yml
Write-Host "Environment setup complete for '$envName'. Environment is stored in $envPath."
