{
  description = "NixOS configurations - DxRed's machines";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake/beta";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    gruvbox-wallpapers.url = "github:AngelJumbo/gruvbox-wallpapers";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      stylix,
      zen-browser,
      gruvbox-wallpapers,
      ...
    }@inputs:
    let
      desktopModules = [
        ./modules/hyprland.nix
        ./modules/parsec.nix
        ./modules/libreoffice.nix
        ./modules/steam.nix
        ./modules/nemo.nix
      ];

      sharedModules = [
        ./modules/common.nix

        stylix.nixosModules.stylix

        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "bak";
          home-manager.extraSpecialArgs = { inherit inputs; };
          home-manager.users.red = import ./home/red.nix;
        }
      ];
    in
    {
      nixosConfigurations = {
        "14are05" = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules =
            sharedModules
            ++ desktopModules
            ++ [
              ./hosts/14are05/hardware-configuration.nix
              ./hosts/14are05/configuration.nix

              {
                services.displayManager.sddm.settings.Autologin = {
                  Session = "hyprland.desktop";
                  User = "red";
                };
              }
            ];
        };
      };
    };
}
