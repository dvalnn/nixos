{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    git
    gum
    (writeShellScriptBin "nix_installer" ''
      #!/usr/bin/env bash
      set -euo pipefail
      gsettings set org.gnome.desktop.session idle-delay 0
      gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'nothing'

      if [ "$(id -u)" -eq 0 ]; then
      	echo "ERROR! $(basename "$0") should be run as a regular user"
      	exit 1
      fi

      if [ ! -d "$HOME/nixos/.git" ]; then
      	git clone https://github.com/dvalnn/nixos.git "$HOME/nixos"
      fi

      TARGET_HOST=$(ls -1 ~/nixos/hosts | cut -d'/' -f6 | grep -v -e iso -e common.nix | gum choose)

      if [ ! -e "$HOME/nixos/hosts/$TARGET_HOST/default.nix" ]; then
      	echo "ERROR! $(basename "$0") could not find the required $HOME/nixos/hosts/$TARGET_HOST/defualt.nix"
      	exit 1
      fi

      gum confirm  --default=false \
      "🔥 🔥 🔥 WARNING!!!! This will ERASE ALL DATA on the disk $TARGET_HOST. Are you sure you want to continue?"

      echo "Partitioning Disks"
      sudo nix run github:nix-community/disko \
      --extra-experimental-features "nix-command flakes" \
      --no-write-lock-file \
      -- \
      --mode zap_create_mount \
      "$HOME/nixos/hosts/$TARGET_HOST/default.nix"

      sudo nixos-install --flake "$HOME/dotfiles#$TARGET_HOST"
    '')
  ];
}
