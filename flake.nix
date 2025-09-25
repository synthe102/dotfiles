{
  description = "Synthe102's flaky flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL/main";
    };
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin.url = "github:catppuccin/nix";
  };

  outputs = {
    self,
    nixpkgs,
    nix-darwin,
    nixos-wsl,
    home-manager,
    nixvim,
    catppuccin,
    ...
  } @ inputs: let
    user = {
      name = "synthe102";
    };
  in {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#simple
    darwinConfigurations."MBA-Leonard" = nix-darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      specialArgs = {inherit inputs user;};
      modules = [
        ./hosts/work-laptop/configuration.nix
        home-manager.darwinModules.home-manager
      ];
    };
    nixosConfigurations = {
      krangle = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs user;};
        modules = [
          ./hosts/krangle/configuration.nix
          home-manager.nixosModules.home-manager
        ];
      };
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs user;};
        modules = [
          ./hosts/wsl/configuration.nix
          home-manager.nixosModules.home-manager
          nixos-wsl.nixosModules.default
        ];
      };
    };
  };
}
