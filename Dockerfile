FROM mcr.microsoft.com/dotnet/core/sdk:2.2 AS build-env
workdir /app
COPY API/bin/Release/netcoreapp2.2/publish/. /app
cmd ["dotnet","API.dll"]
