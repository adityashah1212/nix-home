{
  description = "Aditya Shah's profile flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";

    # Ensure that all dependencies use the same set of packages as our own
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      ...
    }:
    {
      homeConfigurations = {
        mac = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."aarch64-darwin";
          modules = [
            ./home/home.nix
          ];
          extraSpecialArgs = {
            username = "adityashah";
            homeDir = "/Users/adityashah";
            system = "aarch64-darwin";
          };
        };

        lima = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."aarch64-linux";
          modules = [
            ./home/home.nix
          ];
          extraSpecialArgs = {
            username = "adityashah";
            homeDir = "/home/adityashah";
            system = "aarch64-linux";
          };
        };
      };
    };
}
