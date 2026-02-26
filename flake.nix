{
  description = "My NixOS configuration :3";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-cisco.url = "github:NixOS/nixpkgs/pull/456650/head";

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
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };
    librepods = {
      url = "github:kavishdevar/librepods/linux/rust";
    };
    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    chainsaw = {
      url = "github:luytan/chainsaw";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-cisco,
      home-manager,
      lanzaboote,
      disko,
      niri,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;

      user = "luytan";

      # other pkgs
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
            inherit user;
            inherit inputs;
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
    in
    {
      nixosConfigurations = {
        glaceon = mkSystem "glaceon";
        sylveon = mkSystem "sylveon";
        leafeon = mkSystem "leafeon";
      };
    };
}
