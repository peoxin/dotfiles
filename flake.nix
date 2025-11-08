{
  description = "NixOS configuration of Haoxiang Pei";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin.url = "github:catppuccin/nix";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    quickshell = {
      url = "github:outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.quickshell.follows = "quickshell";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nix-darwin,
    ...
  } @ inputs: let
    # Helper function to generate system configuration.
    mkSystem = hostName: hostConfig: let
      specialArgs = {inherit inputs hostConfig;};
      systemType = hostConfig.os or "nixos";

      # System agnostic configuration.
      commonModules =
        [
          {nixpkgs.config.allowUnfree = true;}
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = specialArgs;
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
          nixos = {
            builder = nixpkgs.lib.nixosSystem;
            homeManagerModule = home-manager.nixosModules.home-manager;
          };
          darwin = {
            builder = nix-darwin.lib.darwinSystem;
            homeManagerModule = home-manager.darwinModules.home-manager;
          };
        }.${
          systemType
        };
    in
      systemConfig.builder {
        inherit specialArgs;
        modules = [systemConfig.homeManagerModule] ++ commonModules;
      };

    # Automatically discover all host configurations.
    hostNames = builtins.attrNames (builtins.readDir ./hosts);
    hostConfigs = builtins.listToAttrs (
      map (hostName: {
        name = hostName;
        value = import ./hosts/${hostName}/host.nix;
      })
      hostNames
    );

    # Build all host configurations.
    allSystems = nixpkgs.lib.mapAttrs mkSystem hostConfigs;

    # Group host configurations by system type.
    groupBySystem = systemType:
      nixpkgs.lib.filterAttrs (
        name: _:
          (hostConfigs.${name}.os or "nixos") == systemType
      )
      allSystems;
  in {
    nixosConfigurations = groupBySystem "nixos";
    darwinConfigurations = groupBySystem "darwin";
  };
}
