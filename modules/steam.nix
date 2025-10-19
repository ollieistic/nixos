{ pkgs, inputs, ... }:
let
  unstable = import inputs.nixpkgs-unstable { inherit (pkgs) system; };
in { 
   home-manager.users.ollie = {
     home.packages = with pkgs; [
	steam
	gamemode
     ];
   };
   
   programs.steam.enable = true;
   programs.gamemode.enable = true;
   nixpkgs.config.allowUnfree = true;
}
