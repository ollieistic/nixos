{ config, lib, ... }:

let
  cfg = config.modules.bootloader.systemd-boot;
in

{
  options.modules.bootloader.systemd-boot = {
    enable = lib.mkEnableOption "Toggle systemd-boot bootloader";

    efiMountPoint = lib.mkOption {
      type = lib.types.path;
      default = "/boot";
      description = "EFI system partition mount point";
    };
  };

  config = lib.mkIf cfg.enable {
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    boot.loader.efi.efiSysMountPoint = cfg.efiMountPoint;
  };
}

