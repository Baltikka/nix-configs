{
    description = "Ninekei NixOS system";

    inputs = {
        nixpkgs.url = github:NixOS/nixpkgs/nixos-26.05;

        happ-nixos.url = "git+https://codeberg.org/VOXEL0798/happ.flake.git";
        happ-nixos.inputs.nixpkgs.follows = "nixpkgs";
    };

    outputs = {self, nixpkgs, happ-nixos, ...}: {
        nixosConfigurations.nixpad = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            modules = [
                ./configuration.nix
                happ-nixos.nixosModules.default
            ];
        };
    };
}
