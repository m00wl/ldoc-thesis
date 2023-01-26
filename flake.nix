{
  description = "m00wl's large document thesis";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = inputs @ {flake-parts, ...}:
    flake-parts.lib.mkFlake {inherit inputs;} {
      imports = [];
      systems = [
        "x86_64-linux"
        "aarch64-darwin"
      ];
      perSystem = {
        config,
        self',
        inputs',
        pkgs,
        system,
        ...
      }: let
        tex = pkgs.texlive.combine {
          inherit (pkgs.texlive) scheme-small latexmk tudscr
          newunicodechar
          acro translations
          csquotes biblatex biber
          standalone svn-prov pgfplots;
        };
      in {
        devShells.default = pkgs.mkShell {
          packages = [tex];
          shellHook = ''
            export LDOC_THESIS_ROOT=$(git rev-parse --show-toplevel)
            alias mt="cd $LDOC_THESIS_ROOT/thesis && latexmk ldoc-thesis.tex && cd -"
            alias mtc="cd $LDOC_THESIS_ROOT/thesis && latexmk -C && cd -"
          '';
        };
      };
      flake = {};
    };

  nixConfig = {
    bash-prompt-suffix = "dev: ";
  };
}
