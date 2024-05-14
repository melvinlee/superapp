# Present the menu to the user
Write-Host "Please select an option:"
Write-Host "1. Run .NET Core unit tests"
Write-Host "2. Build Docker image"
Write-Host "3. Run Docker container locally"

# Get the user's selection
$selection = Read-Host "Enter the number of your selection"

# Run the selected option
switch ($selection) {
    "1" {
        Write-Host "Running .NET Core unit tests..."
        dotnet test super-service/test/*.csproj
    }
    "2" {
        Write-Host "Building Docker image..."
        docker build -t aspnetcore/superapp .
    }
    "3" {
        Write-Host "Running Docker container in detact mode..."
        docker run --rm -p 80:80 -d aspnetcore/superapp
    }
    default {
        Write-Host "Invalid selection"
    }
}