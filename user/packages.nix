{ pkgs, ... }:

{
  users.users.ollie.packages = with pkgs; [
    # Basic
    librewolf
    ungoogled-chromium
    brave
    nautilus
    hyprshot

    # Gaming
    heroic

    # CLI
    bat
    tree
    btop
    tty-clock
    cava
    fastfetch
    lsd

    # Editors
    neovim
    vscode

    # General
    spotify
    swww
    rofi
    waypaper
    localsend

    # Communication
    vesktop
    simplex-chat-desktop
    bitwarden-desktop
  ];
}

