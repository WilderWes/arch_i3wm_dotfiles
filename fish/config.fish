# https://fishshell.com/docs/current/fish_for_bash_users.html

# XDG Base Dir
set XDG_CONFIG_HOME "$HOME/.config"
set XDG_CACHE_HOME "$HOME/.cache"
set XDG_DATA_HOME "$HOME/.local/share"

# Aliases
alias get_idf='. $HOME/esp/esp-idf/export.sh'
alias ls='eza -la --color=always --group-directories-first --icons'
alias fastfetch="fastfetch --config examples/8.jsonc"
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias x-copy="xclip -selection clipboard"

# Go
set GOPATH "$XDG_DATA_HOME/go"
set PATH "$PATH:$GOPATH/bin"

# yazi
function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    command yazi $argv --cwd-file="$tmp"
    if read -z cwd <"$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

# greeting
function fish_greeting
    fastfetch
end

# starship
starship init fish | source
