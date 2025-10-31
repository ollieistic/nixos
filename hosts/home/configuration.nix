{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware.nix
    ../../system
    ../../user
  ];

  /* Settings */
  modules = {
    drivers.nvidia.enable = true;

    shell = {
      zsh.enable = true;
      fish.enable = true;
      # defaultShell = "zsh";
    };

    system = {
      optimize.enable = true; # Optimizes Nix stores
    };

    services = {
      audio.enable = true;
      bluetooth.enable = true;
      ssh.enable = true;
      virtualization.enable = true;
    };

    apps = {
      steam.enable = true;
      heroic.enable = true;
      lutris.enable = true;
    };

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
  networking.hostName = "home";

  /* Kernel */
  boot.kernelPackages = pkgs.linuxPackages_latest; # Kernel version

  boot.kernelParams = [];

  boot.blacklistedKernelModules = [
    "nouveau" # NVIDIA open-source driver

    /* Obscure network protocols */
    "af_802154" # IEEE 802.15.4
    "appletalk" # Appletalk
    "atm"       # ATM
    "ax25"      # Amatuer X.25
    "can"       # Controller Area Network
    "dccp"      # Datagram Congestion Control Protocol
    "decnet"    # DECnet
    "econet"    # Econet
    "ipx"       # Internetwork Packet Exchange
    "n-hdlc"    # High-level Data Link Control
    "netrom"    # NetRom
    "p8022"     # IEEE 802.3
    "p8023"     # Novell raw IEEE 802.3
    "psnap"     # SubnetworkAccess Protocol
    "rds"       # Reliable Datagram Sockets
    "rose"      # ROSE
    "sctp"      # Stream Control Transmission Protocol
    "tipc"      # Transparent Inter-Process Communication
    "x25"       # X.25

    /* Prevent DMA attacks */
    "firewire-core"
  ];

  system.nixos.tags = ["${config.networking.hostName}"];
}

