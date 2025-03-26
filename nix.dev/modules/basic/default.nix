let

  pkgs = import <nixpkgs> { };

  ## We evaluate the listed modules and return the resulting configuration.
  result = pkgs.lib.evalModules {
    modules = [
      ./options.nix
      ./config.nix
    ];
  };

in

result.config

## We can see the resulting attribute set as JSON by running:
# nix-shell -p jq --run "nix-instantiate --eval --json --strict | jq"
