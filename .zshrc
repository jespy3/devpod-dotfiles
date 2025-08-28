# Set config home
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

# Bootstrap nix packages
ln -sf "$HOME/dotfiles/.config/nix-flake" "$HOME/nix-flake"
mkdir -p "$XDG_CONFIG_HOME/nix"
echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf

if ! command -v nix >/dev/null; then
    echo "[ERROR] ❌ nix is not installed in PATH"
    return 1
fi

if nix profile list | grep -q 'myPackages'; then
    echo "✅ Nix \"myPackages\" already installed – no update needed."
else
    echo "⬇️ Installing myPackages from flake..."
    nix profile add "$HOME/nix-flake#myPackages"
fi

# Bootstrap zsh configs
#ln -sf "$HOME/.config/zsh" "$XDG_CONFIN"
ln -sf "$HOME/dotfiles/.config/zsh" "$XDG_CONFIG_HOME/zsh"
source "$XDG_CONFIG_HOME/zsh/aliases.zsh"
source "$XDG_CONFIG_HOME/zsh/plugins.zsh"
source "$XDG_CONFIG_HOME/zsh/config.zsh"

# Bootstrap others
ln -sf "$HOME/dotfiles/.config/git" "$XDG_CONFIG_HOME/git"
ln -sf "$HOME/dotfiles/.config/tmux" "$XDG_CONFIG_HOME/tmux"
ln -sf "$HOME/dotfiles/.config/nvim" "$XDG_CONFIG_HOME/nvim"

# -------

# FINAL FEEDBACK
echo "Welcome."
