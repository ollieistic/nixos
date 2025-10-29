{ config, lib, ... }:

let
  cfg = config.modules.bootloader.limine;
  wallpaper = ./boot-screen.jpg;
in

{
  options = {
    modules.bootloader.limine = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable Limine as the bootloader.";
      };

      mode = lib.mkOption {
        type = lib.types.enum [ "uefi" "bios" ];
        default = "uefi";
        description = "Choose between UEFI and BIOS modes.";
      };

      device = lib.mkOption {
        type = lib.types.str;
        default = "/dev/sda";
        description = "Target device for BIOS installation.";
      };
    };
  };

  config = lib.mkIf cfg.enable (lib.mkMerge [
    /* Common settings */
    {
      boot.loader.limine.enable = true;

      boot.loader.limine.style.wallpapers = [ wallpaper ];
      boot.loader.limine.style.interface.resolution = "1920x1080";
      boot.loader.limine.style.interface.branding = "NixOS";
    }

    /* BIOS mode */
    (lib.mkIf (cfg.mode == "bios") {
      boot.loader.limine.biosSupport = true;
      boot.loader.limine.biosDevice = [ cfg.device ];
      boot.loader.limine.additionalFiles = [ wallpaper ];
    })

    /* UEFI mode */
    (lib.mkIf (cfg.mode == "uefi") {
      boot.loader.limine.efiSupport = true;
      boot.loader.efi.canTouchEfiVariables = true;
    })
  ]);
}

