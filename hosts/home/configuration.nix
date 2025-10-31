{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware.nix
    ../../system
    ../../user
  ];

  modules = {
    /* Proprietary NVIDIA drivers */
    drivers.nvidia.enable = true;

    /* Shell */
    shell.fish.enable = true;
    shell.zsh.enable = true;
    
    /* Services */
    services.audio.enable = true;
    services.bluetooth.enable = true;
    services.ssh.enable = true;
    services.virtualization.enable = true;

    /* Apps */ 
    apps.steam.enable = true;

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
  networking.hostName = "home";

  /* Kernel */ 
  boot.kernelPackages = pkgs.linuxPackages_latest;

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

  /* System */
  system.nixos.tags = ["${config.networking.hostName}"];
}

