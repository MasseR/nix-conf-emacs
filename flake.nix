{
  description = "My emacs config";

  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in
        rec {
          packages.myEmacs = pkgs.callPackage ./. {};
          defaultPackage = packages.myEmacs;
          apps.myEmacs = {
            type = "app";
            program = "${packages.myEmacs}/bin/emacs";
          };
          defaultApp = apps.myEmacs;
        }
    );
}
