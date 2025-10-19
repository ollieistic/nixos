{ inputs, pkgs, ... }: {
  home-manager.users.ollie = { ... }:
  let
    unstable = import inputs.nixpkgs-unstable { inherit (pkgs) system; config.allowUnfree = true; };
  in {
    imports = [
      ./../home/home.nix
    ];

    nixpkgs.config.allowUnfree = true;
    home.packages = with pkgs; [
      vim
      neovim
      git
      kitty
      ghostty
      hyprshot
      nautilus
      rofi
      wget
      swww
      waypaper
      pywal16
      imagemagick
      librewolf
      discord
      spotify
      cava
      btop
      fastfetch
      flatpak
      catppuccin-cursors.latteDark
      bat
      waybar
    ];

    #fonts.packages = with pkgs; [
    #  noto-fonts
    #  noto-fonts-emoji
    #  nerd-fonts.fira-code
    #  nerd-fonts.jetbrains-mono
    #];
  };
}

