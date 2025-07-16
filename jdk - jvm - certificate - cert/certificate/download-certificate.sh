#!/bin/bash

# -------------------------------------------------------------------------------
# Script: download-certificate.sh
#
# Descrição:
# Este script conecta-se a um ou mais servidores HTTPS e baixa os certificados
# SSL apresentados por cada um deles. Em seguida, gera um truststore `.jks` único
# que pode ser usado por aplicações Java para confiar nesses servidores.
#
# Como usar:
#   ./download-certificate.sh <host1> [host2] ... [--outdir DIR] [--truststore NAME]
#
# Argumentos:
#   <hostX>           → um ou mais hosts (ex: api.exemplo.com)
#   --outdir DIR      → opcional, onde salvar os arquivos (padrão: diretório atual)
#   --truststore NAME → opcional, nome do truststore JKS (padrão: truststore.jks)
#
# Exemplo:
#   ./download-certificate.sh api.example.com auth.exemplo.org --outdir ./certs --truststore meus-certificados.jks
# -------------------------------------------------------------------------------

# === VARIÁVEIS INICIAIS ===
OUTDIR="."
TRUSTSTORE="truststore.jks"
PASSWORD="changeit"

HOSTS=()

# === PARSE SIMPLES DOS ARGUMENTOS ===
while [[ $# -gt 0 ]]; do
  case "$1" in
    --outdir)
      OUTDIR="$2"
      shift 2
      ;;
    --truststore)
      TRUSTSTORE="$2"
      shift 2
      ;;
    -*)
      echo "Opção desconhecida: $1"
      exit 1
      ;;
    *)
      HOSTS+=("$1")
      shift
      ;;
  esac
done

# === VALIDAÇÃO ===
if [ ${#HOSTS[@]} -eq 0 ]; then
  echo "Uso: $0 <host1> [host2 ...] [--outdir DIR] [--truststore NAME]"
  exit 1
fi

mkdir -p "$OUTDIR"
TRUSTSTORE_PATH="${OUTDIR}/${TRUSTSTORE}"

# === REMOVE O TRUSTSTORE EXISTENTE PARA EVITAR CONFLITOS ===
rm -f "$TRUSTSTORE_PATH"

# === LOOP POR HOST ===
for HOST in "${HOSTS[@]}"; do
  SAFE_HOST="${HOST//./-}"
  ALIAS="cert-${SAFE_HOST}"
  CRT_FILE="${OUTDIR}/${ALIAS}.crt"

  echo "Conectando em $HOST:443 para obter certificado..."

  echo | openssl s_client -connect "${HOST}:443" -servername "$HOST" -showcerts 2>/dev/null \
    | awk '/-----BEGIN CERTIFICATE-----/,/-----END CERTIFICATE-----/{print}' > "$CRT_FILE"

  if [ ! -s "$CRT_FILE" ]; then
    echo "Erro ao capturar certificado de $HOST"
    continue
  fi

  echo "Importando certificado de $HOST no truststore (${ALIAS})..."

  keytool -importcert -trustcacerts -noprompt \
    -alias "$ALIAS" \
    -file "$CRT_FILE" \
    -keystore "$TRUSTSTORE_PATH" \
    -storepass "$PASSWORD"

done

# === INSTRUÇÕES DE USO ===
ABS_PATH_JKS=$(realpath "$TRUSTSTORE_PATH")

echo
echo "Truststore criado com sucesso: $ABS_PATH_JKS"
echo
echo "Para usar este truststore em sua aplicação Java:"
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
echo "Senha do keystore: ${PASSWORD}"
