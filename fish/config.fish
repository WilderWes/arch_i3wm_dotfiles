# https://fishshell.com/docs/current/fish_for_bash_users.html

# vi mode
fish_vi_key_bindings

# XDG Base Dir
set -x XDG_CONFIG_HOME "$HOME/.config"
set -x XDG_CACHE_HOME "$HOME/.cache"
set -x XDG_DATA_HOME "$HOME/.local/share"

# Path
set -x PATH "$PATH:$HOME/.local/bin"

# Aliases
alias ls='eza -la --color=always --group-directories-first --icons=auto'
alias fastfetch="fastfetch --config examples/8.jsonc"
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias x-copy="xclip -selection clipboard"
alias g++="g++ -std=c++23"

# Go
set -x GOPATH "$XDG_DATA_HOME/go"
set -x PATH "$PATH:$GOPATH/bin"

# Ocaml
test -r '/home/wpreising/.opam/opam-init/init.fish' && source '/home/wpreising/.opam/opam-init/init.fish' >/dev/null 2>/dev/null; or true

# set neovim as default
set -x EDITOR nvim
set -x VISUAL nvim

# manpage
# https://www.reddit.com/r/neovim/comments/1k1k9bz/use_neovim_as_the_default_man_page_viewer/
set -x MANPAGER "nvim +Man!"

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
