## 1. Automated deployment  ![main](https://github.com/melvinlee/superapp/actions/workflows/dotnet.yml/badge.svg)


This project demostrate how to deploy .NET Core Web API using a docker container.

Prerequisites

- Install .NET Core [6.0](https://dot.net/core) or later.
- Install [Docker](https://docs.docker.com/engine/install/)

## How to Deploy

You can run test, built an image or deloy image using the powershell script `Deploy.ps1`

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

## Build Image

You can built an image using the provided script `Deploy.ps1`.

```sh
./Deploy.ps1 -selection 2
```

## Test Image Locally

You 1st need to build Docker image and then run Docker container locally.

You should see the following console output as the application starts:

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

## `Deploy1.ps1` Usage

This PowerShell script, Deploy.ps1, provides a simple command-line interface for performing various deployment-related tasks. It does this by presenting a menu to the user and executing different commands based on the user's selection.

Here's a breakdown of what each option does:

1. Run .NET Core unit tests: This option checks if the .NET Core runtime is installed on the machine. If it is, it runs the unit tests in the super-service/test directory. If the .NET Core runtime is not found, it prompts the user to install it.

1. Build Docker image: This option builds a Docker image with the tag aspnetcore/superapp using the Dockerfile in the current directory.

1. Run Docker container locally: This option runs the Docker container locally in detached mode, mapping the container's port 80 to the host's port 80. The --rm option ensures that the container is removed when it exits.

1. Run Checkov scan for Dockerfile: This option checks if the Checkov binary is installed on the machine. If it is, it runs a Checkov scan on the Dockerfile in the current directory, skipping the check CKV_DOCKER_2. If the Checkov binary is not found, it prompts the user to install it.

1. Deploy Helm chart: This option checks if the Helm binary is installed on the machine. If it is, it deploys the Helm chart located in the super-service/charts directory using the values in the super-service/release/production-values.yaml file.

1. Run Gitleaks scan: This option scanning for hard-coded secrets like API keys, tokens, passwords, and certificates.

If the user enters a selection that is not one of the provided options, the script outputs "Invalid selection".

The script is designed to be run interactively, but it also accepts a selection as a parameter, allowing it to be used in automated scripts.