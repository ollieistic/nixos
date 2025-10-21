{ pkgs, ... }:

{
  # Extensions
  home.packages = with pkgs.gnomeExtensions; [
    blur-my-shell
    hide-minimized
  ];

  # Configuration
  dconf = {
    enable = true;
    settings."org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = [
        "blur-my-shell@aunetx"
	"hide-minimized@danigm.net"
      ];
    };

    settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";
  };
  
  # GTK Theming
  gtk = {
    enable = true;

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    theme = {
      name = "palenight";
      package = pkgs.palenight-theme;
    };

    #cursorTheme = {
    #  name = "";
    #  package = pkgs.catppuccin-cursors.latteDark
    #};

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

  home.sessionVariables.GTK_THEME = "palenight";
}
