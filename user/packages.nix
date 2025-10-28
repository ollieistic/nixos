{ pkgs, unstable, ... }:

{
  users.users.ollie.packages = [
    # Basic
    unstable.librewolf
    unstable.ungoogled-chromium
    pkgs.nautilus
    pkgs.hyprshot

    # Gaming
    pkgs.heroic

    # CLI
    pkgs.bat
    pkgs.tree
    pkgs.btop
    pkgs.tty-clock
    pkgs.cava
    pkgs.fastfetch
    pkgs.lsd

    # Editors
    pkgs.neovim
    pkgs.vscode

    # General
    pkgs.spotify
    pkgs.swww
    pkgs.rofi
    pkgs.waypaper

    # Communication
    pkgs.discord
    pkgs.simplex-chat-desktop
    pkgs.bitwarden-desktop
  ];
}

