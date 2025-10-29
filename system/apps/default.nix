{ pkgs, unstable, inputs, ... }:

{
  imports = [
    ./steam.nix
    ./sddm.nix
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
