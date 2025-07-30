{
  description = "My nix config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    musnix.url = "github:musnix/musnix";

    helix.url = "github:helix-editor/helix/master";

    nix-colors.url = "github:misterio77/nix-colors";

    nix-index-database.url = "github:nix-community/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      musnix,
      helix,
      nix-colors,
      nix-index-database,
      ...
    }@inputs:
    let
      # inherit (self) outputs;
      system = "x86_64-linux";
      pkgs-unstable = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      # 'nixos-rebuild build/switch --flake .#your-hostname'
      nixosConfigurations = {
        inspiron = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit musnix; };
          # > Our main nixos configuration file <
          modules = [
            inputs.musnix.nixosModules.musnix
            ./hosts/inspiron
          ];
        };
        archibald = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit musnix; };
          modules = [
            inputs.musnix.nixosModules.musnix
            ./hosts/archibald
          ];
        };
      };

      # 'home-manager build/switch --flake .#your-username@your-hostname'
      homeConfigurations = {
        "alex@inspiron" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          extraSpecialArgs = {
            inherit pkgs-unstable;
            inherit inputs;
          };
          modules = [
            ./home/alex/inspiron
            nix-index-database.homeModules.nix-index
          ];
        };

        "alex@archibald" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          extraSpecialArgs = {
            inherit pkgs-unstable;
            inherit inputs;
          };
          modules = [
            ./home/alex/archibald
            nix-index-database.homeModules.nix-index
          ];
        };
      };
    };
}
