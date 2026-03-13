{ pkgs, ... }:

{
  services.desktopManager.plasma6.enable = true;
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    discover
    kcalc
    kcharselect
    kclock
    kcolorchooser
    kolourpaint
    ksystemlog

    isoimagewriter
    partitionmanager
  ];
}
