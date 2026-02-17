{
  description = "My NixOS configuration :3";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-cisco.url = "github:NixOS/nixpkgs/pull/456650/head";
    nixpkgs-plasma.url = "github:NixOS/nixpkgs/pull/479797/head";

    # Home Manager
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lanzaboote = {
      url = "github:nix-community/lanzaboote/v1.0.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ekphos = {
      url = "github:hanebox/ekphos";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    determinate = {
      url = "github:DeterminateSystems/nix-src";
      #inputs.nixpkgs.follows = "nixpkgs";
    };
    vicinae-extensions = {
      url = "github:vicinaehq/extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    vicinae = {
      url = "github:vicinaehq/vicinae";
    };
    lmstudio = {
      url = "github:tomsch/lmstudio-nix";
    };
    niri = {
      url = "github:sodiboo/niri-flake";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs = {
        # IMPORTANT: To ensure compatibility with the latest Firefox version, use nixpkgs-unstable.
        nixpkgs.follows = "nixpkgs-unstable";
        home-manager.follows = "home-manager";
      };
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-unstable,
      nixpkgs-cisco,
      nixpkgs-plasma,
      home-manager,
      lanzaboote,
      disko,
      determinate,
      niri,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;

      # other pkgs
      pkgs-unstable = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };
      pkgs-cisco = import nixpkgs-cisco {
        inherit system;
        config.allowUnfree = true;
      };

      # Configuration
      mkSystem =
        host:
        lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit inputs pkgs-unstable;
          };
          modules = [
            ./hosts/${host}/configuration.nix
            disko.nixosModules.disko
            lanzaboote.nixosModules.lanzaboote
            home-manager.nixosModules.home-manager
            niri.nixosModules.niri
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = {
                inherit inputs pkgs-unstable pkgs-cisco;
              };
              home-manager.users.luytan = import ./home.nix;
            }

            # Lanzaboote / Secure Boot configuration
            (
              { pkgs, lib, ... }:
              {
                boot.loader.systemd-boot.enable = lib.mkForce false;
                boot.lanzaboote = {
                  enable = true;
                  pkiBundle = "/var/lib/sbctl";
                };
                environment.systemPackages = [ pkgs.sbctl ];
              }
            )
          ];
        };
    in
    {
      nixosConfigurations = {
        glaceon = mkSystem "glaceon";
        sylveon = mkSystem "sylveon";
        leafeon = mkSystem "leafeon";
      };
    };
}
