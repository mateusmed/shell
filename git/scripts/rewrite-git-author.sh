#!/bin/bash

# Configuração da nova identidade
CORRECT_NAME="Mateus Medeiros"
CORRECT_EMAIL="mateus.medeiros46@gmail.com"


OLD_EMAIL_PATTERN="userA|userB\.com\.br|email\.com"

if [ -z "$1" ]; then
    echo "Uso: $0 <caminho_do_repositorio>"
    exit 1
fi

REPO_PATH="$1"

if [ ! -d "$REPO_PATH/.git" ]; then
    echo "Erro: $REPO_PATH não é um repositório git válido."
    exit 1
fi

echo "--- Iniciando reescrita no repositório: $REPO_PATH ---"
cd "$REPO_PATH" || exit 1

# Comando para reescrever o histórico de todas as branches e tags
git filter-branch -f --env-filter "
if echo \"\$GIT_COMMITTER_EMAIL\" | grep -qiE \"$OLD_EMAIL_PATTERN\"; then
    export GIT_COMMITTER_NAME=\"$CORRECT_NAME\"
    export GIT_COMMITTER_EMAIL=\"$CORRECT_EMAIL\"
fi
if echo \"\$GIT_AUTHOR_EMAIL\" | grep -qiE \"$OLD_EMAIL_PATTERN\"; then
    export GIT_AUTHOR_NAME=\"$CORRECT_NAME\"
    export GIT_AUTHOR_EMAIL=\"$CORRECT_EMAIL\"
fi
" --tag-name-filter cat -- --branches --tags

echo "--- Reescrita local concluída para $REPO_PATH ---"
echo "Para atualizar o servidor remoto, entre na pasta e execute:"
echo "git push origin --force --all && git push origin --force --tags"


