
# Windows container base for ASP.NET 4.8 + IIS
FROM mcr.microsoft.com/dotnet/framework/aspnet:4.8-windowsservercore-ltsc2022

# Set the working directory inside the container
WORKDIR /inetpub/wwwroot

# Copy the published app into the container.
# Make sure your CI/CD or local steps produce ./publish prior to docker build.
COPY ./publish/ /inetpub/wwwroot/

# Expose HTTP
EXPOSE 80

# Use ServiceMonitor to keep W3SVC running (recommended for IIS in Windows containers)
# ServiceMonitor.exe is present in the base image.
