{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    noto-fonts-color-emoji
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
    nerd-fonts.ubuntu
  ];
}

