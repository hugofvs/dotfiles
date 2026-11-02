# Dotfiles Setup Guide (Ubuntu & macOS)

This guide describes how to install all dependencies and use GNU Stow to manage configuration files across Ubuntu and macOS.

Note: .zsdrc expects a $HOME/.workrc for work related config

---

## Ubuntu

### 1. Install GNU Stow
```bash
sudo apt update
sudo apt install -y stow
```

### 2. Install Ghostty

On Ubuntu 26.04 or later:

```bash
sudo apt update
sudo apt install -y ghostty
```

For older Ubuntu releases, use the community packages linked in the
[Ghostty installation guide](https://ghostty.org/docs/install/binary#debian-and-ubuntu).

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

------------

## macOS

### 1. Install GNU Stow

`brew install stow`


### 2. Install Ghostty

`brew install --cask ghostty`

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

## Use Stow to Manage Dotfiles

Clone your dotfiles and stow each package:

```
./setup.sh
```

If Stow reports an existing configuration file, preserve it as a uniquely named
`.backup.*` file and install the repo configuration with:

```bash
./setup.sh --backup
```

To install only the terminal configuration, use `./setup.sh ghostty` (or
`./setup.sh --backup ghostty` if a Ghostty config already exists).

If you previously stowed the WezTerm package, remove its old symlink before
switching (run this before updating your checkout):

```bash
stow -D -t ~/ wezterm
```

Ghostty uses `~/.config/ghostty/config` and starts `nu` from your PATH. Nushell
loads the stowed configuration automatically. The terminal keeps Catppuccin Mocha,
JetBrainsMono Nerd Font at size 13, and 20% extra line height.

Pane shortcuts use Cmd+A on macOS (Super+A on Linux), followed by:

| Key | Action |
| --- | --- |
| Arrow keys or h/j/k/l | Focus a pane |
| Shift+h/j/k/l | Resize a pane by 30 pixels |
| Backslash | Split right |
| Minus | Split down |
| c | New tab |
| q | Close pane (confirm when a process is running) |

Unlike WezTerm's leader, [Ghostty trigger sequences](https://ghostty.org/docs/config/keybind/sequence)
wait indefinitely for the next key. Ctrl+Shift+L toggles the inspector;
Ctrl+Shift+T opens the command palette. To switch to Zsh in a pane, run `exec /bin/zsh`.
