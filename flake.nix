{
  description = "Ollieistic's Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable }:
  let
    system = "x86_64-linux";
    stateVersion = "25.05";
  in
  {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
	inherit system;
	
	pkgs = import nixpkgs {
	  inherit system;
	  config = { allowUnfree = true; };
	};

	modules = [
	  ./system.nix
	  ./modules/software.nix
	  ./modules/steam.nix
	];
    };
  };
}
