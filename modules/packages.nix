{ pkgs, unstable, inputs, ... }:

{
  users.users.ollie.packages = [
    # Basic
    unstable.librewolf
    unstable.ungoogled-chromium
    pkgs.ghostty
    pkgs.kitty
    pkgs.nautilus
    pkgs.hyprshot
    pkgs.playerctl

    # Gaming
    pkgs.heroic

    # CLI
    pkgs.git
    pkgs.gh
    pkgs.wget
    pkgs.bat
    pkgs.tree
    pkgs.btop
    pkgs.tty-clock
    pkgs.cava
    pkgs.fastfetch

    # Editors
    pkgs.vim
    pkgs.neovim
    pkgs.vscode

    # General
    pkgs.spotify
    pkgs.discord
    pkgs.swww
    pkgs.rofi
    pkgs.waybar
    pkgs.waypaper
    pkgs.simplex-chat-desktop
    pkgs.bitwarden-desktop

    # Other
    pkgs.catppuccin-cursors.latteDark
  ];

  fonts.packages = [
    pkgs.noto-fonts
    pkgs.noto-fonts-emoji
    pkgs.nerd-fonts.fira-code
    pkgs.nerd-fonts.jetbrains-mono
  ];
}
