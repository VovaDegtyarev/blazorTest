FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["BlazorAppTest.csproj", "."]
RUN dotnet restore "BlazorAppTest.csproj"
COPY . .
RUN dotnet build "BlazorAppTest.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "BlazorAppTest.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "BlazorAppTest.dll"]
