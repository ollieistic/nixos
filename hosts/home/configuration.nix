{ config, lib, pkgs, ... }:

/*
  TODO:
  - Add option to set default shell via a string
*/

{
  imports = [
    ./hardware.nix
    ./../../system
    ./../../user
  ];

  modules = {
    /* Proprietary NVIDIA drivers */
    drivers.nvidia.enable = true;

    /* Shell */
    shell.fish.enable = true;
    shell.zsh.enable = true;
    
    /* Services */
    services.audio.enable = true;

    /* Bootloader */
    bootloader = {
      /* Limine */
      limine.enable = true;
      limine.mode = "uefi"; # "uefi" or "bios"
      limine.device = "nodev"; # Change this if you are on BIOS mode

      /* Systemd-boot (UEFI only) */
      # systemd-boot.enable = true;
      # systemd-boot.efiMountPoint = "/boot";

      /* GRUB */
      # grub.enable = true;
      # grub.mode = "uefi"; # "uefi" or "bios"
      # grub.device = "nodev"; # Change this if you are on BIOS Mode
    };
  };

  /* Hostname */
  networking.hostName = "nix-home";

  /* Kernel */
  boot.kernelPackages = pkgs.linuxPackages_latest; #6_17

  /* Kernel parameters */
  boot.kernelParams = [

  ];

  /* System */
  system.nixos.tags = ["${config.networking.hostName}"];
}

