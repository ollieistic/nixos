{ config, lib, ... }:

let
  cfg = config.modules.services.bluetooth;
in

{
  options = {
    modules.services.bluetooth.enable = lib.mkEnableOption "Toggle bluetooth";
  };

  config = lib.mkIf cfg.enable {
    hardware.bluetooth.enable = true;
    services.blueman.enable = true;
  };
}

