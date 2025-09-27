#!/usr/bin/env bash
set -euo pipefail

USERNAME="${1:-hirednoobs}"
REPO_URL="https://github.com/HiredNoobs/bin.git"
HOME_DIR="/home/$USERNAME"
BIN_DIR="$HOME_DIR/bin"

if [[ "$EUID" -ne 0 ]]; then
  echo "ERROR: this script must be run as root." >&2
  exit 1
fi

apt-get update -y
apt-get install -y vim git bash-completion

if id "$USERNAME" &>/dev/null; then
  echo "User '$USERNAME' already exists; skipping creation."
else
  adduser --gecos "" "$USERNAME"
  usermod -aG sudo "$USERNAME"
  echo "Created user '$USERNAME' and added to sudo group."
fi

if [[ -d "$BIN_DIR/.git" ]]; then
  echo "Updating existing repo in $BIN_DIR"
  sudo -u "$USERNAME" git -C "$BIN_DIR" pull --ff-only
else
  echo "Cloning $REPO_URL into $BIN_DIR"
  sudo -u "$USERNAME" git clone "$REPO_URL" "$BIN_DIR"
fi

if [[ -d "$BIN_DIR/dotfiles" ]]; then
  for F in "$BIN_DIR"/dotfiles/*; do
    BASENAME="$(basename "$F")"
    TARGET="$HOME_DIR/.$BASENAME"
    rm -f "$TARGET"
    ln -s "$F" "$TARGET"
    chown -h "$USERNAME:$USERNAME" "$TARGET"
  done
fi
