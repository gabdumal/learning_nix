{ stdenv, lib }:

let

  fs = lib.fileset;

  # ## Set current directory as the root, excluding ./result
  # sourceFiles = fs.difference ./. (fs.maybeMissing ./result);

  # ## Set current directory as the root, excluding ./result (which might not exist), ./default.nix, ./build.nix, and ./npins
  # sourceFiles = fs.difference ./. (
  #   fs.unions [
  #     (fs.maybeMissing ./result)
  #     ./default.nix
  #     ./build.nix
  #     ./npins
  #   ]
  # );

  ## Set current directory as the root, excluding ./result (which might not exist), ./npins and all the .nix files
  sourceFiles = fs.difference ./. (
    fs.unions [
      (fs.maybeMissing ./result)
      ./npins
      (fs.fileFilter (file: file.hasExt "nix") ./.)
    ]
  );

in

## Copy only the files listed in sourceFiles to the output directory
fs.trace sourceFiles (

  stdenv.mkDerivation {

    name = "fileset";

    src = fs.toSource {
      root = ./.;
      fileset = sourceFiles;
    };

    postInstall = ''
      mkdir $out
      cp -v {hello,world}.txt $out
    '';

  }

)
