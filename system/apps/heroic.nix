{ config, lib, pkgs, ... }:

let
  cfg = config.modules.apps.heroic;
in

{
  options = {
    modules.apps.heroic.enable = lib.mkEnableOption "Toggle Heroic and game optimizations";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ 
      heroic 
      protonup-ng
    ];

    programs.gamemode.enable = true;
  };
}

