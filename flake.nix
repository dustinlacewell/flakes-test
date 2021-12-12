{
  inputs = {
    my-hello = {
      url = "./hello";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixos-hardware, my-hello, ... }: {
    # an attrset of hostnames, the flake will select a
    # configuration based on the system hostname
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux"; # the system architecture
        modules = [ # modules to load
          nixos-hardware.nixosModules.dell-xps-13-9380 # Sample of a third party module
          (import ./logos.nix)
          my-hello
        ];
      };
    };
  };
}
