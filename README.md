# Arch i3wm Dotfiles

Author: Weston Preising
Date: 2026-03-31

## Intro

An opinionated Arch i3wm setup for development.
High level, this is a fairly basic i3wm setup which emphasizes vim-based workflows and applications.
Some audio/video tools included for recording guitar.
This is an Arch Install using the cachyos-repos and some of the post-install tips from its wiki like apparmor, ufw, btrfs-snapper support etc.

## Pitfalls

- No automated external monitor support atm but autorandr will be added at a later date.
- probably can remove `oh-my-zsh`...

## Arch Setup

- [cachyos-repos](https://wiki.cachyos.org/features/optimized_repos/#adding-our-repositories-to-an-existing-arch-linux-install) -- repos have some nice pre-built binaries `paru`, `vesktop`, `localsend`, `cloudflare-warp-bin`, `qt5-webengine (for davinci-resolve)` to name a few
  - [linux-cachyos kernel](https://wiki.cachyos.org/features/kernel/) & [cachyos-settings](https://wiki.cachyos.org/features/cachyos_settings/)-- for improved desktop performance and responsiveness
- [downgrade](https://aur.archlinux.org/packages/downgrade) -- makes it easy to rollback a broken pkg
- [pactree](https://wiki.archlinux.org/title/Pacman) -- part of `pacman-contrib`; shows dependency tree
- [display-manager](https://github.com/fairyglade/ly) -- via ly (tui-based)
  - [keyring/pam setup](https://wiki.archlinux.org/title/GNOME/Keyring) -- to get 1password working
- [printer support](https://wiki.archlinux.org/title/CUPS) -- via cups/avahi-daemon/nss-mdns
- [post-update system snapshots](https://wiki.archlinux.org/title/Snapper) via snapper/btrfs-assistant and instructions from cachyos-wiki
- [bluelight filter](https://wiki.archlinux.org/title/Redshift) -- via redshift
- [noto-fonts-*](https://www.reddit.com/r/archlinux/comments/rm3kch/which_fonts_do_you_guys_actually_install/) -- a good set of fonts for entire system
  - `sudo pacman -S $(pacman -Ssq noto-fonts)`
- [fontconfig](https://wiki.archlinux.org/title/Font_configuration) + `.Xresources` -- font rendering (hinting, antialiasing) and HiDPI DPI settings
- [security](https://wiki.cachyos.org/configuration/post_install_setup/)
  - [AppArmor](https://wiki.archlinux.org/title/AppArmor) -- mandatory access control (MAC) security framework
  - [ufw](https://wiki.archlinux.org/title/Uncomplicated_Firewall) -- uncomplicated firewall
  - [1Password](https://1password.com/) -- password manager desktop app (`$mod+p`)
- [dark theme reddit](<https://www.reddit.com/r/hyprland/comments/1h4abmt/how_do_i_apply_dark_theme/>) -- system wide darkmode from reddit
  - [qt5ct](https://github.com/desktop-app/qt5ct) [qt6ct](https://github.com/trialuser02/qt6ct) [adw-gtk3-theme](https://github.com/lassekango83/adw-gtk3)
- [disable audio suspension pipewire](https://wiki.archlinux.org/title/PipeWire) -- prevents clipping when audio stops/starts
- [LocalSend](https://localsend.org/) -- cross-platform file sharing
- [flameshot](https://flameshot.org/) -- screenshot

## Current Languages

- git
- bash
- zsh
- latex
- C/C++
- python
- jdk25
- go
- rust -- in progress

## i3wm Setup

- [libinput](https://wiki.archlinux.org/title/Libinput) -- `40-libinput.conf`
  - caps lock → ctrl, flat pointer accel, tap-to-click, natural scrolling
- [lxqt-policykit](https://github.com/lxqt/lxqt-policykit) -- program to manage app privileges
- [network-manager-applet](https://wiki.archlinux.org/title/NetworkManager) -- show network icon in i3bar
- [pasystray](https://github.com/christophgysin/pasystray) -- show audio icon in i3bar
- [Picom](https://github.com/yshui/picom) -- prevent screen-tearing via vysnc and egl backend
- [rofi](https://github.com/davatorium/rofi) -- file browser
- [feh](https://feh.finalrewind.org/) -- wallpaper
[xclip](https://github.com/astrand/xclip) -- clipboard
- [xss-lock](https://bitbucket.org/raymonad/xss-lock) + [i3lock](https://i3wm.org/i3lock/) + [xidlehook](https://wiki.archlinux.org/title/I3) -- lock i3wm
- [maim](https://github.com/naelstrof/maim) -- screenshot utility
- [brightnessctl](https://github.com/Hummer12007/brightnessctl) -- enable brightness control keys
- [dex-autostart](https://github.com/jceb/dex) -- autostart programs
- [snixembed](https://www.reddit.com/r/i3wm/comments/ywz4t8/i3_not_showing_tray_icons_for_eg_discord_and/) -- fixes some apps not showing up in `i3bar` like `dropbox`, `cloudflare-warp taskbar`

## Terminal & Shell

- [ghostty](https://ghostty.org/download) -- JetBrains Mono and Tokyo Night theme
- [zsh](https://wiki.archlinux.org/title/Zsh)
- [starship](https://starship.rs/) -- terminal prompt
- [eza](https://github.com/eza-community/eza) -- ls replacement
- [fastfetch](https://github.com/fastfetch-cli/fastfetch) -- fetch system info on shell start
- [cpdf](https://github.com/coherentgraphics/cpdf-binaries) -- PDF manipulation CLI
- [tldr](https://github.com/tldr-pages/tldr) -- quick cli tips n' tricks
- [bear](https://github.com/rizsotto/Bear) -- reads compile commands from make and adds hints to clangd
- [ripgrep-all](https://github.com/phiresky/ripgrep-all) -- ripgrep but for pdfs

## Editor & File Management

- [yazi](https://github.com/sxyazi/yazi) -- terminal file manager
- [Neovim](https://neovim.io/) via [LazyVim](https://www.lazyvim.org/) -- notable extra plugins:
- [vscodium](https://vscodium.com/) -- as needed for school when turning in jupyter notebook assignments
- [zathura-pdf-poppler](https://pwmt.org/projects/zathura-pdf-poppler/) -- for PDF viewing (dark mode, clipboard selection)
- [libreoffice-fresh](https://wiki.archlinux.org/title/LibreOffice)
  - see fonts, hunspell, etc on wiki

## Browsers

- [firefox](https://www.firefox.com/en-US/) -- main browser
  - [DarkReader](https://darkreader.org/)
  - [uBlock Origin](https://ublockorigin.com/)
  - [bypass-paywalls](https://gitflic.ru/project/magnolia1234/bypass-paywalls-firefox-clean)
  - [SponsorBlock](https://sponsor.ajay.app/)
  - [Unhook](https://unhook.app/)
  - [1Password](https://1password.com/downloads/browser-extension)
- [qutebrowser](https://qutebrowser.org/) used strictly for [Markdown Preview](https://github.com/iamcco/markdown-preview.nvim)

## Communication

- [vesktop](https://vesktop.dev/) -- a better discord

## Music Production

- [Transcribe!](https://www.seventhstring.com/) -- slow down audio, loop sections, transcribe by ear
- [yt-dlp](https://github.com/yt-dlp/yt-dlp) -- download videos/audio from YouTube
- [Bitwig Studio](https://www.bitwig.com/) -- DAW
- [DaVinci Resolve Studio](https://www.blackmagicdesign.com/products/davinciresolve) -- video editing
- [OBS Studio](https://obsproject.com/) with [DroidCam](https://www.dev47apps.com/) -- recording/streaming

## AI Usage

- Currently taking a break from AI -- even in the minimal capacity it was used. Reading man-pages and official documentation via Zeal takes more time but I find leads to a deeper understanding and satisfaction for me personally.
