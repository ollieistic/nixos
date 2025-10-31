{ config, pkgs, ... }:

/* This file is shared across all hosts that use home-manager. */

{
  imports = [
    #../user
    ../system/apps/neovim.nix
  ];

  home.username = "ollie";
  home.homeDirectory = "/home/ollie";
  home.stateVersion = "25.05";

  modules.apps = {
    neovim.enable = true;
  };

  home.pointerCursor = {
    x11.enable = true;
    gtk.enable = true;
    package = pkgs.capitaine-cursors;
    size = 24;
    name = "Capitaine-Cursors";
  };

  gtk = {
    enable = true;

    iconTheme = {
      package = pkgs.gruvbox-dark-icons-gtk;
      name = "Gruvbox-Dark-Icons";
    };

    theme = {
      package = pkgs.gruvbox-gtk-theme;
      name = "Gruvbox-Dark";
    };

    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
    
    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
  };

  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
      music = "${config.home.homeDirectory}/Media/Music";
      videos = "${config.home.homeDirectory}/Media/Videos";
      publicShare = null;
      templates = null;
    };
  };

  home.packages = with pkgs; [
    librewolf
    ungoogled-chromium
    brave
    vscode
    hyprshot
    vesktop
    bitwarden-desktop
    prismlauncher
    opencode
    fastfetch
    cava
    tty-clock
    waypaper
    swww
    spotify
    rofi
    localsend
  ];
}

