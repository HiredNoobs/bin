#!/usr/bin/env bash
set -euo pipefail

NO_COLOR="\033[0m"
INFO_COLOR="\033[1;32m"
ERR_COLOR="\033[0;31m"

function log_info() {
  echo -e "${INFO_COLOR}$1${NO_COLOR}"
}

function log_error() {
  echo -e "${ERR_COLOR}$1${NO_COLOR}"
}

USERNAME="${1:-hirednoobs}"
REPO_URL="https://github.com/HiredNoobs/bin.git"
HOME_DIR="/home/$USERNAME"
BIN_DIR="$HOME_DIR/bin"

if [[ "$EUID" -ne 0 ]]; then
  log_error "ERROR: this script must be run as root." >&2
  exit 1
fi

apt-get update -y
apt-get install -y vim git bash-completion

if id "$USERNAME" &>/dev/null; then
  log_info "User '$USERNAME' already exists; skipping creation."
else
  adduser --gecos "" --disabled-password "$USERNAME"
  usermod -aG sudo "$USERNAME"
  echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" > "/etc/sudoers.d/$USERNAME"
  chmod 0440 "/etc/sudoers.d/$USERNAME"

  log_info "Created user '$USERNAME' and added to sudo group."
  log_info "Update the password for '$USERNAME' manually with 'passwd $USERNAME'."
fi

if [[ -d "$BIN_DIR/.git" ]]; then
  log_info "Updating existing repo in $BIN_DIR"
  sudo -u "$USERNAME" git -C "$BIN_DIR" pull --ff-only
else
  log_info "Cloning $REPO_URL into $BIN_DIR"
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
