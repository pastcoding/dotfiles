### SETTING OTHER ENVIRONMENT VARIABLES
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
# History filepath
export HISTFILE="$ZDOTDIR/.zhistory"
# Maximum events for internal history
export HISTSIZE=10000
# Maximum events in history file
export SAVEHIST=10000
export HISTORY_IGNORE="(ls|ll|la|lt|cd|pwd|exit|reboot|sudo reboot|history|cd -|cd ..)"

export TERM="xterm-256color"
export EDITOR="nvim"
export MANPAGER="nvim +Man!"
export FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git '"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
