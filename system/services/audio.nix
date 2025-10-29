{ config, lib, pkgs, ... }:

let
  cfg = config.modules.services.audio;
in 

{
  options = {
    modules.services.audio.enable = lib.mkEnableOption "Toggle audio";
  };

  config = lib.mkIf cfg.enable {
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
  };
}
