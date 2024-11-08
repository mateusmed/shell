export PATH=/bin:\
/usr/bin:\
/usr/local/bin:\
/home/mmed/.asdf/bin:\
/home/mmed/.asdf/shims:\
/home/mmed/.asdf/completions/asdf.bash:\

alias desenv='nohup /home/mmed/dev/programs/idea2024-11/bin/idea > /dev/null 2>&1 & \
nohup /home/mmed/dev/programs/dbeaver/dbeaver > /dev/null 2>&1 & \
nohup /home/mmed/dev/programs/webStorm2023-10/bin/webstorm.sh > /dev/null 2>&1 & \
nohup /home/mmed/dev/programs/Postman/Postman > /dev/null 2>&1 & '

alias sublime='subl'
# for linux
#alias open='nautilus . &'

# for wsl
alias open='/mnt/c/Windows/explorer.exe .'


alias bashrc='sudo subl /home/mmed/.bashrc'
alias hosts='sudo subl /etc/hosts'

alias wsm='cd ~/dev/workspaceMateus'
alias intellij='nohup /home/mmed/dev/programs/idea2024-11/bin/idea > /dev/null 2>&1 &'
alias webstorm='nohup /home/mmed/dev/programs/webStorm2023-10/bin/webstorm.sh > /dev/null 2>&1 &'
alias dbeaver='nohup /home/mmed/dev/programs/dbeaver/dbeaver > /dev/null 2>&1 &'
alias chrome='nohup /usr/bin/google-chrome > /dev/null 2>&1 &'
alias update-bash='source ~/.bashrc'
alias postman='nohup /home/mmed/dev/programs/Postman/Postman > /dev/null 2>&1 &'