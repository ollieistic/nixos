{ config, pkgs, ... }:

{
  imports = [
    #../user
    ../system/apps/neovim.nix
  ];

  home.username = "ollie";
  home.homeDirectory = "/home/ollie";
  home.stateVersion = "25.11";

  modules.apps = {
    neovim.enable = true;
  };

  home.pointerCursor = {
    enable = true;
    x11.enable = true;
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 18;
  };

  gtk = {
    enable = true;

    iconTheme = {
      name = "Gruvbox-Dark-Icons";
      package = pkgs.gruvbox-dark-icons-gtk;
    };

    cursorTheme = {
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
    };

    theme = {
      name = "Gruvbox-Dark";
      package = pkgs.gruvbox-gtk-theme;
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
    tor-browser
    brave
    vscode
    hyprshot
    vesktop
    bitwarden-desktop
    telegram-desktop
    simplex-chat-desktop
    prismlauncher
    opencode
    fastfetch
    cava
    tty-clock
    waypaper
    swww
    rofi
    localsend
    pavucontrol
    waybar
    spotify
    winboat
    logseq
    kdePackages.dolphin
    lxappearance
    qbittorrent
    jellyflix
    mullvad-vpn
  ];
}

