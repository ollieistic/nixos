{ config, pkgs, ... }:

let
  cfg = config.modules.shell.zsh;
in

{
  options.modules.shell = {
    zsh.enable = lib.mkEnableOption "Enable Zsh shell";
  };

  config = lib.mkIf cfg.enable {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;

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
