# Set config home
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

# Bootstrap nix packages
ln -sf "$HOME/dotfiles/.config/nix" "$HOME/nix-flake"

if ! command -v nix >/dev/null; then
    echo "[ERROR] ❌ nix is not installed in PATH"
    return 1
fi

if ! nix profile list | grep -q 'myPackages'; then
    nix --extra-experimental-features "nix-command flakes" profile add "$HOME/nix-flake#myPackages"
fi

# Bootstrap zsh configs
#ln -sf "$HOME/.config/zsh" "$XDG_CONFIN"
source "$XDG_CONFIG_HOME/zsh/aliases.zsh"
source "$XDG_CONFIG_HOME/zsh/plugins.zsh"
source "$XDG_CONFIG_HOME/zsh/config.zsh"


# -------

# FINAL FEEDBACK
echo "Welcome."
