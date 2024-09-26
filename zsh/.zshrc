source "$XDG_CONFIG_HOME/zsh/aliases"
source "$XDG_CONFIG_HOME/zsh/scripts.sh"

# add pywal colors
# (cat ~/.cache/wal/sequences &)
# also for tty
# source ~/.cache/wal/colors-tty.sh

bindkey -v
bindkey "\e[3~" delete-char
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line
bindkey "\e[A" history-beginning-search-backward
bindkey "\e[B" history-beginning-search-forward
export KEYTIMEOUT=1
# [[ $- != *i* ]] && return

zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Autocompletion
autoload -U compinit; compinit

# Autocomplete hidden files
_comp_options+=(globdots)

source <(fzf --zsh)

eval "$(starship init zsh)"
eval "$(zoxide init --cmd cd zsh)"
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
