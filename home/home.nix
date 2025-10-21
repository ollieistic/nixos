{ config, pkgs, ... }:
{
  imports = [
    ./configs/gnome.nix
  ];

  home.username = "ollie";
  home.homeDirectory = "/home/ollie";
  home.stateVersion = "25.05";
}
