{
  description = "NixOS & Nix-Darwin configuration of Haoxiang Pei";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "nixpkgs/nixos-25.11";
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin.url = "github:catppuccin/nix";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nix-darwin,
    home-manager,
    ...
  } @ inputs: let
    # Helper function to generate system configuration.
    mkSystem = hostName: hostConfig: let
      system = hostConfig.system or "x86_64-linux";

      specialArgs = {
        inherit inputs hostConfig;
        # Input settings.
        pkgs-stable = import inputs.nixpkgs-stable {
          inherit system;
          config.allowUnfree = true;
        };
      };

      # Module configuration for current host.
      commonModules =
        [
          {nixpkgs.config.allowUnfree = true;}
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = inputs // specialArgs;
              users =
                builtins.mapAttrs (username: configPath: import configPath)
                (hostConfig.homeManagerConfigs or {});
              backupFileExtension = "backup";
            };
          }
        ]
        ++ (hostConfig.configs or []);

      # Specific configuration for current system type.
      systemConfig =
        {
          "x86_64-linux" = {
            builder = nixpkgs.lib.nixosSystem;
            homeManagerModule = home-manager.nixosModules.home-manager;
          };
          "aarch64-darwin" = {
            builder = nix-darwin.lib.darwinSystem;
            homeManagerModule = home-manager.darwinModules.home-manager;
          };
        }.${
          system
        };
    in
      systemConfig.builder {
        inherit specialArgs;
        modules = [systemConfig.homeManagerModule] ++ commonModules;
      };

    # Automatically discover all host configurations.
    hostDirs = builtins.attrNames (builtins.readDir ./hosts);
    hostConfigs = builtins.listToAttrs (
      map (hostDir: let
        hostConfig = import ./hosts/${hostDir}/host.nix;
        hostName = hostConfig.hostName or hostDir;
      in {
        name = hostName;
        value = hostConfig;
      })
      hostDirs
    );

    # Build all host configurations.
    allSystems = nixpkgs.lib.mapAttrs mkSystem hostConfigs;

    # Group host configurations by system type.
    groupBySystem = systemType:
      nixpkgs.lib.filterAttrs (
        name: _:
          (hostConfigs.${name}.system or "x86_64-linux") == systemType
      )
      allSystems;
  in {
    nixosConfigurations = groupBySystem "x86_64-linux";
    darwinConfigurations = groupBySystem "aarch64-darwin";
  };
}
