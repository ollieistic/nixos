{ config, lib, ... }:

let
  cfg = config.modules.services.ssh;
in

{
  options = {
    modules.services.ssh.enable = lib.mkEnableOption "Toggle SSH";
  };

  config = lib.mkIf cfg.enable {
    services.openssh.enable = true;
  };
}

