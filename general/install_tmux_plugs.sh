# Source tmux.conf
tmux source "${XDG_CONFIG_HOME:-$HOME/.config}"/tmux/tmux.conf
# Install tmux plugins
tmux run "${XDG_CONFIG_HOME:-$HOME/.config}"/tmux/plugins/tpm/bin/install_plugins
