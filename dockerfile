# Use the official .NET Core SDK image as the base image
FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build

# Set the working directory inside the container
WORKDIR /app

# Copy the project file(s) to the container
COPY super-service/src/*.csproj ./super-service/src/

# Restore the NuGet packages
RUN dotnet restore super-service/src/SuperService.csproj

# Copy the remaining source code to the container
COPY . ./

# Set the working directory inside the container
WORKDIR /app/super-service/src

# # # # Build the application
RUN dotnet build SuperService.csproj --configuration Release --no-restore

# # # Publish the application
RUN dotnet publish SuperService.csproj --configuration Release --no-build --output /app/publish

# # # Use the official .NET Core runtime image as the base image for the final image
FROM mcr.microsoft.com/dotnet/core/aspnet:3.1 AS runtime

# # Set the working directory inside the container
WORKDIR /super-service

# # Copy the published output from the build image to the runtime image
COPY --from=build /app/publish .

# # # Expose the port(s) that the application listens on
EXPOSE 80

# # Set the entry point for the container
ENTRYPOINT ["dotnet", "SuperService.dll"]