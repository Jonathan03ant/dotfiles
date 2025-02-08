#!/bin/bash

echo "🔧 Setting up Neovim configuration..."
sleep 1

# Get the absolute path of the dotfiles directory
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
NEOVIM_CONFIG="$DOTFILES_DIR/neovim"

echo "📂 Using dotfiles directory: $DOTFILES_DIR"
sleep 1

# Remove existing ~/.config/nvim if it exists
if [ -e ~/.config/nvim ]; then
    echo "🗑 Removing existing ~/.config/nvim..."
    rm -rf ~/.config/nvim
fi

# Ensure ~/.config exists before linking
mkdir -p ~/.config

# Create the symlink
echo "🔗 Creating symlink: ~/.config/nvim -> $NEOVIM_CONFIG"
ln -s "$NEOVIM_CONFIG" ~/.config/nvim

sleep 1
echo "✅ Neovim setup complete! Your config is now linked."
