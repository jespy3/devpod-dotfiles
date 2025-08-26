# Set config home
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

# Source all partial configs
source "$XDG_CONFIG_HOME/zsh/aliases.zsh"
source "$XDG_CONFIG_HOME/zsh/plugins.zsh"
# Shell options, history, keybinds, styles
source "$XDG_CONFIG_HOME/zsh/config.zsh"

# -------

# FINAL FEEDBACK
echo "Welcome."

