O Bash perde conectividade de rede quando conectado a uma VPN
Se, depois de se conectar a uma VPN no Windows, o Bash perder a conectividade de rede, 
tente essa solução alternativa de dentro do Bash. Essa solução alternativa permitirá que você substitua manualmente a resolução DNS por meio do /etc/resolv.conf.
Anote o servidor DNS da VPN ao fazer ipconfig.exe /all
Faça uma cópia do sudo cp /etc/resolv.conf /etc/resolv.conf.new do resolv.conf existente
Desvincule o sudo unlink /etc/resolv.conf do resolv.conf atual
sudo mv /etc/resolv.conf.new /etc/resolv.conf
Abra /etc/resolv.conf e
a. Exclua a primeira linha do arquivo, que diz "# Este arquivo foi gerado automaticamente pelo WSL. Para interromper a geração automática deste arquivo, remova esta linha".
b. Adicione a entrada DNS de (1) acima como a primeira entrada na lista de servidores DNS.
c. Feche o arquivo.
Depois de desconectar a VPN, você precisará reverter as alterações para /etc/resolv.conf. Para isso, faça o seguinte:
cd /etc
sudo mv resolv.conf resolv.conf.new
sudo ln -s ../run/resolvconf/resolv.conf resolv.conf