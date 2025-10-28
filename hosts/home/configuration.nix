{ config, lib, ... }:

{
  imports = [
    ./hardware.nix
    ./../../system
  ];

  modules = {
    /* Proprietary NVIDIA drivers */
    drivers.nvidia.enable = true;

    /* Bootloader */
    bootloader = {
      /* Limine */
      limine.enable = true;
      limine.mode = "uefi"; # "uefi" or "bios"
      limine.device = "nodev"; # Change this if you are on BIOS mode

      /* Systemd-boot */
      # systemd-boot.enable = true;

      /* GRUB */
      # grub.enable = true;
      # grub.mode = "uefi"; # "uefi" or "bios"
      # grub.device = "nodev"; # Change this if you are on BIOS Mode
    };

    /* Services */
    services.audio.enable = true;
  };

  /* Hostname */
  networking.hostName = "nix-home";

  /* Kernel parameters */
  boot.kernelParams = [];

  /* System */
  system.nixos.tags = ["${config.networking.hostName}"];
}

