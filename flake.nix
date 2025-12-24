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
      self,
      nixpkgs,
      home-manager,
    }:
    let
      pkgs = nixpkgs.legacyPackages."aarch64-linux";
    in
    {
      homeConfigurations = {
        dev-profile = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./home/home.nix
          ];
        };
      };
    };
}
