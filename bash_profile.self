# -*- Mode: sh; Coding: utf-8-unix; -*-
# 
# bash_profile.self: .bash_profile補完リソースファイル
# 
#   環境変数定義を中心とする環境設定ファイル。
#   .bash_profileから次の様にインポートして利用されることを想定。
# 
#   ### Import external resource file
#   [ -f ~/.bash_profle.self ] && . ~/.bash_profle.self
# 

# PS1: command line prompt
if [ "$TERM" == "emacs" ]; then
  PS1='$ '; export PS1;
fi

