{ pkgs, unstable, inputs, ... }:

{
  environment.systemPackages = [
    # Essential
    pkgs.vim
    pkgs.kitty
    pkgs.alacritty
    pkgs.git
    pkgs.playerctl
  ];
}
