{ config, pkgs, ... }:
{
  home.username = "ollie";
  home.homeDirectory = "/home/ollie";
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    hello
  ];
}
