{
  description = "My NixOS configuration :3";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-cisco.url = "github:NixOS/nixpkgs/pull/456650/head";
    nixpkgs-vmware.url = "github:NixOS/nixpkgs/pull/495055/head";
    # Home Manager
    home-manager = {
      url = "github:nix-community/home-manager/master";
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
      inputs.nixpkgs.follows = "nixpkgs";
    };
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    vicinae-extensions = {
      url = "github:vicinaehq/extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    vicinae = {
      url = "github:vicinaehq/vicinae";
    };
    lmstudio = {
      url = "github:luytan/lmstudio-nix";
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
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };
    silentSDDM = {
      url = "github:uiriansan/SilentSDDM";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    cardwire = {
      url = "github:luytan/cardwire";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      flake-parts,
      nixpkgs,
      nixpkgs-cisco,
      nixpkgs-vmware,
      home-manager,
      lanzaboote,
      disko,
      niri,
      ...
    }:
    let
      supportedSystem = "x86_64-linux";
      lib = nixpkgs.lib;
      user = "luytan";

      pkgs-cisco = import nixpkgs-cisco {
        system = supportedSystem;
        config.allowUnfree = true;
      };
      pkgs-vmware = import nixpkgs-vmware {
        system = supportedSystem;
        config.allowUnfree = true;
      };

      mkSystem =
        host:
        lib.nixosSystem {
          system = supportedSystem;
          specialArgs = {
            inherit user inputs pkgs-vmware;
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
                inherit inputs pkgs-cisco user;
              };
              home-manager.users.${user} = import ./home.nix;
            }
          ];
        };

      nixosConfigurations = {
        glaceon = mkSystem "glaceon";
        sylveon = mkSystem "sylveon";
        leafeon = mkSystem "leafeon";
      };
    in
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ supportedSystem ];

      perSystem =
        { pkgs, ... }:
        {
          formatter = pkgs.nixfmt;
          checks = lib.mapAttrs (
            host: configuration:
            let
              _ = configuration.config.system.build.toplevel.drvPath;
            in
            pkgs.runCommand "${host}-eval" { } "echo ok > $out"
          ) nixosConfigurations;
        };

      flake = {
        inherit nixosConfigurations;
      };
    };
}
