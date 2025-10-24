{ pkgs, ... }:

{
  # Extensions
  home.packages = with pkgs; [
    gnomeExtensions.blur-my-shell
    gnomeExtensions.hide-minimized
    gnome-extension-manager
    gnome-tweaks
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
      name = "Nordic";
      package = pkgs.nordic;
    };

    #cursorTheme = { 
    #  name = "Whitesur";
    #  package = pkgs.whitesur-cursors;
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

  home.sessionVariables.GTK_THEME = "Nordic";
}
