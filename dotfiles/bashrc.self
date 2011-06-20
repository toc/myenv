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

# short name of Emacs 
# MUST be added each executable file path to `PATH'
if [ `uname -o` == "Cygwin" ]; then
    alias e='meadow'
    alias E='meadow'
else
    alias e='emacs'
    alias E='emacs'
fi

# Set up command-line prompt
# ##########################
# PS1: command line prompt
# if [ "$TERM" == "emacs" ]; then
#   PS1='$ '; export PS1;
# fi
