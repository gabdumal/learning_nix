## A package may have different meanings.
## It can be a collection of files and other data
## It can also be a Nix expression that describes a function that outputs the derivation that will be used to build the package.

## Let's define a function that creates a derivation for the GNU Hello package.
## You can realise it with the command: nix-build -A hello.nix

{ stdenv, fetchzip }:

stdenv.mkDerivation {

  pname = "hello";
  version = "2.12.1";

  src = fetchzip {
    url = "https://ftp.gnu.org/gnu/hello/hello-2.12.1.tar.gz";
    ## When fetching external sources, you need to set its has.
    ## To do so, you can let it initially empty, and try to build the package.
    ## The error message will provide the hash that you need to set here.
    sha256 = "sha256-1kJjhtlsAkpNB7f6tZEs+dbKd8z7KoNHyDHEJ0tmhnc=";
  };

}
