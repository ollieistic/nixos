{ pkgs, ... }:

{
  users.users.ollie = {
    isNormalUser = true;
    hashedPassword = "$y$j9T$5I7dTHoTOlHjVJI9Ww63U.$4dFnUjQkvQvzlOO0aTEKA3fwLEtqhdQKg0ej4No0556";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" "kvm" "qemu-libvirtd" ];
    shell = "${pkgs.zsh}/bin/zsh";
  };

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.backupFileExtension = "hm-bak";
}

