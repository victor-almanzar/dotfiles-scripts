#!/bin/bash

set -e

# Determine ZSH path
if [[ "$OSTYPE" == "darwin"* ]]; then
    ZSH_PATH="/opt/homebrew/bin/zsh"
else
    ZSH_PATH=$(command -v zsh)
fi

# Ensure ZSH exists
if [ ! -f "$ZSH_PATH" ]; then
    echo "ZSH not found at $ZSH_PATH. Ensure it's installed."
    exit 1
fi

# Add ZSH to /etc/shells if not present (mainly for macOS)
grep -qxF "$ZSH_PATH" /etc/shells || echo "$ZSH_PATH" | sudo tee -a /etc/shells

# Set ZSH as default shell
if [ "$SHELL" != "$ZSH_PATH" ]; then
    echo "Setting $ZSH_PATH as the default shell..."
    chsh -s "$ZSH_PATH"
    echo "ZSH set as default. Log out and back in for changes to take effect."
else
    echo "ZSH is already the default shell."
fi

echo "Verify with: echo \$SHELL and which zsh"
