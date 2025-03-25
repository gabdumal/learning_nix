## We need to provide some inputs for our derivation.
## You can build the package with the command: nix-build default.nix

let

  ## We will use the fetchTarball function to download the nixpkgs repository.
  ## Then, we define a pkgs variable that imports the nixpkgs repository.
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-24.05";
  pkgs = import nixpkgs {
    config = { };
    overlays = [ ];
  };

in
{

  ## Finally, we import our expression hello.nix via the callPackage function.
  ## It passes useful attributes from pkgs to the called expression, like stdenv and fetchzip.
  hello = pkgs.callPackage ./hello.nix { };

}

## The result of the build will be a symlink to the output of the derivation in the Nix store.
## You can execute the binary with the command: ./result/bin/hello
