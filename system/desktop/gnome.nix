{ pkgs, ... }:

{
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  environment.gnome.excludePackages = with pkgs; [
    cheese
    eog
    epiphany
    geary
    gedit
    gnome-characters
    gnome-clocks
    gnome-calendar
    gnome-console
    gnome-font-viewer
    gnome-logs
    gnome-maps
    gnome-music
    gnome-weather
    gnome-tour
    gnome-calculator
    gnome-connections
    gnome-contacts
    simple-scan
    totem
    yelp
    seahorse
    snapshot
    xterm
  ];
}

