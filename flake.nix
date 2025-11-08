{
  description = "NixOS configuration of Haoxiang Pei";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
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
    ...
  } @ inputs: let
    # Helper function to generate nixosSystem configuration.
    mkNixosSystem = hostName: hostConfig: let
      specialArgs = { inherit inputs hostConfig; };
    in
      nixpkgs.lib.nixosSystem {
        inherit specialArgs;
        modules =
          [
            { nixpkgs.config.allowUnfree = true; }
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = inputs // specialArgs;
                users = builtins.mapAttrs (username: configPath: import configPath) hostConfig.homeManagerConfigs;
                backupFileExtension = "backup";
              };
            }
          ]
          ++ (hostConfig.configs or []);
      };

    # Automatically discover all hosts.
    hostNames = builtins.attrNames (builtins.readDir ./hosts);
    hostConfigs = builtins.listToAttrs (
      map (hostName: {
        name = hostName;
        value = import ./hosts/${hostName}/host.nix;
      })
      hostNames
    );
  in {
    nixosConfigurations = nixpkgs.lib.mapAttrs mkNixosSystem hostConfigs;
  };
}
