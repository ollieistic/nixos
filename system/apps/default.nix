{ pkgs, unstable, inputs, ... }:

{
  imports = [
    ./steam.nix
    ./lutris.nix
    ./heroic.nix
    ./librewolf.nix
    #./sddm.nix
  ];

  services.mullvad-vpn.enable = true;

  # System-wide installed packages
  environment.systemPackages = with pkgs; [
    vim
    alacritty
    git
    playerctl
    bat
    tree
    btop
    lsd
    superfile
    thunar
    unzip
    vlc
    mpv
    ffmpegthumbnailer
    gparted
    killall
  ];
}
