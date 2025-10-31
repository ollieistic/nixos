{ config, lib, ... }:

let
  cfg = config.modules.system.optimize;
in

{
  options = {
    modules.system.optimize.enable = lib.mkEnableOption "Toggle system optimizations";
  };

  config = lib.mkIf cfg.enable {
    nix.settings.auto-optimise-store = true;
    nix.optimise.automatic = true;
    nix.optimise.dates = [ "weekly" ];
    nix.gc.automatic = true;
    nix.gc.dates = "weekly";
    nix.gc.options = "--delete-older-than 30d";
  };
}

