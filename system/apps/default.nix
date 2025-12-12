{ pkgs, unstable, inputs, ... }:

{
  imports = [
    ./steam.nix
    ./lutris.nix
    ./heroic.nix
    ./sddm.nix
  ];

  # System-wide installed packages
  environment.systemPackages = with pkgs; [
    vim
    kitty
    alacritty
    git
    playerctl
    bat
    tree
    btop
    lsd
    superfile
    xfce.thunar
    hyprshot
    unzip
    cliphist
    wl-clipboard
    vlc
    mpv
    nomacs
    ffmpegthumbnailer
    xfce.tumbler
    dunst
    gparted
  ];
}
