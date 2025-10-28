{ config, lib, pkgs, ... }:

/* This module installs and enables proprietary NVIDIA drivers. */

let
  cfg = config.modules.drivers.nvidia;
in

{
  options = {
    modules.drivers.nvidia.enable = lib.mkEnableOption "Enable NVIDIA proprietary drivers";
  };

  config = lib.mkIf cfg.enable {
    services.xserver.videoDrivers = [ "nvidia" ];

    hardware.nvidia = {
      modesetting.enable = true;
      open = false; # Disable open-source 'Nouveau' drivers
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
  };
}

