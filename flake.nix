{
  description = "Ollieistic's Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    silentSDDM.url = "github:uiriansan/SilentSDDM";
    silentSDDM.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ nixpkgs, home-manager, ... }:
  let
    system = "x86_64-linux";
  in
  {
    nixosConfigurations = {
      home = inputs.nixpkgs.lib.nixosSystem {
        inherit system;
      
        modules = [
          ./hosts/home/configuration.nix
	  ./system
          inputs.home-manager.nixosModules.home-manager
        ];
      };
    };
  };
}

