# Use the official .NET SDK image for build
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# Copy solution and restore dependencies
COPY MyShop.sln ./
COPY MyShop/ ./MyShop/
COPY Entity/ ./Entity/
COPY DTO/ ./DTO/
COPY Repositories/ ./Repositories/
COPY Servicess/ ./Servicess/

RUN dotnet restore MyShop.sln

# Build and publish the app
RUN dotnet publish MyShop/MyShop.csproj -c Release -o /app/publish

# Use the official ASP.NET Core runtime image
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS final
WORKDIR /app
COPY --from=build /app/publish .

# Expose port 80
EXPOSE 80

# Start the app
ENTRYPOINT ["dotnet", "MyShop.dll"]
