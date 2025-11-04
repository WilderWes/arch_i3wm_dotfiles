## Modern .zshrc with chatgpt 5 help
# ------------------------------------------------------------
# Oh My Zsh base configuration
# ------------------------------------------------------------
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

# Plugins to load (add/remove as you need)
plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  zsh-completions
  gradle-completion
)

source $ZSH/oh-my-zsh.sh

# ------------------------------------------------------------
# PATH setup (zsh-native)
# ------------------------------------------------------------
# Use the `path` array instead of one long string.
# This avoids duplicates and makes order easy to control.
path+=(
  $HOME/.local/bin
  $HOME/bin
)
typeset -U path   # deduplicate while keeping left-most entries
export PATH

# ------------------------------------------------------------
# Aliases
# ------------------------------------------------------------
alias get_idf='. $HOME/esp/esp-idf/export.sh'
alias ls='eza -la --color=always --group-directories-first --icons'
alias fastfetch="fastfetch --config examples/8.jsonc"
alias update-grub="sudo grub2-mkconfig -o /etc/grub2.cfg"

# ------------------------------------------------------------
# Prompt
# ------------------------------------------------------------
eval "$(starship init zsh)"

# ------------------------------------------------------------
# Optional environment variables
# ------------------------------------------------------------
# Uncomment if you need to enforce locale
# export LANG=en_US.UTF-8

# Uncomment to set editor
# export EDITOR=nvim

# ------------------------------------------------------------
# Startup programs
# ------------------------------------------------------------
# Run fastfetch on every new terminal
fastfetch

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
