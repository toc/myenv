# -*- Mode: sh; Coding: utf-8-unix; -*-
# 
# self.bashrc: .bashrc補完リソースファイル
# 
#   コマンドのdefaultパラメータ設定やalias定義を中心とする
#   環境設定ファイル。
#   .bashrcから次の様にインポートして利用されることを想定。
# 
#   ### Import external resource file
#   [ -f ~/.bashrc.self ] && . ~/.bashrc.self
# 

# Aliases
# #######

# set ssh passphrase automatically
alias ssh-set='eval `ssh-agent`; ssh-add'
alias ls='ls -F --color=auto';		# Re-define: never use -h

if [ "$TERM" == "emacs" ]; then
  alias ls='ls -F --color';
fi

# Set prompt
# ##########
PS1='\n\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[0m\]\n\$ '
