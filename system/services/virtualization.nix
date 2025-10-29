{ config, lib, pkgs, ... }:

let
  cfg = config.modules.services.virtualization;
in

{
  options = {
    modules.services.virtualization.enable = lib.mkEnableOption "Toggle virtualization and VM software";
  };

  config = lib.mkIf cfg.enable {
    virtualisation.libvirtd.enable = true;
    programs.virt-manager.enable = true;
  };
}

