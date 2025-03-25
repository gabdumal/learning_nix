## This file is a Nix expression that declares a derivation.
## It uses the pkgs.makeShellNoCC wrapper function to create a derivation that builds a shell environment.

## Let's accept as a function argument the pkgs attribute set.
## If it is not provided, we will import the nixpkgs attribute set.
{
  pkgs ? import <nixpkgs> { },
}:

## We are now defining the body of the function.
let
  message = "Hello, Nix!";
in

## Let's call the wrapped function.
## It accepts an attribute set as argument.
pkgs.mkShellNoCC {

  ## The function allows us to define the packages that we want to include in the shell environment.
  packages = with pkgs; [
    ## We are including pkgs.cowsay in the shell environment.
    cowsay
  ];

  ## Let's define some commands to be run on the shell when deriving the environment.
  ## We are using the cowsay command to print the previously defined message.
  shellHook = ''
    cowsay "${message}"
  '';

}

## The returned value is a function.
## You can build the derivation with the nix-build command.
## It will produce a file named result in the current directory.
## The file will contain needed definitions to create the shell environment.
