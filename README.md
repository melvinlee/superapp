# SuperApp Deployment ![main](https://github.com/melvinlee/superapp/actions/workflows/dotnet.yml/badge.svg)

This project demonstrates how to deploy a .NET Web API using modern DevOps practices including:
- Docker containerization
- Helm chart deployment
- CI/CD automation
- Security scanning

## Prerequisites

- [.NET 8.0](https://dot.net/core) or later
- [Docker](https://docs.docker.com/engine/install/)
- [Helm](https://helm.sh/docs/intro/install/)
- [Checkov](https://www.checkov.io/1.Welcome.html)
- [Gitleaks](https://github.com/gitleaks/gitleaks)

## Deployment Script

The `Deploy.ps1` PowerShell script provides a streamlined interface for common development and deployment tasks:

```sh
Please select an option:
1. Run .NET Core unit tests
2. Build Docker image
3. Run Docker container locally
4. Run Checkov scan for Dockerfile
5. Deploying Helm chart
6. Run Gitleaks scan
Enter the number of your selection:
```

## Quick Start

To build and test the application locally:

1. Build the Docker image:
```sh
./Deploy.ps1 -selection 2
```

2. Run the container locally:

```sh
./Deploy.ps1 -selection 3
Running Docker container...
info: Microsoft.Hosting.Lifetime[14]
      Now listening on: http://[::]:80
info: Microsoft.Hosting.Lifetime[0]
      Application started. Press Ctrl+C to shut down.
info: Microsoft.Hosting.Lifetime[0]
      Hosting environment: Production
info: Microsoft.Hosting.Lifetime[0]
      Content root path: /super-service
^Cinfo: Microsoft.Hosting.Lifetime[0]
```

After the application starts, navigate to http://localhost:80/time in your web browser.

You can see the app running via `docker image ls`.

```sh
PS docker container ls
ad3774b77173   aspnetcore/superapp   "dotnet SuperService…"   5 minutes ago   Up 5 minutes   0.0.0.0:80->80/tcp   fervent_rubin
```

## Deployment Script Options

The `Deploy.ps1` script provides the following capabilities:

| Option | Command | Description |
|--------|---------|-------------|

| 1 | `./Deploy.ps1 -selection 1` | Run xUnit tests in `super-service/test` directory |
| 2 | `./Deploy.ps1 -selection 2` | Build Docker image tagged `aspnetcore/superapp` |
| 3 | `./Deploy.ps1 -selection 3` | Run container locally on port 80 |
| 4 | `./Deploy.ps1 -selection 4` | Run Checkov security scan on Dockerfile |
| 5 | `./Deploy.ps1 -selection 5` | Deploy Helm chart to Kubernetes |
| 6 | `./Deploy.ps1 -selection 6` | Scan for secrets using Gitleaks |

If the user enters a selection that is not one of the provided options, the script outputs "Invalid selection".

The script is designed to be run interactively, but it also accepts a selection as a parameter, allowing it to be used in automated scripts.
