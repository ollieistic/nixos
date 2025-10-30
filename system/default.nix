{ ... }: 

{
  imports = [
    ./users.nix
    ./fonts.nix
    ./hardware
    ./apps
    ./boot
    ./services
    ./desktop/hyprland.nix
  ];

  /* Networking (pick one) */
  networking.networkmanager.enable = true;
  # networking.wireless.enable = true;

  /* Set timezone */
  time.timeZone = "Europe/Stockholm";

  /* OpenGL */
  hardware.graphics.enable = true;

  /* Nix settings */
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  /* Proprietary software */
  nixpkgs.config.allowUnfree = true;

  /* State version (do NOT change unless fresh reinstall of NixOS) */
  system.stateVersion = "25.05";
}

