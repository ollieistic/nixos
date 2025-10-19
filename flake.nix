{
  description = "Ollieistic's Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ nixpkgs, home-manager, ... }:
  let
    system = "x86_64-linux";
    stateVersion = "25.05";
  in
  {
    nixosConfigurations.nixos = inputs.nixpkgs.lib.nixosSystem {
	specialArgs = { inherit inputs system; };
	
	pkgs = import inputs.nixpkgs {
	  inherit system;
	  config = { allowUnfree = true; };
	};

	modules = [
	  ./system.nix
	  ./modules/software.nix
	  ./modules/apps/steam.nix
	  inputs.home-manager.nixosModules.home-manager
	];
    };
  };
}
