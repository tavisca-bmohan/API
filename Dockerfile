FROM mcr.microsoft.com/dotnet/core/sdk:2.2 AS build-env
WORKDIR /app
COPY API/bin/Release/netcoreapp2.2/publish/. /app
CMD ["dotnet","API.dll"]
