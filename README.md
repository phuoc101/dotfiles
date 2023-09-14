# Programs to install

## Essentials

```bash
    sudo apt install git curl clang clang-format udiskie
```

- Shell:

  - zsh: `sudo apt install zsh`
    - Make zsh default shell: `chsh -s $(which zsh)` then logout

- Package Manager:

  - [Flatpak](https://flatpak.org/setup/Ubuntu)

  ```bash
      sudo apt install flatpak
      flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
  ```

  - [NVM](https://github.com/nvm-sh/nvm#install--update-script)

- Languages:

  - [Golang](https://go.dev/doc/install)
  - [Rust](https://doc.rust-lang.org/cargo/getting-started/installation.html)

  ```bash
      curl https://sh.rustup.rs -sSf | sh
  ```

- Editor

  - texlive-full: LaTeX stuffs
  - Formatters for languages: texlab, mdformat, xmlformmatter

  ```bash
      pip install mdformat xmlformatter
      sudo apt install clang-format texlive-full
      cargo install texlab
      go install github.com/jesseduffield/lazygit@latest
  ```

## RICE

- Build or Binary:

  - [i3](https://i3wm.org/docs/repositories.html)
  - [i3lock-color](https://github.com/Raymo111/i3lock-color#building-i3lock-color) and [betterlockscreen](https://github.com/betterlockscreen/betterlockscreen#installation)
  - [kitty](https://sw.kovidgoyal.net/kitty/binary/)
    - Make Kitty default terminal
    ```bash
    sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator `which kitty` 50
    sudo update-alternatives --config x-terminal-emulator
    ```
  - [neovim](https://github.com/neovim/neovim/releases)
    - [AstroNvim](https://github.com/AstroNvim/AstroNvim)
    - [User config for AstroNvim](https://github.com/phuoc101/astronvim_config)
    - For clipboard access: `sudo apt install xsel xclip`
    - Pynvim: `pip3 install pynvim`

- From apt:

  - I3-wm: window manager
  - Polybar: customizable top bar
  - rofi: app launcher
  - arandr and autorandr: display configs
  - kvantum: kvantum manager
  - feh: wallpaper setting
  - lxappearance: gtk theming
  - qt5ct: qt theming options
  - brightnessctl: control screen brightness
    - **NOTE**: To make brightnessctl work without sudo, add user to the video group with: `sudo usermod -aG video ${USER}`
  - Command: `sudo apt install i3 polybar rofi arandr autorandr qt5-style-kvantum brightnessctl lxappearance feh qt5ct`
  - *NOTE*: For **Ubuntu 20.04** use this PPA: `sudo add-apt-repository ppa:cppiber/ppa`

- Theming:

  - Icon theme:
    - [Flatery](https://www.pling.com/p/1332404/)
    - [Papyrus](https://github.com/limbusdev/papyrus-icon-theme)
  - GTK theme: [Fluent](https://www.pling.com/p/1477941/)
  - Kvantum theme: [Fluent](https://www.pling.com/p/1499836/)

## CLI Tools

- Build or Binary:

  - [dragon](https://github.com/mwh/dragon)

  ```bash
      sudo apt-get install libgtk-3-dev
      cd ~/sys_tools
      git clone git@github.com:mwh/dragon.git
      cd dragon
      make install
      cd ~
  ```

  - [fzf](https://github.com/junegunn/fzf#using-git)
  - [nnn](https://github.com/jarun/nnn#quickstart) and [plugins](https://github.com/jarun/nnn/blob/master/plugins/README.md) (make with O_NERD=1)

  ```bash
      sudo apt-get install libreadline-dev
      cd ~/sys_tools
      git clone git@github.com:jarun/nnn.git
      cd nnn
      make O_NERD=1
      cp nnn ~/.local/bin
  ```
    - *Note for not cd into file while searching*: go to src/nnn.c, search for line saying `/* If the only match is a dir, auto-enter and cd into it */` and comment the lower part

  - [ani-cli](https://github.com/pystardust/ani-cli)
  - [Syncthing](https://apt.syncthing.net/)

  ```
    sudo curl -o /usr/share/keyrings/syncthing-archive-keyring.gpg https://syncthing.net/release-key.gpg
    echo "deb [signed-by=/usr/share/keyrings/syncthing-archive-keyring.gpg] https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list
    echo "deb [signed-by=/usr/share/keyrings/syncthing-archive-keyring.gpg] https://apt.syncthing.net/ syncthing candidate" | sudo tee /etc/apt/sources.list.d/syncthing.list
    sudo apt-get update
    sudo apt-get install syncthing
  ```

  - [autotiling](https://github.com/nwg-piotr/autotiling) (need to install python3-i3ipc)
    - `pip3 install i3ipc`
  - rofimoji: emoji picker
    - `sudo apt install xdotool`
    - [Noto Emoji](https://fonts.google.com/noto/specimen/Noto+Color+Emoji)
    - `pip3 install --user rofimoji`

- From apt:

  - Udiskie: auto mount external drives
  - CopyQ: clipboard manager
  - Btop: system monitoring
  - Command:

  ```bash
    sudo apt install udiskie copyq btop
  ```

## Apps

- Build or Binary:

  - [Brave](https://brave.com/linux/)

  ```bash
      sudo apt install curl
      sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
      echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
      sudo apt update
      sudo apt install brave-browser
  ```

  - [Telegram](https://desktop.telegram.org/)
  - [Whatsdesk](https://gitlab.com/zerkc/whatsdesk)
  - [Veracrypt](https://www.veracrypt.fr/en/Downloads.html)
  - [OpenShot](https://www.openshot.org/ppa/)

  ```bash
    sudo add-apt-repository ppa:openshot.developers/ppa
    sudo apt update
    sudo apt install openshot-qt python3-openshot
  ```

  - [ProtonVPN](https://protonvpn.com/support/linux-vpn-tool/#debian)

  ```bash
      sudo apt-get install {/path/to/}protonvpn-stable-release_1.0.3_all.deb
      sudo apt-get update
      sudo apt-get install protonvpn-cli
  ```

  - [Inkscape](https://wiki.inkscape.org/wiki/Installing_Inkscape#Ubuntu_or_Debian)

  ```bash
    sudo add-apt-repository universe
    sudo add-apt-repository ppa:inkscape.dev/stable
    sudo apt-get update
    sudo apt install inkscape
  ```

  - [ibus-bamboo](https://github.com/BambooEngine/ibus-bamboo)

  ```bash
    sudo add-apt-repository ppa:bamboo-engine/ibus-bamboo
    sudo apt-get update
    sudo apt-get install ibus ibus-bamboo --install-recommends
    ibus restart
  ```

- From flatpak:

- `flatpak install flathub md.obsidian.Obsidian`

- From apt:

  - OBS-Studio: screen recording

  - Flameshot: screenshot+editing

  - Handbrake: compressing videos

  - zathura: PDF viewer

  - sxiv: image viewer

  - KDE Connect: connect with Android phone

  - PavuControl: GUI interface to control Pulseaudio

  - MPV: video viewer

  - Command:

  ```bash
    sudo apt install flameshot obs-studio handbrake zathura sxiv kdeconnect mpv
  ```

# Fixes

- `N: Skipping acquire of configured file 'main/binary-i386/Packages' as repository doesn't support architecture 'i386'`
  - Add \[arch=amd64\] to `.list` file in `/etc/apt/sources.list.d`
