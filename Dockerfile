
# Windows container base for ASP.NET 4.8 + IIS
FROM mcr.microsoft.com/dotnet/framework/aspnet:4.8-windowsservercore-ltsc2022

# Copy a minimal static site into the default IIS web root
COPY HelloWorldApp/ /inetpub/HelloWorldApp/

# Expose HTTP
EXPOSE 80

# Use ServiceMonitor to keep W3SVC running (recommended for IIS in Windows containers)
# ServiceMonitor.exe is present in the base image.
