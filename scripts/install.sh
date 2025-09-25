#!/usr/bin/env bash
# Compatible with bash and zsh
set -eu
set -o pipefail 2>/dev/null || true

# Minimal installer: installs `newtf` into /usr/local/bin (or ~/.local/bin if no sudo)
# Usage:
#   curl -fsSL https://raw.githubusercontent.com/snaetwarre/tf-gpu-devcontainer/main/scripts/install.sh | bash
# or clone and run: bash scripts/install.sh

TARGET_DIR="/usr/local/bin"
if ! command -v sudo >/dev/null 2>&1 || [ ! -w "$(dirname "$TARGET_DIR")" ]; then
  TARGET_DIR="$HOME/.local/bin"
  mkdir -p "$TARGET_DIR"
fi

# Get script directory - works in both bash and zsh
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" && pwd)"

install_file() {
  local src="$1"; shift
  local dst="$1"; shift
  if [ -w "$(dirname "$dst")" ]; then
    cp "$src" "$dst"
    chmod +x "$dst"
  elif command -v sudo >/dev/null 2>&1; then
    sudo cp "$src" "$dst"
    sudo chmod +x "$dst"
  else
    echo "Error: Cannot write to $dst and sudo not available" >&2
    exit 1
  fi
}

install_file "$SCRIPT_DIR/newtf" "$TARGET_DIR/newtf"

echo "✅ Installed newtf to $TARGET_DIR/newtf"
if [[ ":$PATH:" != *":$TARGET_DIR:"* ]]; then
  echo "💡 Add $TARGET_DIR to your PATH:"
  echo "   echo 'export PATH=\"$TARGET_DIR:\$PATH\"' >> ~/.zshrc"
  echo "   source ~/.zshrc"
fi