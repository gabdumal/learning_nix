{ stdenv, lib }:

let

  fs = lib.fileset;

  # ## Set ./hello.txt, ./world.txt, ./build.sh, and all the .c and .h files in ./src as the source files
  # sourceFiles = fs.unions [
  #   ./hello.txt
  #   ./world.txt
  #   ./build.sh
  #   (fs.fileFilter (file: file.hasExt "c" || file.hasExt "h") ./src)
  # ];

  ## Set the files ./hello.txt, ./world.txt, ./build.sh, and all the files in ./src as the source files as long as they are tracked by git
  sourceFiles = fs.intersection (fs.gitTracked ./.) (
    fs.unions [
      ./hello.txt
      ./world.txt
      ./build.sh
      ./src
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
      cp -vr . $out
    '';

  }

)
