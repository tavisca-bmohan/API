FROM mcr.microsoft.com/dotnet/core/sdk:2.2 AS build-env
COPY API/bin/Release/netcoreapp2.2/publish .

