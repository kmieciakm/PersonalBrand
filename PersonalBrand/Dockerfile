FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /src
COPY ["PersonalBrand/PersonalBrand.csproj", "PersonalBrand/"]
RUN dotnet restore "PersonalBrand/PersonalBrand.csproj"
COPY . .
WORKDIR "/src/PersonalBrand"
RUN dotnet build "PersonalBrand.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "PersonalBrand.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "PersonalBrand.dll"]