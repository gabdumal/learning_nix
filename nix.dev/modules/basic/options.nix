## A module is a function that accepts an attribute set as an argument and returns an attribute set.

## lib is passed automatically by the module system.
{ lib, ... }:
{

  options = {
    ## We are setting an option named "name" of type string.
    name = lib.mkOption {
      type = lib.types.str;
    };
  };

}
