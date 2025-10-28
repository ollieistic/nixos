{ config, lib, ... }:

/* This module configures systemd-boot. */

let
  cfg = config.modules.boot.systemd-boot;
in
{
  options.modules.boot.systemd-boot = {
    enable = lib.mkEnableOption "Enable systemd-boot as bootloader.";

    efiMountPoint = lib.mkOption {
      type = lib.types.path;
      default = "/boot";
      description = "EFI system partition mount point.";
    };
  };

  config = lib.mkIf cfg.enable {
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    boot.loader.efi.efiSysMountPoint = cfg.efiMountPoint;
  };
}

