{
  description = "My nix config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    musnix.url = "github:musnix/musnix";
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      musnix,
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
      };

      # 'home-manager build/switch --flake .#your-username@your-hostname'
      homeConfigurations = {
        "alex@inspiron" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
          extraSpecialArgs = { inherit pkgs-unstable; };
          modules = [ ./home/alex/inspiron ];
        };

        "alex@archibald" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
          extraSpecialArgs = { inherit pkgs-unstable; };
          modules = [ ./home/alex/archibald ];
        };
      };
    };
}
