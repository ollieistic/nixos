{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    vim
    neovim
    git
    kitty
    ghostty
    hyprshot
    nautilus
    rofi
    wget
    swww
    waypaper
    pywal16
    imagemagick
    librewolf
    tor-browser
    discord
    spotify
    cava
    btop
    fastfetch
    flatpak
    catppuccin-cursors.latteDark
    bat
    waybar
  ];

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-emoji
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
  ];
}
