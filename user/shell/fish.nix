{ config, lib, pkgs, ... }:

let
  cfg = config.modules.shell.fish;
in

{
  options.modules.shell = {
    fish.enable = lib.mkEnableOption "Enable Fish shell";
    fish.defaultInteractiveShell = lib.mkEnableOption "Set Fish to default interactive shell";
  };

  config = lib.mkIf cfg.enable {
    programs.fish = {
      enable = true;

      shellAliases = {
        ls = "lsd";
	ll = "lsd -lh";
	fetch = "fastfetch";
	nixbuild = "sudo nixos-rebuild switch";
	nixtest = "sudo nixos-rebuild dry-run";
      };
    };
  };
}

