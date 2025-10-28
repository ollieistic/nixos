{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    noto-fonts-emoji
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
  ];
}

