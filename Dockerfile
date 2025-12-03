

# Base image: ASP.NET 4.8 on Windows Server Core + IIS
# Includes ServiceMonitor.exe to keep W3SVC running
FROM mcr.microsoft.com/dotnet/framework/aspnet:4.8-windowsservercore-ltsc2022

# Set the IIS web root
WORKDIR C:\inetpub\wwwroot

# Copy PUBLISHED site output (not raw source). Ensure this folder contains:
COPY C:\publish\ ./

# (Optional) Add a simple default document to avoid 403 during smoke tests
# Uncomment this if you don’t have a start page yet.
# RUN powershell -Command "Set-Content -Path C:\inetpub\wwwroot\index.html -Value '<h1>Hello from IIS</h1>'"

# Expose HTTP
EXPOSE 80

# No ENTRYPOINT/CMD needed here: the base image already starts IIS via ServiceMonitor.exe
# If you ever override it, ensure you re-launch ServiceMonitor, e.g.:
# ENTRYPOINT ["C:\\ServiceMonitor.exe", "w3svc"]

# (Optional) Health check - makes container startups observable
# HEALTHCHECK --interval=30s --timeout=5s --retries=5 CMD powershell -Command `
