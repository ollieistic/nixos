{ pkgs, unstable, inputs, ... }:

{
  users.users.ollie.packages = [
    # Basic
    unstable.librewolf
    unstable.ungoogled-chromium
    pkgs.ghostty
    pkgs.nautilus
    
    # Gaming
    pkgs.heroic

    # CLI
    pkgs.git
    pkgs.gh
    pkgs.wget
    pkgs.bat
    pkgs.tree
    pkgs.btop
    pkgs.fastfetch

    # Editors
    pkgs.vim
    pkgs.neovim
    pkgs.vscode

    # General
    pkgs.spotify
    pkgs.discord
    pkgs.cava
    pkgs.swww
    pkgs.waypaper
    pkgs.simplex-chat-desktop
    pkgs.bitwarden-desktop

    # Other
    pkgs.catppuccin-cursors.latteDark
  ];
}
