# Dotfiles Setup Guide (Ubuntu & macOS, 2025)

This guide describes how to install all dependencies and use GNU Stow to manage configuration files across Ubuntu and macOS.

---

## Ubuntu

### 1. Install GNU Stow
```bash
sudo apt update
sudo apt install -y stow
```

### 2. Install WezTerm

```
sudo apt install -y curl gpg
curl -fsSL https://apt.fury.io/wez/ | sudo tee /etc/apt/sources.list.d/wezterm.list
curl -fsSL https://apt.fury.io/wez/gpg.key | sudo gpg --dearmor -o /usr/share/keyrings/wezterm-archive-keyring.gpg
sudo apt update
sudo apt install -y wezterm
```


### 3. Install Nushell

`sudo apt install -y nushell`

If unavailable in your repo:

```
curl -s https://api.github.com/repos/nushell/nushell/releases/latest\
| grep "browser_download_url.*linux.*x86_64.deb"\
| cut -d '"' -f 4\
| wget -i - -O nushell.deb
sudo apt install -y ./nushell.deb
```

### 4. Install Zsh

```
sudo apt install -y zsh
chsh -s $(which zsh)
```

### 5. Install Starship Prompt

`curl -sS https://starship.rs/install.sh | sh`

### 6. Install JetBrainsMono Nerd Font

```
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
wget -q https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
unzip -o JetBrainsMono.zip
fc-cache -fv
```

### 7. Install Atuin

`bash <(curl https://raw.githubusercontent.com/atuinsh/atuin/main/install.sh)`

### 8. Install fzf

`sudo apt install -y fzf`

### 9. Install zoxide

`curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash`

### 10. Install Carapace (shell completions generator)

```
curl -fsSL https://github.com/rsteube/carapace-bin/releases/latest/download/carapace-bin_linux_amd64.tar.gz -o carapace.tar.gz
sudo tar -xzf carapace.tar.gz -C /usr/local/bin carapace
```

### 11. Install uv (Python package manager)

`curl -LsSf https://astral.sh/uv/install.sh | sh`

### 12. Install fnm (Fast Node Manager)

`curl -fsSL https://fnm.vercel.app/install | bash`

After installation, add to your shell init:

`eval "$(fnm env)"`


------------

## macOS

### 1. Install GNU Stow

`brew install stow`


### 2. Install WezTerm

`brew install --cask wezterm`

### 3. Install Nushell

`brew install nushell`

### 4. Install Zsh

```
brew install zsh
chsh -s /bin/zsh
```

### 5. Install Starship Prompt

`curl -sS https://starship.rs/install.sh | sh`

### 6. Install JetBrainsMono Nerd Font

`brew install --cask font-jetbrains-mono-nerd-font`

### 7. Install Atuin

`brew install atuin`

### 8. Install fzf

```
brew install fzf
$(brew --prefix)/opt/fzf/install
```

### 9. Install zoxide

`brew install zoxide`

### 10. Install Carapace (shell completions generator)

`brew install rsteube/carapace/carapace`

### 11. Install uv (Python package manager)

`curl -LsSf https://astral.sh/uv/install.sh | sh`

### 12. Install fnm (Fast Node Manager)

`curl -fsSL https://fnm.vercel.app/install | bash`

After installation, add to your shell init:

`eval "$(fnm env)"`

## 13. Use Stow to Manage Dotfiles

Clone your dotfiles and stow each package:

```
./setup.sh
```
