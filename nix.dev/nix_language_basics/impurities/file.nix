## When packaging external content, it is necessary to interact with impurities.
## They can be specified as build inputs of derivations.
## In order to do so, you can use file system paths or dedicated functions.

[

  ## When referencing a system file (or directory) path in a Nix expression, it needs to be imported into the Nix store.
  ## Nix wil make a hash of its content, and then copy it to the store with the name in the format: /nix/store/<hash>-<name>

  ## The following line imports the file data.nix and outputs its path in the Nix store.
  ## The result will be: "/nix/store/1cc5mx7p0jzl3c3270a9gxr525abj8y2-data.nix"
  "${./data.nix}"

  ## Another way of importing external content is by using fetchers.
  ## Some builtin fetchers are: fetchurl, fetchTarball, fetchGit, fetchClosure
  ## They will copy the file (or directory) to the Nix store and return its path.

  ## The following line fetches a tarball from a URL and outputs its path in the Nix store.
  ## The result will be: "/nix/store/d59llm96vgis5fy231x6m7nrijs0ww36-source"
  "${builtins.fetchTarball "https://github.com/NixOS/nix/archive/7c3ab5751568a0bc63430b33a5169c5e4784a0ff.tar.gz"}"

]
