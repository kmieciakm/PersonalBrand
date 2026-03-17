#!/bin/sh

set -a
source ./.env
set +a

dotnet dev-certs https -ep ${APPDATA}/ASP.NET/Https/${CERTIFICATE} -p ${CERTIFICATE_PASSWORD}
