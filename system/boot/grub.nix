{ config, lib, ... }:

/* This module configures GRUB. */

let
  cfg = config.modules.bootloader.grub;
in
{
  options.modules.bootloader.grub = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable GRUB as the bootloader.";
    };

    mode = lib.mkOption {
      type = lib.types.enum [ "uefi" "bios" ];
      default = "uefi";
      description = "Choose between UEFI and BIOS installation modes.";
    };

    device = lib.mkOption {
      type = lib.types.str;
      default = "/dev/sda";
      description = "Target device for BIOS installation.";
    };

    efiSysMountPoint = lib.mkOption {
      type = lib.types.path;
      default = "/boot";
      description = "EFI system partition mount point for UEFI mode.";
    };

    useOSProber = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Whether to enable os-prober for detecting other OS installations.";
    };
  };

  config = lib.mkIf cfg.enable (lib.mkMerge [
    /* Common GRUB configuration */
    {
      boot.loader.grub.enable = true;
      boot.loader.grub.useOSProber = cfg.useOSProber;
    }

    /* BIOS mode */
    (lib.mkIf (cfg.mode == "bios") {
      boot.loader.grub.devices = [ cfg.device ];
      boot.loader.grub.efiSupport = false;
      boot.loader.grub.enableCryptodisk = true;
    })

    /* UEFI mode */
    (lib.mkIf (cfg.mode == "uefi") {
      boot.loader.grub.efiSupport = true;
      boot.loader.grub.efiInstallAsRemovable = false;
      boot.loader.grub.device = "nodev";
      boot.loader.efi.canTouchEfiVariables = true;
      boot.loader.efi.efiSysMountPoint = cfg.efiSysMountPoint;
    })
  ]);
}

