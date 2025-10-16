{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    vim
    neovim
    git
    kitty
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
    pavucontrol
    cava
    btop
    fastfetch
    flatpak
    catppuccin-cursors.latteDark
    bat
  ];
}
