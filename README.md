# Arch i3wm Dotfiles

Author: Weston Preising
Date: 2026-09-24

## Intro

An opinionated Arch i3wm setup for development.
High level, this is a fairly basic i3wm setup which emphasizes vim-based workflows and applications.
Some audio/video tools included for recording guitar.
Vanilla Arch (`core`, `extra`, `multilib`) on btrfs with `linux-zen`; AUR via `paru`.

## Pitfalls

- No automated external monitor support atm but autorandr will be added at a later date.

## Arch Setup

- [linux-zen](https://wiki.archlinux.org/title/Kernel) -- desktop kernel; `linux` as fallback
- [grub](https://wiki.archlinux.org/title/GRUB) -- bootloader
- [zram-generator](https://wiki.archlinux.org/title/Zram) -- swap in RAM; `zswap.enabled=0`
- [paru](https://aur.archlinux.org/packages/paru) -- AUR helper
- [cloudflare-warp](https://developers.cloudflare.com/warp-client/get-started/linux/) -- more secure internet, verify via [dnsleaktest.com](https://www.dnsleaktest.com/)
  - [systemd-resolved](https://wiki.archlinux.org/title/Systemd-resolved#DNS) -- stops warp/NetworkManager racing over `/etc/resolv.conf`
    - `sudo ln -sf ../run/systemd/resolve/stub-resolv.conf /etc/resolv.conf && sudo systemctl enable --now systemd-resolved`
- [downgrade](https://aur.archlinux.org/packages/downgrade) -- makes it easy to rollback a broken pkg
- [pacman-contrib](https://wiki.archlinux.org/title/Pacman) -- `pactree` shows dependency tree
- [reflector](https://wiki.archlinux.org/title/Reflector) -- `--country US --protocol https --latest 10 --sort rate` in `/etc/xdg/reflector/reflector.conf`, then `sudo systemctl enable --now reflector.timer`
- [alsa-firmware alsa-tools alsa-utils sof-firmware](https://wiki.archlinux.org/title/Advanced_Linux_Sound_Architecture) -- fixes thinkpad mute/micmute leds
- [ly](https://github.com/fairyglade/ly) -- tui-based display manager (`sudo systemctl enable ly@tty1`)
  - [gnome-keyring seahorse](https://wiki.archlinux.org/title/GNOME/Keyring) -- keyring for 1password; `seahorse` is the keyring GUI
- [cups cups-pk-helper system-config-printer](https://wiki.archlinux.org/title/CUPS) -- printer support (`sudo systemctl enable --now cups.socket`)
  - [avahi nss-mdns](https://wiki.archlinux.org/title/Avahi#Hostname_resolution) -- network printer discovery (`sudo systemctl enable --now avahi-daemon`)
    - `/etc/nsswitch.conf`: `hosts: mymachines mdns_minimal [NOTFOUND=return] resolve [!UNAVAIL=return] files myhostname dns`
    - `MulticastDNS=resolve` in `/etc/systemd/resolved.conf`, see [wiki](https://wiki.archlinux.org/title/Systemd-resolved#mDNS)
    - `sudo ufw allow 5353/udp`
- [redshift](https://wiki.archlinux.org/title/Redshift) -- bluelight filter
- [fonts](https://wiki.archlinux.org/title/Fonts) -- `noto-fonts noto-fonts-cjk noto-fonts-emoji ttf-jetbrains-mono`
- [fontconfig](https://wiki.archlinux.org/title/Font_configuration) + `.Xresources` -- font rendering and HiDPI settings
- security
  - [ufw](https://wiki.archlinux.org/title/Uncomplicated_Firewall) -- uncomplicated firewall (`sudo systemctl enable --now ufw`)
  - [1password](https://1password.com/) -- password manager desktop app (`$mod+p`)
- [qt5ct](https://github.com/desktop-app/qt5ct) + [qt6ct](https://github.com/trialuser02/qt6ct) + [adw-gtk-theme](https://github.com/lassekongo83/adw-gtk3) -- system wide darkmode, see [reddit thread](<https://www.reddit.com/r/hyprland/comments/1h4abmt/how_do_i_apply_dark_theme/>)
  - `gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'`
  - `gsettings set org.gnome.desktop.interface gtk-theme 'adw-gtk3-dark'`
  - `echo 'QT_QPA_PLATFORMTHEME=qt6ct' | sudo tee -a /etc/environment`
- [fwupd udisks2 udisks2-btrfs](https://wiki.archlinux.org/title/Fwupd) -- firmware updates via `fwupdmgr`
- [intel graphics](https://wiki.archlinux.org/title/Hardware_video_acceleration) -- `intel-media-driver vpl-gpu-rt vulkan-intel lib32-vulkan-intel lib32-mesa intel-compute-runtime`
- [pipewire](https://wiki.archlinux.org/title/PipeWire) -- `pipewire-alsa pipewire-pulse pipewire-jack pavucontrol`
  - wireplumber -- disable audio suspension; prevents clipping when audio stops/starts
- [gstreamer](https://wiki.archlinux.org/title/GStreamer) -- `gst-libav gst-plugin-pipewire gst-plugin-va gst-plugins-base gst-plugins-good`
- [docker](https://wiki.archlinux.org/title/Docker) -- `sudo systemctl enable --now docker && sudo usermod -aG docker $USER`
- [localsend](https://localsend.org/) -- cross-platform file sharing, see [ufw profile](https://github.com/localsend/localsend/issues/1230)
- [flameshot](https://flameshot.org/) -- screenshot

## Current Languages

- git
- bash/zsh/fish
- [latex](https://wiki.archlinux.org/title/TeX_Live) -- `texlive biber`, vimtex + zathura
- C/C++ -- `clang`
- python -- `uv`
  - `python-matplotlib python-networkx python-pandas python-scipy python-scikit-learn python-pyarrow python-tabulate ipython`
  - `python-jupytext` (AUR) -- notebooks as plain text
- java -- `jdk25-openjdk`
- go
- javascript/typescript -- `npm`
- rust -- to-do

## Documentation

- [zeal](https://github.com/zealdocs/zeal) -- store offline documentation for various languages

## i3wm Setup

- [libinput](https://wiki.archlinux.org/title/Libinput) -- `sudo cp 40-libinput.conf /etc/X11/xorg.conf.d/`
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
- Note: [set battery thresholds](https://discussion.fedoraproject.org/t/how-to-set-battery-health-threshold/175092)
  `echo 80 | sudo tee /sys/class/power_supply/BAT0/charge_control_end_threshold`
  `echo 75 | sudo tee /sys/class/power_supply/BAT0/charge_control_start_threshold`

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
- [lazygit](https://github.com/jesseduffield/lazygit) -- git TUI
- [htop](https://htop.dev/) -- process viewer

## Editor & File Management

- [yazi](https://yazi-rs.github.io/docs/installation#arch) -- terminal file manager
  - `sudo pacman -S yazi ffmpeg 7zip jq poppler fd ripgrep fzf zoxide resvg imagemagick`
- [thunar thunar-archive-plugin gvfs](https://wiki.archlinux.org/title/Thunar) -- GUI file manager with trash, auto-mount, extract/compress
- [neovim](https://neovim.io/) -- configured via [LazyVim](https://www.lazyvim.org/)
- [vscodium-bin](https://vscodium.com/) -- as needed for school when turning in jupyter notebook assignments
- [zathura zathura-pdf-poppler](https://pwmt.org/projects/zathura-pdf-poppler/) -- for PDF viewing (dark mode, clipboard selection)
- [libreoffice-fresh](https://wiki.archlinux.org/title/LibreOffice)
  - see fonts, hunspell, etc on wiki
- [mpv](https://mpv.io/) + [imv](https://sr.ht/~exec64/imv/) -- video and image viewers
- [dropbox](https://wiki.archlinux.org/title/Dropbox) -- cloud file sync
- [canvas_downloader](https://pypi.org/project/canvas_downloader/) -- great way to bulk download canvas pdfs

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

- [realtime-privileges](https://wiki.archlinux.org/title/Realtime_process_management) -- `sudo usermod -aG realtime $USER`
- [transcribe](https://www.seventhstring.com/) -- slow down audio, loop sections, transcribe by ear
- [yt-dlp](https://github.com/yt-dlp/yt-dlp) -- download videos/audio from YouTube
- [bitwig-studio](https://www.bitwig.com/) -- DAW
- [davinci-resolve-studio](https://www.blackmagicdesign.com/products/davinciresolve) -- video editing
- [obs-studio](https://obsproject.com/) -- recording/streaming

## AI Usage

- Using minimally to find better primary source materials or as a socratic tutor for debugging/optimizing code
- used to audit this install and update this README 9/24
