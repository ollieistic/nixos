{ config, pkgs, ... }:

let
  cfg = config.modules.shell.zsh;
in

{
  options.modules = {
    zsh.enable = lib.mkEnableOption "Enable Zsh shell";
    zsh.defaultInteractiveShell = lib.mkEnableOption "Set Zsh to default interactive shell";
  };

  config = lib.mkIf cfg.enable {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
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
