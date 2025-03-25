{
  stdenv,
  fetchFromGitHub,
  imlib2,
  xorg,
}:

stdenv.mkDerivation {

  pname = "hello";
  version = "v0.5";

  ## This package's source code is hosted on GitHub
  ## Its fetcher needs some other attributes to work properly
  src = fetchFromGitHub {
    ## Instead of an URL, you can define the owner, repository, and revision of the source code.
    owner = "atextor";
    repo = "icat";
    rev = "v0.5";

    ## When fetching from github, you can get the hash by running the command:
    ## nix-prefetch-url --unpack https://github.com/atextor/icat/archive/refs/tags/v0.5.tar.gz --type sha256
    sha256 = "0wyy2ksxp95vnh71ybj1bbmqd5ggp13x3mk37pzr99ljs9awy8ka";
  };

  ## This package has dependencies that are not provided by the source code.inherit
  ## In order to check them, run: nix-build -A icat

  ## The log tells about the missing dependency on the imlib2 header.
  ## This file is already packaged in nixpkgs, so we can add it to the inputs of this expression and add its name to the buildInputs attribute.

  ## Other dependency is the X11/Xlib.h header.
  ## This file is packaged inside the xorg package, as xorg.libX11.
  ## Therefore, include xorg as an input and add xorg.libX11 to the buildInputs attribute.

  buildInputs = [
    imlib2
    xorg.libX11
  ];

  ## We are using the stdenv, which processes the Makefile provided by icat.
  ## Until now, the phases of configure and make ran successfully.
  ## However, the Makefile lacks a proper install target.
  ## In order to install the binary, we need to add a new phase to the build process.
  ## We just need to create a binary directory on the output path (inside Nix store) and copy the icat binary to it.
  ## The commands run in this phase are relative to the ./result/bin directory.

  ## It is a good practice to include the pre and post hooks in each phase, even if they are not used.
  installPhase = ''
    runHook preInstall
    mkdir -p $out/bin
    cp icat $out/bin
    runHook postInstall
  '';

  ## The result of the build will be a symlink to the output of the derivation in the Nix store.
}
