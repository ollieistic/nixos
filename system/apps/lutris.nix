{ config, lib, pkgs, ... }:

let
  cfg = config.modules.apps.lutris;
in

{
  options = {
    modules.apps.lutris.enable = lib.mkEnableOption "Toggle Lutris and game optimizations";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      lutris
      protonup-ng
    ];

    programs.gamemode.enable = true;
    hardware.steam-hardware.enable = true;
  };
}

