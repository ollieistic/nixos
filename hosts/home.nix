{
  config,
  pkgs,
  ...
}: {
  imports = [
    #../user
    ../system/apps/neovim.nix
  ];

  home.username = "ollieistic";
  home.homeDirectory = "/home/ollieistic";
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
  /*
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
      #name = "Gruvbox-Dark";
      #package = pkgs.gruvbox-gtk-theme;
      name = "Adwaita-dark";
      package= pkgs.gnome-themes-extra;
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
  */

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
    tor-browser
    brave
    vscode
    vesktop
    prismlauncher
    fastfetch
    cava
    tty-clock
    swww
    localsend
    spotify
    kdePackages.dolphin
    qbittorrent
    keepassxc
    cryptomator
    mullvad-vpn
    element-desktop
    gajim
  ];

  programs.firefox.policies.ExtensionSettings = {
    "*".installation_mode = "blocked";
    "uBlock0@raymondhill.net" = {
      installation_mode = "force_installed";
      install_url = "file://${
        builtins.fetchurl {
          url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          sha256 = "1kvj2kwwiih7yqiirqha7xfvip4vzrgyqr4rjjhaiyi5ibkcsnvq";
        }
      }";
      private_browsing = true;
      updates_disabled = true;
      default_area = "navbar";
    };
    "addon@darkreader.org" = {
      installation_mode = "force_installed";
      install_url = "file://${
        builtins.fetchurl {
          url = "https://addons.mozilla.org/firefox/downloads/latest/darkreader/latest.xpi";
          sha256 = "0hq2wjqk0azdi7nvs8r6xc0avvdg2qn56r0jv1xja81zqpd6qgls";
        }
      }";
      updates_disabled = true;
      default_area = "navbar";
    };
    "{4520dc08-80f4-4b2e-982a-c17af42e5e4d}" = {
      installation_mode = "force_installed";
      install_url = "file://${
        builtins.fetchurl {
          url = "https://addons.mozilla.org/firefox/downloads/latest/tokyo-night-milav/latest.xpi";
          sha256 = "1b4p10pyq5m90q070d29kgv4yr5bfic5gj3nk2fcis05wv0k276r";
        }
      }";
    };
  };
}
