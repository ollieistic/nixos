{ pkgs, unstable, inputs, ... }:

{
  imports = [
    ./steam.nix
    # ./sddm.nix
  ];

  # System-wide installed packages
  environment.systemPackages = with pkgs; [
    vim
    neovim
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
  ];
}
