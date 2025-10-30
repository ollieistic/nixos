{ config, pkgs, ... }:

{
  imports = [
    #../user
  ];

  home.username = "ollie";
  home.homeDirectory = "/home/ollie";
  home.stateVersion = "25.05";

  home.pointerCursor = {
    x11.enable = true;
    gtk.enable = true;
    package = pkgs.capitaine-cursors;
    size = 24;
    name = "Capitaine-Cursors";
  };

  gtk = {
    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus-Dark";
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
    heroic
    hyprshot
    vesktop
    bitwarden-desktop
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

