# superapp

This project demostrate how to deploy .NET Core Web API using a docker container.

Prerequisites

- Install .NET Core [3.1](https://dot.net/core) or later.
- Install [Docker](https://docs.docker.com/engine/install/)

## Deploy.ps1

You can run test, built an image or deloy image using the powershell `Deploy.ps1`

```sh
Please select an option:
1. Run .NET Core unit tests
2. Build Docker image
3. Run Docker container locally
4. Run Checkov scan for Dockerfile
Enter the number of your selection:
```

## Build Image

You can built an image using the provided script `Deploy.ps1`.

## Test Image Locally

You 1st need to build Docker image and then run Docker container locally.

You should see the following console output as the application starts:

```sh
Running Docker container in detact mode...
ad3774b7717378ded8e9fa01a0956f2a471de5337f2eaf6cc4820e7cff132acb
```

After the application starts, navigate to http://localhost:80/time in your web browser.

You can see the app running via `docker image ls`.

```sh
PS docker container ls
ad3774b77173   aspnetcore/superapp   "dotnet SuperService…"   5 minutes ago   Up 5 minutes   0.0.0.0:80->80/tcp   fervent_rubin
```
