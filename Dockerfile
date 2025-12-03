# Windows container base for ASP.NET 4.8 + IIS
FROM mcr.microsoft.com/dotnet/framework/aspnet:4.8-windowsservercore-ltsc2022

# Enable IIS features and ASP.NET support
RUN powershell -Command \
    Install-WindowsFeature Web-Server, Web-Asp-Net45, Web-WebServer, Web-Common-Http, Web-Static-Content, Web-Default-Doc, Web-Dir-Browsing, Web-Http-Redirect, Web-Performance, Web-Filtering, Web-Stat-Compression, Web-Security, Web-Http-Logging, Web-Request-Monitor, Web-WMI, Web-Mgmt-Console; \
    Remove-Item -Recurse -Force C:\inetpub\wwwroot\*

# Set the working directory inside the container
WORKDIR /inetpub/wwwroot

# Copy the application files into the container
COPY ./your-app /inetpub/wwwroot/

# Expose port 80
EXPOSE 80

# Start IIS when the container starts
CMD ["powershell", "-NoExit", "-Command", "Start-Service W3SVC; Wait-Event -Timeout 86400"]
