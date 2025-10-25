{
  description = "Ollieistic's Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    catppuccin.url = "github:catppuccin/nix/release-25.05";
    catppuccin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ nixpkgs, unstable, home-manager, catppuccin, ... }:
  let
    system = "x86_64-linux";
    stateVersion = "25.05";

    unstable-pkgs = import unstable {
      inherit system;
      config.allowUnfree = true;
    };
  in
  {
    nixosConfigurations.nixos = inputs.nixpkgs.lib.nixosSystem {
        inherit system;
	specialArgs = { unstable = unstable-pkgs; inherit inputs; };
	
	pkgs = import inputs.nixpkgs {
	  inherit system;
	  config.allowUnfree = true;
	};

	modules = [
	  ./common.nix
	  ./modules/packages.nix
	  ./modules/apps/steam.nix
	  inputs.home-manager.nixosModules.home-manager
	  inputs.catppuccin.nixosModules.catppuccin
	];
    };
  };
}
