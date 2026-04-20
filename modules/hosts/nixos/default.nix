{ self, inputs, ... }: {
    nixosConfigurations.nixos = inputs.nixpkgs.lib.nixosSystem {
        modules = [
            self.nixosModules.nixosConfiguration
        ];
    };
}
