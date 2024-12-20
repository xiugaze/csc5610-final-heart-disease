{
  description = "CSC 5610";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
    let
      supportedSystems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
      forEachSupportedSystem = f: nixpkgs.lib.genAttrs supportedSystems (system: f {
        pkgs = import nixpkgs { inherit system; };
      });
    in
    {
      devShells = forEachSupportedSystem ({ pkgs }: {
        default = pkgs.mkShell {
          packages = with pkgs; [ 
            python3
            jupyter-all
            pandoc
            texliveSmall
          ] ++ (with pkgs.python312Packages; [
            pandas
            numpy
            matplotlib
            wheel
            seaborn
            pyarrow
            scipy
            patsy
            statsmodels
            scikitlearn
            openpyxl
            graphviz
            xlrd
            geopy 
            imbalanced-learn
          ]);
          shellHook = ''
            exec zsh
          '';
        };
      });
    };
}
