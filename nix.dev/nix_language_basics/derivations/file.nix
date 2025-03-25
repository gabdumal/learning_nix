## The Nix language is used to describe derivations.
## It runs them to produce build results.
## So them can be used as inputs to other derivations.
## The builtin function to produce derivations is: derivation.
## However, it is more common to use the wrapper function: stdenv.mkDerivation.

## The output of a derivation is an attribute set with some predefined attributes.
## It can also be used on string interpolation, in which case it will output the path to the build result on the Nix store.

let
  ## Nix pkgs is a derivation as well.
  pkgs = import <nixpkgs> { };

in

## It returns an attribute set, which includes packages.
## The result will be: "/nix/store/shaj16d4gry1a930h1rannl8y5y9wjl7-nix-2.24.12"
"${pkgs.nix}"
