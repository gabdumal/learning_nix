## Paths in Nix are used to refer to files and directories.
## They are written without quotes and are separated by slashes.

{
  ## This refers to the current file.
  current_file = ./file.nix;

  ## This refers to the current directory.
  current_directory = ./.;

  ## This refers to the parent directory.
  parent_directory = ../.;

  ## This refers to the root directory.
  root_directory = /.;

  ## This refers to the nix directory in the root directory.
  nix_directory = /nix;

  ## You can use angle brackets to refer to a lookup path.
  ## This is useful when you want to refer to a file in the Nix store.
  lookup_path = <nixpkgs>;
  lib_on_lookup_path = <nixpkgs/lib>;
}
