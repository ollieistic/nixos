{ config, lib, pkgs, ... }:

let
  cfg = config.modules.apps.steam;
in

{
  options = {
    modules.apps.steam.enable = lib.mkEnableOption "Toggle steam and game optimizations";
  };

  config = lib.mkIf cfg.enable {
    # Install essential packages
    environment.systemPackages = with pkgs; [ mangohud protonup ]

    programs.steam.enable = true;
    programs.steam.extraCompatPackages = with unstable; [ proton-ge-bin ] # Fork of Proton (better)

    programs.gamemode.enable = true; # Game optimizations
    hardware.steam-hardware.enable = true; # Add support for Steam hardware and HTC Vive
  };
}

