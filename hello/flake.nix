{
  description = "A flake for building Hello World";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/unstable";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, utils }: utils.lib.eachDefaultSystem (system:
    let
      pkgs = import nixpkgs {
        inherit system;
      };
    in {
      packages.${system}.my-hello = pkgs.callPackage ./. { };
      defaultPackage = pkgs.callPackage ./. { };
      devShell = pkgs.mkShell {
        nativeBuildInputs = with pkgs; [
          my-hello
        ];
      };
    });
}

