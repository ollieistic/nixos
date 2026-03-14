{
  config,
  lib,
  ...
}: let
  cfg = config.modules.services.bluetooth;
in {
  options = {
    modules.services.bluetooth.enable = lib.mkEnableOption "Toggle bluetooth";
    modules.services.bluetooth.blueman.enable = lib.mkEnableOption "Enable blueman (for WMs)";
  };

  config = lib.mkIf cfg.enable (
    lib.mkMerge [
      {
      	hardware.bluetooth.enable = true;
      }

      (lib.mkIf (cfg.blueman.enable == true) {
      	services.blueman.enable = true;
      })
    ]
  );
}
