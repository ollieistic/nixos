{ config, lib, pkgs, ... }:

let
  cfg = config.modules.apps.tailscale;
in

{
  options = {
    modules.apps.tailscale.enable = lib.mkEnableOption "Enable Tailscale";
  };

  config = lib.mkIf cfg.enable {
    services.tailscale.enable = true;

    networking.nftables.enable = true;
    networking.firewall = {
      enable = true;
      trustedInterfaces = [ "tailscale0" ]; # Allow traffic from Tailscale network
      allowedUDPPorts = [ config.services.tailscale.port ]; # Open UDP port for Tailscale
    };

    # Force tailscaled to use nftables
    systemd.services.tailscaled.serviceConfig.Environment = [
      "TS_DEBUG_FIREWALL_MODE=nftables"
    ];

    # Optimizations
    systemd.network.wait-online.enable = false;
    boot.initrd.systemd.network.wait-online.enable = false;
  };

}

