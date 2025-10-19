{ config, pkgs, ... }:
let
  version = "25.05"
in
{
  programs.home-manager.enable = true;
  
  home.username = "ollie";
  home.homeDirectory = "/home/ollie";
  home.stateVersion = version;

  home.packages = with pkgs; [
    hello
  ];
}
