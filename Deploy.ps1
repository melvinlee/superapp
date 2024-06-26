param (
    [Parameter(Mandatory=$false)]
    [string]$selection
)

# Present the menu to the user
Write-Host "Please select an option:"
Write-Host "1. Run .NET Core unit tests"
Write-Host "2. Build Docker image"
Write-Host "3. Run Docker container locally"
Write-Host "4. Run Checkov scan for Dockerfile"
Write-Host "5. Deploying Helm chart"
Write-Host "6. Run Gitleaks scan"


if ($selection -eq $null -or $selection -eq "") {
    # Get the user's selection
    $selection = Read-Host "Enter the number of your selection"
}

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
        Write-Host "Running Docker container..."
        docker run --rm -p 80:80 aspnetcore/superapp
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
    "5" {
        Write-Host "Checking for Helm binary..."
        if (Get-Command helm -ErrorAction SilentlyContinue) {
            Write-Host "Deploying Helm chart using override value..."
            helm upgrade --install superapp super-service/charts -f super-service/release/production-values.yaml
        } else {
            Write-Host "Helm binary not found. Please install Helm and try again."
        }
    }
     "6" {
        Write-Host "Checking for Gitleaks binary..."
        if (Get-Command gitleaks -ErrorAction SilentlyContinue) {
            Write-Host "Running Gitleaks scan..."
            gitleaks detect --verbose
        } else {
            Write-Host "Gitleaks binary not found. Please install Gitleaks and try again."
        }
    }
    default {
        Write-Host "Invalid selection"
    }
}