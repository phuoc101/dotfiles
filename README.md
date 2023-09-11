# Programs to install

## RICE

- Build or Binary:

  - [i3lock-color](https://github.com/Raymo111/i3lock-color#building-i3lock-color) and [betterlockscreen](https://github.com/betterlockscreen/betterlockscreen#installation)
  - [kitty](https://sw.kovidgoyal.net/kitty/binary/)
  - [neovim](https://github.com/neovim/neovim/releases)
    - [AstroNvim](https://github.com/AstroNvim/AstroNvim)
    - [User config for AstroNvim](https://github.com/phuoc101/astronvim_config)

- From apt:

  - I3-wm: window manager
  - Polybar: customizable top bar
  - rofi: app launcher
  - arandr and autorandr: display configs
  - kvantum: qt theming
  - lxappearance: gtk theming
  - brightnessctl: control screen brightness
    - **NOTE**: To make brightnessctl work without sudo, add user to the video group with: `sudo usermod -aG video ${USER}`
  - Command: `sudo apt install i3 polybar rofi arandr autorandr qt5-style-kvantum brightnessctl lxappearance`

- Theming:

  - Icon theme: [Flatery](https://www.pling.com/p/1332404/)
  - GTK theme: [Fluent](https://www.pling.com/p/1477941/)
  - Kvantum theme: [Fluent](https://www.pling.com/p/1499836/)

## CLI Tools

- Build or Binary:

  - [dragon](https://github.com/mwh/dragon)
  - [fzf](https://github.com/junegunn/fzf#using-git)
  - [nnn](https://github.com/jarun/nnn/tree/master) and [plugins](https://github.com/jarun/nnn/blob/master/plugins/README.md) (make with O_NERD=1)
  - [ani-cli](https://github.com/pystardust/ani-cli)
  - [Syncthing](https://syncthing.net/downloads/)
  - [autotiling](https://github.com/nwg-piotr/autotiling) (need to install python3-i3ipc)

- From apt:

  - Udiskie: auto mount external drives
  - CopyQ: clipboard manager
  - Btop: system monitoring
  - Command: `sudo apt install udiskie copyq btop python3-i3ipc`

## Apps

- Build or Binary:

  - [Telegram](https://desktop.telegram.org/)
  - [Whatsdesk](https://gitlab.com/zerkc/whatsdesk)
  - [Veracrypt](https://www.veracrypt.fr/en/Downloads.html)
  - [OpenShot](https://www.openshot.org/ppa/)
  - [ProtonVPN](https://protonvpn.com/support/linux-vpn-tool/#debian)

- From flatpak:

  - `flatpak install flathub md.obsidian.Obsidian`

- From apt:

  - OBS-Studio: screen recording
  - Flameshot: screenshot+editing
  - Handbrake: compressing videos
  - Command: `sudo apt install flameshot obs-studio handbrake`
