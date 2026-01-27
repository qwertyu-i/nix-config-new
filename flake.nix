{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    lanzaboote = {
      url = "github:nix-community/lanzaboote/v1.0.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, lanzaboote, ... }: {

    nixosConfigurations = {
      lockbox = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          lanzaboote.nixosModules.lanzaboote

          ({ pkgs, lib, ... }: {
            boot.loader.systemd-boot.enable = lib.mkForce false;

              boot.lanzaboote = {
                enable = true;
              pkiBundle = "/var/lib/sbctl";
            };
          })
          ./hosts/lockbox/default.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.qwertyu = import ./home/users/qwertyu.nix;
          }
        ];
      };
      basedbox = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/basedbox/default.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.qwertyu = import ./home/users/qwertyu.nix;
          }
        ];
      };
      # the shitty laptop
      rustbox = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/rustbox/default.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.qwertyu = import ./home/users/qwertyu.nix;
          }
        ];
      };
    };

  };
}
