{ config, lib, pkgs, ... }:

let
  cfg = config.modules.apps.steam;
in

{
  options = {
    modules.apps.steam.enable = lib.mkEnableOption "Toggle Steam and game optimizations";
  };

  config = lib.mkIf cfg.enable {
    # Install essential packages
    environment.systemPackages = with pkgs; [ mangohud protonup-ng ];

    programs.steam.enable = true;
    programs.steam.extraCompatPackages = with pkgs; [ proton-ge-bin ]; # Fork of Proton (better)

    programs.gamemode.enable = true; # Game optimizations
    hardware.steam-hardware.enable = true; # Add support for Steam hardware and HTC Vive
  };
}

