{
  description = "Ollieistic's Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";

    alejandra.url = "github:kamadorueda/alejandra/4.0.0";
    alejandra.inputs.nixpkgs.follows = "nixpkgs";

    silentSDDM = {
      url = "github:uiriansan/SilentSDDM";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nix-flatpak,
    alejandra,
    ...
  }: {
    # formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-tree;
    nixosConfigurations.home = nixpkgs.lib.nixosSystem rec {
      system = "x86_64-linux";

      modules = [
        {
          environment.systemPackages = [alejandra.defaultPackage.${system}];
        }
        home-manager.nixosModules.home-manager
        nix-flatpak.nixosModules.nix-flatpak
        ./hosts/home/configuration.nix
        ./system
      ];
    };
  };
}
