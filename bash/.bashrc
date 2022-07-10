#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source ~/.git-prompt.sh

bind '"\C-f":"start-session \n"'
bind '"\C-a":"tmux a \n"'

alias l='exa -l'

export LUA_PATH='/usr/share/lua/5.4/?.lua;/usr/share/lua/5.4/?/init.lua;/usr/lib/lua/5.4/?.lua;/usr/lib/lua/5.4/?/init.lua;./?.lua;./?/init.lua;/home/joe/.luarocks/share/lua/5.4/?.lua;/home/joe/.luarocks/share/lua/5.4/?/init.lua'
export LUA_CPATH='/usr/lib/lua/5.4/?.so;/usr/lib/lua/5.4/loadall.so;./?.so;/home/joe/.luarocks/lib/lua/5.4/?.so'
export PATH='/home/joe/.luarocks/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl'
export EDITOR=vim
export STOW_DIR=~/.dotfiles/
eval "$(starship init bash)"
