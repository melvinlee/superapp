# Present the menu to the user
Write-Host "Please select an option:"
Write-Host "1. Run .NET Core unit tests"
Write-Host "2. Build Docker image"
Write-Host "3. Run Docker container locally"
Write-Host "4. Run Checkov scan for Dockerfile"

# Get the user's selection
$selection = Read-Host "Enter the number of your selection"

# Run the selected option
switch ($selection) {
    "1" {
        Write-Host "Checking for .NET Core runtime..."
        if (Get-Command dotnet -ErrorAction SilentlyContinue) {
            Write-Host "Running .NET Core unit tests..."
            dotnet test super-service/test/*.csproj
        } else {
            Write-Host ".NET Core runtime not found. Please install .NET Core and try again."
        }
    }
    "2" {
        Write-Host "Building Docker image..."
        docker build -t aspnetcore/superapp .
    }
    "3" {
        Write-Host "Running Docker container in detact mode..."
        docker run --rm -p 80:80 -d aspnetcore/superapp
    }
    "4" {
        Write-Host "Checking for Checkov binary..."
        if (Get-Command checkov -ErrorAction SilentlyContinue) {
            Write-Host "Running Checkov scan for Dockerfile..."
            checkov -d . -f Dockerfile --skip-check CKV_DOCKER_2
        } else {
            Write-Host "Checkov binary not found. Please install Checkov and try again."
        }
    }
    default {
        Write-Host "Invalid selection"
    }
}