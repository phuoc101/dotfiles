#!/usr/bin/bash
mkdir -p ~/sys_tools
echo "===ADDING PPAs\n"
# OBS-studio
sudo add-apt-repository ppa:obsproject/obs-studio
# Ibus Bamboo
sudo add-apt-repository ppa:bamboo-engine/ibus-bamboo
# Inkscape
sudo add-apt-repository universe
sudo add-apt-repository ppa:inkscape.dev/stable
# Openshot
sudo add-apt-repository ppa:openshot.developers/ppa
# Signal
wget -O- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor > signal-desktop-keyring.gpg
cat signal-desktop-keyring.gpg | sudo tee /usr/share/keyrings/signal-desktop-keyring.gpg > /dev/null
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] https://updates.signal.org/desktop/apt xenial main' |\
    sudo tee /etc/apt/sources.list.d/signal-xenial.list
# Brave
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
# Syncthing
sudo curl -o /usr/share/keyrings/syncthing-archive-keyring.gpg https://syncthing.net/release-key.gpg
echo "deb [signed-by=/usr/share/keyrings/syncthing-archive-keyring.gpg] https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list
echo "deb [signed-by=/usr/share/keyrings/syncthing-archive-keyring.gpg] https://apt.syncthing.net/ syncthing candidate" | sudo tee /etc/apt/sources.list.d/syncthing.list
# I3wm from sur5r
/usr/lib/apt/apt-helper download-file https://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2023.02.18_all.deb keyring.deb SHA256:a511ac5f10cd811f8a4ca44d665f2fa1add7a9f09bef238cdfad8461f5239cc4
sudo apt install ./keyring.deb
echo "deb [arch=amd64] http://debian.sur5r.net/i3/ $(grep '^DISTRIB_CODENAME=' /etc/lsb-release | cut -f2 -d=) universe" | sudo tee /etc/apt/sources.list.d/sur5r-i3.list
# For rofi+polybar
sudo add-apt-repository ppa:cppiber/ppa
# Papirus icon theme
sudo add-apt-repository ppa:papirus/papirus
sudo apt update

echo "===INSTALLING FLATPAK===\n"
sudo apt install flatpak
flatpak remote-add --if-not-exists flathub \
    https://dl.flathub.org/repo/flathub.flatpakrepo

echo "===INSTALLING RUST\n"
curl https://sh.rustup.rs -sSf | sh

echo "===INSTALLING GOLANG\n"
cd ~/sys_tools
wget https://go.dev/dl/go1.21.1.src.tar.gz
sudo rm -rf /usr/local/go
sudo tar -C /usr/local -xzf go1.21.1.linux-amd64.tar.gz
go version

echo "===INSTALLING KITTY TERMINAL===\n"
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
# Create symbolic links to add kitty and kitten to PATH (assuming ~/.local/bin is in
# your system-wide PATH)
ln -sf ~/.local/kitty.app/bin/kitty ~/.local/kitty.app/bin/kitten ~/.local/bin/
# Place the kitty.desktop file somewhere it can be found by the OS
cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
# If you want to open text files and images in kitty via your file manager also add the kitty-open.desktop file
cp ~/.local/kitty.app/share/applications/kitty-open.desktop ~/.local/share/applications/
# Update the paths to the kitty and its icon in the kitty.desktop file(s)
sed -i "s|Icon=kitty|Icon=/home/$USER/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty*.desktop
sed -i "s|Exec=kitty|Exec=/home/$USER/.local/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty*.desktop
# Make Kitty default terminal emulator
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator `which kitty` 50
sudo update-alternatives --config x-terminal-emulator


echo "==INSTALLING GITHUB-CLI==="
type -p curl >/dev/null || (sudo apt update && sudo apt install curl -y)
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
&& sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update \
&& sudo apt install gh -y

echo "===INSTALLING ESSENTIALS===\n"
sudo apt install git curl clang clang-format udiskie tmux zsh clang-format \
    texlive-full python-is-python3 python3-pip xsel xclip polybar rofi arandr \
    autorandr qt5-style-kvantum brightnessctl lxappearance feh qt5ct \
    gtk2-engines-murrine gnome-themes-extra gnome-tweak-tool papirus-icon-theme \
    autoconf gcc make pkg-config libpam0g-dev libcairo2-dev \
    libfontconfig1-dev libxcb-composite0-dev libev-dev libx11-xcb-dev \
    libxcb-xkb-dev libxcb-xinerama0-dev libxcb-randr0-dev libxcb-image0-dev \
    libxcb-util-dev libxcb-xrm-dev libxkbcommon-dev libxkbcommon-x11-dev \
    libjpeg-dev libgtk-3-dev libreadline-dev xdotool udiskie copyq btop bat \
    fd-find brave-browser signal-desktop openshot-qt python3-openshot syncthing \
    i3 flameshot ffmpeg obs-studio handbrake zathura sxiv kdeconnect mpv
sudo apt-get install ibus ibus-bamboo --install-recommends
ibus restart

flatpak install flathub md.obsidian.Obsidian
# Install Rust applications
cargo install texlab exa ripgrep stylua
# Install from pip
pip3 install --user mdformat xmlformatter black flake8 pynvim i3ipc rofimoji
# Install lazygit
go install github.com/jesseduffield/lazygit@latest
# Install dragon
cd ~/sys_tools
git clone git@github.com:mwh/dragon.git
cd dragon
make install
# Install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/sys_tools/fzf
~/sys_tools/fzf/install
# Install nnn
cd ~/sys_tools
git clone git@github.com:jarun/nnn.git
cd nnn
make O_NERD=1
cp nnn ~/.local/bin
mkdir -p ~/.config/nnn/plugins
cd ~/.config/nnn/plugins
sh -c "$(curl -Ls https://raw.githubusercontent.com/jarun/nnn/master/plugins/getplugs)"

echo "===INSTALL BETTERLOCKSCREEN===\n"
# Install i3lock-color
cd ~/sys_tools
git clone https://github.com/Raymo111/i3lock-color.git
cd i3lock-color
./install-i3lock-color.sh
# Install betterlockscreen
cd ~/sys_tools
wget https://github.com/betterlockscreen/betterlockscreen/archive/refs/heads/main.zip
unzip main.zip
cd betterlockscreen-main/
chmod u+x betterlockscreen
sudo cp betterlockscreen /usr/local/bin/
sudo cp system/betterlockscreen@.service /usr/lib/systemd/system/
systemctl enable betterlockscreen@$USER

# Install ROS NOETIC
echo "===INSTALL ROS NOETIC===\n"
read -p "Press [ENTER] to continue"
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
sudo apt install ros-noetic-desktop-full
sudo apt install python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential
sudo rosdep init
rosdep update
sudo apt install python3-catkin-tools python3-vcstool

# Install Miniconda
echo "===INSTALL MINICONDA==="
read -p "Press [ENTER] to continue"
mkdir -p ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm -rf ~/miniconda3/miniconda.sh

echo "DONE! Install manually:
- Neovim (https://github.com/neovim/neovim/releases)
- Fluent gtk theme (https://www.pling.com/p/1477941/)
- Fluent kde theme (https://www.pling.com/p/1499836/)
- Telegram (https://desktop.telegram.org/)
- Whatsdesk (https://gitlab.com/zerkc/whatsdesk)
- Veracrypt (https://www.veracrypt.fr/en/Downloads.html)
- ProtonVPN (https://protonvpn.com/support/linux-vpn-tool/#debian)
- Final2x (https://github.com/Tohrusky/Final2x/releases)
"
