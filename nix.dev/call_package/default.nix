let

  pkgs = import <nixpkgs> { };

in

## We are defining an attribute set with different outputs.
## You can build a specific output by running nix-build -A <name_of_the_attribute>.
rec {

  ## We can pass an attribute to the expression on ./hello.nix.
  hello = pkgs.callPackage ./hello.nix { audience = "people"; };

  ## Using a recursive attribute set, we can create another output using the hello attribute.
  ## We can use the override keyword to change the value of passed attributes.
  hello-folks = hello.override { audience = "folks"; };

}
