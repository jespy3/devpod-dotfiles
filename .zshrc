# Set config home
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

# Bootstrap zsh configs
source "$XDG_CONFIG_HOME/zsh/aliases.zsh"
source "$XDG_CONFIG_HOME/zsh/plugins.zsh"
source "$XDG_CONFIG_HOME/zsh/config.zsh"

# Bootstrap nix packages
flake_path="${XDG_CONFIG_HOME:-$HOME/.config}/nix/flake.nix"    

if ! command -v nix >/dev/null; then
    echo "[ERROR] ❌ nix is not installed in PATH"
    return 1
fi

if [[ ! -f "$flake_path" ]]; then
    echo "[ERROR] ❌ flake.nix is not found at $flake_path"
    return 1
fi

nix profile install "$flake_path#myPackages"

# -------

# FINAL FEEDBACK
echo "Welcome."

