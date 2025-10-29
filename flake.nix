{
  description = "Ollieistic's Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    silentSDDM.url = "github:uiriansan/SilentSDDM";
    silentSDDM.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ nixpkgs, unstable, home-manager, ... }:
  let
    system = "x86_64-linux";

    unstable-pkgs = import unstable {
      inherit system;
      config.allowUnfree = true;
    };
  in
  {
    nixosConfigurations = {
      home = inputs.nixpkgs.lib.nixosSystem {
        inherit system;

        specialArgs = { unstable = unstable-pkgs; inherit inputs; };
      
        pkgs = import inputs.nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };

        modules = [
          ./hosts/home/configuration.nix
          inputs.home-manager.nixosModules.home-manager
        ];
      };
    };
  };
}

