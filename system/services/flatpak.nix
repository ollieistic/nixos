{ config, lib, ... }:

let
  cfg = config.modules.services.flatpak;
in

{
  options = {
    modules.services.flatpak.enable = lib.mkEnableOption "Enable flatpak";
  };

  config = lib.mkIf cfg.enable {
    services.flatpak = {
      enable = true;
    };
  };
}

