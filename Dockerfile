FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app
EXPOSE 80
#EXPOSE 443
ENV ASPNETCORE_ENVIRONMENT=Subscriber
ENV ASPNETCORE_URLS=http://+:80
#;https://+:443
#ENV ASPNETCORE_HTTPS_PORT=9001
#ENV ASPNETCORE_Kestrel__Certificates__Default__Path=/https/aspnetapp.pfx
#ENV ASPNETCORE_Kestrel__Certificates__Default__Password=password

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /AlinaCrossRegionLoad.Web
COPY ["/AlinaCrossRegionLoad.Web/AlinaCrossRegionLoad.Web.csproj", "./"]
RUN dotnet restore "AlinaCrossRegionLoad.Web.csproj"
COPY ./AlinaCrossRegionLoad.Web .
WORKDIR "/AlinaCrossRegionLoad.Web/"
RUN dotnet build "AlinaCrossRegionLoad.Web.csproj" -c Debug -o /app/build

FROM build AS publish
RUN dotnet publish "AlinaCrossRegionLoad.Web.csproj" -c Debug -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .


ENTRYPOINT ["dotnet", "AlinaCrossRegionLoad.Web.dll" ]