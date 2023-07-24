{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
  };
  outputs = { nixpkgs, self }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      packages.${system}.default = pkgs.stdenv.mkDerivation {
        pname = "nix-dep-test";
        version = "0.1";
        src = ./.;
        buildInputs = with pkgs; [ nixVersions.nix_2_16 boost ];
        buildPhase = "g++ ./main.cc";
        installPhase = "mv ./a.out $out";
      };
      devShells.${system}.default = pkgs.mkShell {
        inputsFrom = [ self.packages.${system}.default ];
      };
    };
}
