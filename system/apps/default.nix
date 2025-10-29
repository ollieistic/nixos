{ pkgs, unstable, inputs, ... }:

{
  imports = [
    ./configs/steam.nix
  ];

  # System-wide installed packages
  environment.systemPackages = [
    pkgs.vim
    pkgs.kitty
    pkgs.alacritty
    pkgs.git
    pkgs.playerctl
  ];
}
