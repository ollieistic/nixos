{ ... }:

{
  # Bootloader
  boot.loader.systemd-boot.enable = false;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.loader.limine.enable = true;
  boot.loader.limine.efiSupport = true;
  boot.loader.limine.style.wallpapers = [ ./../../boot-wp.jpg ];
  boot.loader.limine.style.interface.resolution = "1920x1080";
  boot.loader.limine.style.interface.branding = "Ollieistic";
}
