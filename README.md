# Programs to install

## Essentials

```bash
sudo apt install git curl clang clang-format udiskie tmux
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
  - Formatters for languages: texlab, mdformat, xmlformmatter, black, flake8, stylua

  ```bash
  pip install mdformat xmlformatter black flake8
  sudo apt install clang-format texlive-full
  cargo install texlab stylua
  go install github.com/jesseduffield/lazygit@latest
  ```

## RICE

- Build or Binary:

  - [i3](https://i3wm.org/docs/repositories.html)

  ```bash
  /usr/lib/apt/apt-helper download-file https://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2023.02.18_all.deb keyring.deb SHA256:a511ac5f10cd811f8a4ca44d665f2fa1add7a9f09bef238cdfad8461f5239cc4
  sudo apt install ./keyring.deb
  echo "deb [arch=amd64] http://debian.sur5r.net/i3/ $(grep '^DISTRIB_CODENAME=' /etc/lsb-release | cut -f2 -d=) universe" | sudo tee /etc/apt/sources.list.d/sur5r-i3.list
  sudo apt update
  sudo apt install i3
  ```

  - [i3lock-color](https://github.com/Raymo111/i3lock-color#building-i3lock-color) and [betterlockscreen](https://github.com/betterlockscreen/betterlockscreen#installation)

  ```bash
  sudo apt install autoconf gcc make pkg-config libpam0g-dev libcairo2-dev libfontconfig1-dev libxcb-composite0-dev libev-dev libx11-xcb-dev libxcb-xkb-dev libxcb-xinerama0-dev libxcb-randr0-dev libxcb-image0-dev libxcb-util-dev libxcb-xrm-dev libxkbcommon-dev libxkbcommon-x11-dev libjpeg-dev
  cd ~/sys_tools
  git clone https://github.com/Raymo111/i3lock-color.git
  cd i3lock-color
  ./install-i3lock-color.sh

  cd ~/sys_tools
  wget https://github.com/betterlockscreen/betterlockscreen/archive/refs/heads/main.zip
  unzip main.zip
  cd betterlockscreen-main/
  chmod u+x betterlockscreen
  sudo cp betterlockscreen /usr/local/bin/
  sudo cp system/betterlockscreen@.service /usr/lib/systemd/system/
  systemctl enable betterlockscreen@$USER
  ```

  - [kitty](https://sw.kovidgoyal.net/kitty/binary/)

    - Make Kitty default terminal

    ```bash
    sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator `which kitty` 50
    sudo update-alternatives --config x-terminal-emulator
    ```

  - [neovim](https://github.com/neovim/neovim/releases)

    - [AstroNvim](https://github.com/AstroNvim/AstroNvim)
    - [User config for AstroNvim](https://github.com/phuoc101/astronvim_config)

    ```bash
    git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/dotfiles/.config/nvim
    cd ~/dotfiles/.config/nvim/lua
    git clone git@github.com:phuoc101/astronvim_config.git user
    ```

    - For clipboard access: `sudo apt install xsel xclip`
    - Pynvim: `pip3 install pynvim`
    - Make neovim default editor:

    ```bash
    sudo update-alternatives --install /usr/bin/editor editor `which nvim` 50
    sudo update-alternatives --config editor
    ```

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
  - Command:

  ```bash
  sudo apt install i3 polybar rofi arandr qt5-style-kvantum brightnessctl lxappearance feh qt5ct;
  pip install autorandr
  ```

  - _NOTE_: For **Ubuntu 20.04** use this PPA: `sudo add-apt-repository ppa:cppiber/ppa`

- Theming:

  - Icon theme:
    - [Flatery](https://www.pling.com/p/1332404/)
    - [Papyrus](https://github.com/limbusdev/papyrus-icon-theme)
  - GTK theme: [Fluent](https://www.pling.com/p/1477941/)
  - Kvantum theme: [Fluent](https://www.pling.com/p/1499836/)
  - Terminal Font: [JetBrainsMono Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip)

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

  ```bash
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/sys_tools/fzf
  ~/sys_tools/fzf/install
  ```

  - [nnn](https://github.com/jarun/nnn#quickstart) and [plugins](https://github.com/jarun/nnn/blob/master/plugins/README.md) (make with O_NERD=1)

  ```bash
  sudo apt-get install libreadline-dev
  cd ~/sys_tools
  git clone git@github.com:jarun/nnn.git
  cd nnn
  make O_NERD=1
  cp nnn ~/.local/bin
  mkdir -p ~/.config/nnn/plugins
  cd ~/.config/nnn/plugins
  ```

  - _Note for not cd into file while searching_: go to src/nnn.c, search for line saying `/* If the only match is a dir, auto-enter and cd into it */` and comment the lower part
  - _Note for remapping C-F and C-D for page down/up_: go to src/nnn.h, add:

  ```cpp
  { CONTROL('F'),   SEL_PGDN },
  { CONTROL('B'),   SEL_PGUP },
  ```

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
  - [btop](https://github.com/aristocratos/btop#installation): system monitoring

- From apt:

  - fd: Rust version of find
  - bat: Rust version of cat
  - exa: (fancier) Rust version of ls
  - ripgrep: (fancier) Rust version of grep
  - CopyQ: clipboard manager
  - Command:

  ```bash
  sudo apt install udiskie copyq btop bat fd-find
  cargo install exa ripgrep
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
  - [Signal](https://www.signal.org/download/#)

  ```bash
  # NOTE: These instructions only work for 64-bit Debian-based
  # Linux distributions such as Ubuntu, Mint etc.

  # 1. Install our official public software signing key:
  wget -O- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor > signal-desktop-keyring.gpg
  cat signal-desktop-keyring.gpg | sudo tee /usr/share/keyrings/signal-desktop-keyring.gpg > /dev/null

  # 2. Add our repository to your list of repositories:
  echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] https://updates.signal.org/desktop/apt xenial main' |\
    sudo tee /etc/apt/sources.list.d/signal-xenial.list

  # 3. Update your package database and install Signal:
  sudo apt update && sudo apt install signal-desktop
  ```

  - [Zoom](https://zoom.us/download)
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

  - [Final2x](https://github.com/Tohrusky/Final2x/releases)

  ```bash
  # Download the AppImage/Deb file from one of the releases
  # Better to install this inside a virtual environment
  conda create -n superres python=3.8 pip
  pip install Final2x-core
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
  sudo add-apt-repository ppa:obsproject/obs-studio
  sudo apt update
  sudo apt install flameshot ffmpeg obs-studio handbrake zathura sxiv kdeconnect mpv
  ```

# Research

- [ROS Noetic](https://wiki.ros.org/noetic/Installation/Ubuntu)

```bash
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
sudo apt install ros-noetic-desktop-full
sudo apt install python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential
sudo rosdep init
rosdep update
sudo apt install python3-catkin-tools python3-vcstool
```

- [Miniconda](https://docs.conda.io/projects/miniconda/en/latest/)

```bash
mkdir -p ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm -rf ~/miniconda3/miniconda.sh
```

- [Zotero](https://www.zotero.org/download/)

# Settings and Fixes

- `N: Skipping acquire of configured file 'main/binary-i386/Packages' as repository doesn't support architecture 'i386'`
  - Add \[arch=amd64\] to `.list` file in `/etc/apt/sources.list.d`
- Add Natural scrolling:
  - Edit `/usr/share/X11/xorg.conf.d/40-libinput.conf`
  - Add there `Option "NaturalScrolling" "True"` like this:
  - For your mouse:
  ```
  # Match on all types of devices but joysticks
  Section "InputClass"
          Identifier "libinput pointer catchall"
          MatchIsPointer "on"
          MatchDevicePath "/dev/input/event*"
          Driver "libinput"
          Option "NaturalScrolling" "True"
  EndSection
  ```
  - For your touchpad:
  ```
  Section "InputClass"
          Identifier "libinput touchpad catchall"
          MatchIsTouchpad "on"
          MatchDevicePath "/dev/input/event*"
          Driver "libinput"
          Option "NaturalScrolling" "True"
  EndSection
  ```
  - Then log off and on to apply.
