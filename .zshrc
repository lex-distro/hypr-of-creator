# ~/.zshrc

# Auto Complete
autoload -Uz compinit
compinit
zstyle '*:completion:' menu select

# History File
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

# Keybinds
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word

# Aliases
alias ls="ls --color=auto"
alias la="ls -lhA --color=auto"
alias vim=nvim
alias hypr-conf="nvim ~/.config/hypr/hyprland.lua"
alias kitty-conf="nvim ~/.config/kitty/$LEX_THEME.conf"
alias waybar-conf="nvim ~/.config/waybar/config.jsonc"
alias waybar-modules="nvim ~/.config/waybar/modules.json"
alias waybar-style-conf="nvim ~/.config/waybar/style.css"

# Starship
eval "$(starship init zsh)"

