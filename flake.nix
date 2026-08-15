{
  description = "Robbie's nix-darwin config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-25.11-darwin";
    nix-darwin.url = "github:nix-darwin/nix-darwin/nix-darwin-25.11";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager/release-25.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  # Build darwin flake using:
  # $ darwin-rebuild build --flake .#Robbies-MacBook-Pro
  outputs = 
    inputs@{ 
      self, 
      nixpkgs,
      nix-darwin, 
      home-manager,
      ...
    }: {
      darwinConfigurations."Robbies-MacBook-Pro" = 
        nix-darwin.lib.darwinSystem {
          system = "aarch64-darwin";

          modules = [ 
            ./configuration.nix
            home-manager.darwinModules.home-manager
            {
              nixpkgs.config.allowUnfree = true;

              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = { inherit inputs; };
              home-manager.users.rshirts = ./home.nix;
            }
          ];
        };
    };
}
