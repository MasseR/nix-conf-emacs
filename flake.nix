{
  description = "My emacs config";

  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    {
      overlay = final: prev: {
        myEmacs = final.callPackage ./. {};
      };
    }
    //
    flake-utils.lib.eachSystem ["x86_64-linux"] (
      system:
      let pkgs = import nixpkgs { inherit system; overlays = [ self.overlay ]; };
      in
        rec {
          packages.myEmacs = pkgs.myEmacs;
          defaultPackage = packages.myEmacs;
          apps.myEmacs = {
            type = "app";
            program = "${packages.myEmacs}/bin/emacs";
          };
          defaultApp = apps.myEmacs;
        }
    );
}
