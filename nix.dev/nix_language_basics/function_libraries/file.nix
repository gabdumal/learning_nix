## The Nix language provides builtin operators, like +, ==, &&, etc.

let

  a = 1;
  pkgs = import <nixpkgs> { };

in

{

  ## The language also provides some other builtin functions, written in C++.
  ## You can find the list of them in the [reference](https://nix.dev/manual/nix/latest/language/builtins.html).
  ## The builtin functions are called with the syntax builtins.<function_name> <arguments>.

  ## The builtins.toString function converts a value to a string.
  a = "${builtins.toString a}";

  ## The import function is a builtin that can be used at the top level.a
  ## It is used to import a Nix file and evaluate it.
  b_lamba = import ./add.nix;
  ## If the imported file is a function, you can call it by passing the arguments.
  b = import ./add.nix 1 2;

  ## Other commonly used library is the pkgs.lib, which is written in the Nix language.
  ## It provides a set of functions that are useful when writing Nix expressions.

  ## The pkgs.lib.concatStringsSep function concatenates a list of strings using a separator.
  c = pkgs.lib.concatStringsSep " " [
    "a"
    "b"
    "c"
  ];

}
