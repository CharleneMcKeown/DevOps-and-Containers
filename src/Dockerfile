FROM microsoft/aspnetcore AS base
WORKDIR /app
EXPOSE 80

FROM microsoft/aspnetcore-build AS build
WORKDIR /src
COPY Miniblog.Core.sln ./
COPY src/Miniblog.Core.csproj src/

RUN dotnet restore -nowarn:msb3202,nu1503
COPY . .
WORKDIR /src/src
RUN dotnet build Miniblog.Core.csproj -c Release -o /app

FROM build AS publish
RUN dotnet publish Miniblog.Core.csproj -c Release -o /app

FROM base AS final
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "Miniblog.Core.dll"]
