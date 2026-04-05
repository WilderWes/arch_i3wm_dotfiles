# arch wiki zsh -- https://wiki.archlinux.org/title/Zsh#
# zsh startup files -- https://zsh.sourceforge.io/Guide/zshguide02.html
# zsh move compinit -- https://stackoverflow.com/questions/47745184/change-location-of-zcompdump-files
# arch wiki xdg base dir -- https://wiki.archlinux.org/title/XDG_Base_Directory
# npm without sudo -- https://stackoverflow.com/questions/18088372/how-to-npm-install-global-not-as-root
# starship prompt -- https://starship.rs/guide/
# fastfetch -- https://github.com/fastfetch-cli/fastfetch
# yazi -- https://yazi-rs.github.io/

# Path
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# XDG Base Dir
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache" 
export XDG_DATA_HOME="$HOME/.local/share"

# Go Path
export GOPATH=$XDG_DATA_HOME/go
export PATH=$PATH:$GOPATH/bin

# Opam
[[ ! -r '/home/wpreising/.opam/opam-init/init.zsh' ]] || source '/home/wpreising/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null

# Aliases
alias get_idf='. $HOME/esp/esp-idf/export.sh'
alias ls='eza -la --color=always --group-directories-first --icons'
alias fastfetch="fastfetch --config examples/8.jsonc"
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias x-copy="xclip -selection clipboard"

# Yazi
function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    yazi "$@" --cwd-file="$tmp"
    IFS= read -r -d '' cwd < "$tmp"
    [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
    rm -f -- "$tmp"
}

# History
HISTSIZE=1000
SAVEHIST=1000
HISTFILE="$XDG_DATA_HOME/zsh/zsh_history"
# mastering-zsh https://github.com/rothgar/mastering-zsh/blob/master/docs/config/history.md
setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.
setopt APPEND_HISTORY            # append to history file
setopt HIST_NO_STORE             # Don't store history commands

# Completions
autoload -Uz compinit
compinit -d "$XDG_CACHE_HOME/zsh/zcompdump"
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate

# Fish-like syntax highlighting and autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# pkgfile "command not found" handler
source /usr/share/doc/pkgfile/command-not-found.zsh

# Starship
eval "$(starship init zsh)"

# Fastfetch
fastfetch
