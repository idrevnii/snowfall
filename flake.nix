{
    description = "anc13nt NixOS";

    inputs = {
	    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
        nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
        home-manager.url = "github:nix-community/home-manager/release-23.11";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";

        firefox-addons = {
            url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        zen-browser.url = "github:MarceColl/zen-browser-flake";
    };

    outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, zen-browser, ... }@inputs:
	let 
	    lib = nixpkgs.lib;
	    system = "x86_64-linux";
	    pkgs = nixpkgs.legacyPackages.${system};
        pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
        zenbrowser = zen-browser.packages.${system}.specific;
	in
    {
		nixosConfigurations.titanium = lib.nixosSystem {
                inherit system;
				modules = [
                    ./system/configuration.nix 
				];
                specialArgs = {
                    inherit pkgs-unstable;
                };
        };

		homeConfigurations = {
			anc13nt = home-manager.lib.homeManagerConfiguration {
				inherit pkgs;
				modules = [ ./home ];
                extraSpecialArgs = {
                    inherit pkgs-unstable;
                    inherit inputs;
                    inherit zenbrowser;
                };
			};
		};
    };
}
