# Arch i3wm Dotfiles

Author: Weston Preising
Date: 2026-07-26

## Intro

An opinionated Arch i3wm setup for development.
High level, this is a fairly basic i3wm setup which emphasizes vim-based workflows and applications.
Some audio/video tools included for recording guitar.
This is an Arch Install using the cachyos-repos and some of the post-install tips from its wiki like apparmor, ufw, btrfs-snapper support etc.

## Pitfalls

- No automated external monitor support atm but autorandr will be added at a later date.

## Arch Setup

- [cachyos-repos](https://wiki.cachyos.org/features/optimized_repos/#adding-our-repositories-to-an-existing-arch-linux-install) -- repos have some nice pre-built binaries `paru`, `vesktop`, `localsend`, `cloudflare-warp-bin`, `qt5-webengine (for davinci-resolve)` to name a few
  - [linux-cachyos](https://wiki.cachyos.org/features/kernel/) + [linux-cachyos-headers](https://wiki.cachyos.org/features/kernel/) + [cachyos-settings](https://wiki.cachyos.org/features/cachyos_settings/) -- for improved desktop performance and responsiveness
- [downgrade](https://aur.archlinux.org/packages/downgrade) -- makes it easy to rollback a broken pkg
- [pacman-contrib](https://wiki.archlinux.org/title/Pacman) -- `pactree` shows dependency tree
- [acpid](https://wiki.archlinux.org/title/Acpid) -- this fixes thinkpad audio key leds
  - [alsa-firmware alsa-tools alsa-utils](https://wiki.archlinux.org/title/Linux_firmware) -- also required
- [ly](https://github.com/fairyglade/ly) -- tui-based display manager
  - [gnome-keyring seahorse](https://wiki.archlinux.org/title/GNOME/Keyring) -- pam setup to get 1password working; `seahorse` is the keyring GUI
- [cups avahi nss-mdns](https://wiki.archlinux.org/title/CUPS) -- printer support
- [snapper btrfs-assistant snap-pac](https://wiki.archlinux.org/title/Snapper) -- post-update system snapshots, see cachyos-wiki for setup
- [redshift](https://wiki.archlinux.org/title/Redshift) -- bluelight filter
- [noto-fonts-*](https://www.reddit.com/r/archlinux/comments/rm3kch/which_fonts_do_you_guys_actually_install/) -- a good set of fonts for entire system
  - `sudo pacman -S $(pacman -Ssq noto-fonts)`
- [fontconfig](https://wiki.archlinux.org/title/Font_configuration) + `.Xresources` -- font rendering (hinting, antialiasing) and HiDPI DPI settings
- [security](https://wiki.cachyos.org/configuration/post_install_setup/)
  - [apparmor](https://wiki.archlinux.org/title/AppArmor) -- mandatory access control (MAC) security framework
  - [ufw](https://wiki.archlinux.org/title/Uncomplicated_Firewall) -- uncomplicated firewall
  - [1password](https://1password.com/) -- password manager desktop app (`$mod+p`)
- [qt5ct](https://github.com/desktop-app/qt5ct) + [qt6ct](https://github.com/trialuser02/qt6ct) + [adw-gtk-theme](https://github.com/lassekongo83/adw-gtk3) -- system wide darkmode, see [reddit thread](<https://www.reddit.com/r/hyprland/comments/1h4abmt/how_do_i_apply_dark_theme/>)
- [fwupd](https://wiki.archlinux.org/title/Fwupd) -- firmware updates via `fwupdmgr`
  - [udisks2](https://wiki.archlinux.org/title/Udisks) -- required by fwupd
  - [udisks2-btrfs](https://archlinux.org/packages/extra/x86_64/udisks2-btrfs/) -- btrfs support for udisks2
- [wireplumber](https://wiki.archlinux.org/title/PipeWire) -- disable audio suspension; prevents clipping when audio stops/starts
- [localsend](https://localsend.org/) -- cross-platform file sharing
  - [ufw firewall localsend profile](https://github.com/localsend/localsend/issues/1230)
- [flameshot](https://flameshot.org/) -- screenshot

## Current Languages

- git
- bash/zsh/fish
- latex
- C/C++
- python
- jdk25
- go
- rust -- to-do

## Documentation

- [zeal](https://github.com/zealdocs/zeal) -- store offline documentation for various languages

## i3wm Setup

- [libinput](https://wiki.archlinux.org/title/Libinput) -- `40-libinput.conf`
  - caps lock → ctrl, flat pointer accel, tap-to-click, natural scrolling
- [lxqt-policykit](https://github.com/lxqt/lxqt-policykit) -- program to manage app privileges
- [network-manager-applet](https://wiki.archlinux.org/title/NetworkManager) -- show network icon in i3bar
- [blueman] -- gui for bluetooth
- [picom](https://github.com/yshui/picom) -- prevent screen-tearing via vysnc and egl backend
- [rofi](https://github.com/davatorium/rofi) -- file browser
- [hsetroot](https://archlinux.org/packages/extra/x86_64/hsetroot/) -- wallpaper
- [xclip](https://github.com/astrand/xclip) -- clipboard
- [xss-lock](https://bitbucket.org/raymonad/xss-lock) + [i3lock](https://i3wm.org/i3lock/) + [xidlehook](https://wiki.archlinux.org/title/I3) -- lock i3wm
- [maim](https://github.com/naelstrof/maim) -- screenshot utility
- [brightnessctl](https://github.com/Hummer12007/brightnessctl) -- enable brightness control keys
- [snixembed](https://www.reddit.com/r/i3wm/comments/ywz4t8/i3_not_showing_tray_icons_for_eg_discord_and/) -- fixes some apps not showing up in `i3bar` like `dropbox`, `cloudflare-warp taskbar`
- [unclutter](https://wiki.archlinux.org/title/Unclutter) -- hide mouse cursor after 5 seconds

## Terminal & Shell

- [ghostty](https://ghostty.org/download) -- JetBrains Mono and Tokyo Night theme
- [fish](https://fishshell.com/)
- [starship](https://starship.rs/) -- terminal prompt
- [eza](https://github.com/eza-community/eza) -- ls replacement
- [fastfetch](https://github.com/fastfetch-cli/fastfetch) -- fetch system info on shell start
- [cpdf](https://github.com/coherentgraphics/cpdf-binaries) -- PDF manipulation CLI
- [tldr](https://github.com/tldr-pages/tldr) -- quick cli tips n' tricks
- [bear](https://github.com/rizsotto/Bear) -- reads compile commands from make and adds hints to `clangd`
- [ripgrep-all](https://github.com/phiresky/ripgrep-all) -- ripgrep but for pdfs

## Editor & File Management

- [yazi](https://github.com/sxyazi/yazi) -- terminal file manager
- [neovim](https://neovim.io/) -- configured via [LazyVim](https://www.lazyvim.org/)
- [vscodium-bin](https://vscodium.com/) -- as needed for school when turning in jupyter notebook assignments
- [zathura zathura-pdf-poppler](https://pwmt.org/projects/zathura-pdf-poppler/) -- for PDF viewing (dark mode, clipboard selection)
- [libreoffice-fresh](https://wiki.archlinux.org/title/LibreOffice)
  - see fonts, hunspell, etc on wiki

## Browsers

- [firefox](https://www.firefox.com/en-US/) -- main browser
  - [DarkReader](https://darkreader.org/)
  - [uBlock Origin](https://ublockorigin.com/)
  - [SponsorBlock](https://sponsor.ajay.app/)
  - [Unhook](https://unhook.app/)
  - [1Password](https://1password.com/downloads/browser-extension)
  - [bypass-paywalls](https://gitflic.ru/user/magnolia1234)
- [qutebrowser](https://qutebrowser.org/) used strictly for [Markdown Preview](https://github.com/iamcco/markdown-preview.nvim)

## Communication

- [vesktop](https://vesktop.dev/) -- a better discord

## Music Production

- [realtime-privileges](https://wiki.archlinux.org/title/Realtime_process_management) -- remember to add user to group!
- [transcribe](https://www.seventhstring.com/) -- slow down audio, loop sections, transcribe by ear
- [yt-dlp](https://github.com/yt-dlp/yt-dlp) -- download videos/audio from YouTube
- [bitwig-studio](https://www.bitwig.com/) -- DAW
- [davinci-resolve-studio](https://www.blackmagicdesign.com/products/davinciresolve) -- video editing
- [obs-studio](https://obsproject.com/) -- recording/streaming
  - [droidcam-obs-plugin](https://www.dev47apps.com/) -- use an android phone as a webcam source

## AI Usage

- Using minimally to find better primary source materials or as a socratic tutor for debugging/optimizing code
