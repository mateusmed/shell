#!/bin/bash

# -------------------------------------------------------------------------------
# Script: baixar-certificado.sh
#
# Descrição:
# Este script conecta-se a um servidor HTTPS e baixa o(s) certificado(s) SSL
# apresentados por ele. Em seguida, gera um truststore `.jks` que pode ser usado
# em aplicações Java para confiar neste servidor.
#
# Como usar:
#   ./baixar-certificado.sh <host> [port] [alias] [output_dir]
#
# Argumentos:
#   <host>        → obrigatório (ex: api.exemplo.com)
#   [port]        → opcional, padrão: 443
#   [alias]       → opcional, nome do certificado no keystore. Padrão: cert-<host>
#   [output_dir]  → opcional, diretório onde salvar os arquivos (padrão: diretório atual)
#
# Exemplo:
#   ./baixar-certificado.sh api.example.com 443 backend ./certs
# -------------------------------------------------------------------------------

# === ARGUMENTOS ===
HOST="$1"
PORT="${2:-443}"

# Substitui pontos por hífens para nomear arquivos/aliases de forma segura
SAFE_HOST="${HOST//./-}"

ALIAS="${3:-cert-${SAFE_HOST}}"
OUTDIR="${4:-.}"

CRT_FILE="${OUTDIR}/${ALIAS}.crt"
JKS_FILE="${OUTDIR}/${ALIAS}.jks"
PASSWORD="changeit"

# === VALIDAÇÃO ===
if [ -z "$HOST" ]; then
  echo "Uso: $0 <host> [port] [alias] [output_dir]"
  exit 1
fi

# === CRIA DIRETÓRIO SE NECESSÁRIO ===
mkdir -p "$OUTDIR"

echo "Conectando em $HOST:$PORT para obter certificado(s)..."

# === CAPTURA OS CERTIFICADOS DO SERVIDOR ===
echo | openssl s_client -connect "${HOST}:${PORT}" -servername "$HOST" -showcerts 2>/dev/null \
  | awk '/-----BEGIN CERTIFICATE-----/,/-----END CERTIFICATE-----/{print}' > "$CRT_FILE"

if [ ! -s "$CRT_FILE" ]; then
  echo "Erro: certificado não capturado. Verifique o host/porta."
  exit 1
fi

echo "Certificado(s) salvo(s) em: $CRT_FILE"

# === GERA O KEYSTORE ===
echo "Criando truststore JKS: $JKS_FILE"
keytool -importcert -trustcacerts -noprompt \
  -alias "$ALIAS" \
  -file "$CRT_FILE" \
  -keystore "$JKS_FILE" \
  -storepass "$PASSWORD"

echo "Truststore criado com sucesso: $JKS_FILE"
echo

# === INSTRUÇÕES DE USO ===
ABS_PATH_JKS=$(realpath "$JKS_FILE")

echo "Para usar esta truststore em sua aplicação Java:"
echo
echo "Em linha de comando:"
echo "   -Djavax.net.ssl.trustStore=${ABS_PATH_JKS} \\"
echo "   -Djavax.net.ssl.trustStorePassword=${PASSWORD}"
echo
echo "Exemplo com Maven (Quarkus):"
echo "   ./mvnw quarkus:dev \\"
echo "     -Djavax.net.ssl.trustStore=${ABS_PATH_JKS} \\"
echo "     -Djavax.net.ssl.trustStorePassword=${PASSWORD}"
echo
echo "Alias usado no keystore: ${ALIAS}"
echo "Senha do keystore: ${PASSWORD}"
