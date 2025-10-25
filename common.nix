{ config, pkgs, inputs, ... }:
let
  unstable = import inputs.nixpkgs-unstable { inherit (pkgs) system; };
in
{
  imports = [
    ./hardware.nix
    #./modules/desktop/gnome.nix
    ./modules/system/bootloader.nix
  ];

  # Kernel Version
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Display Manager
  services.displayManager.ly.enable = true;

  # Networking
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  # OpenGL
  hardware.graphics.enable = true;

  # NVIDIA Drivers
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    modesetting.enable = true;
    open = false;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  # Timezone
  time.timeZone = "Europe/Stockholm";

  # Home-manager
  home-manager.useGlobalPkgs = false;
  home-manager.useUserPackages = true;
  home-manager.users.ollie = {
    imports = [
      ./home/home.nix
      inputs.catppuccin.homeModules.catppuccin
    ];
  };

  # User
  users.users.ollie = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # Audio
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
  };

  # Hyprland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # System
  system.stateVersion = "25.05";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
