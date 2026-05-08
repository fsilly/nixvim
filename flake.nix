{
  description = "Sly-Harvey's nixvim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixvim.url = "github:nix-community/nixvim";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs =
    { self, nixpkgs, nixvim, flake-parts, ... }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      perSystem =
        { system, ... }:
        let
          pkgs = import nixpkgs {
            inherit system;
          };
          nixvimLib = nixvim.lib.${system};
          nixvim' = nixvim.legacyPackages.${system};
          nixvimModule = {
            inherit system; # or alternatively, set `pkgs`
            module = import ./config; # import the module directly
            # You can use `extraSpecialArgs` to pass additional arguments to your module files
            extraSpecialArgs = {
              # inherit (inputs) foo;
            };
          };
          nvim = nixvim'.makeNixvimWithModule nixvimModule;
        in
        {
          checks = {
            # Run `nix flake check .` to verify that your config is not broken
            default = nixvimLib.check.mkTestDerivationFromNixvimModule nixvimModule;
          };

          packages = {
            # Lets you run `nix run .` to start nixvim
            default = nvim;
          };
          devShells.default = pkgs.mkShell {
            packages = with pkgs; [
              git
              just
              fd
              ripgrep
              entr
              statix
              deadnix
              nixd
              nil
              alejandra

              # local nixvim build
              nvim
            ];

            shellHook = ''
              echo "Using LOCAL nixvim config"

              export EDITOR="${nvim}/bin/nvim"
              export VISUAL="${nvim}/bin/nvim"

              alias vim="${nvim}/bin/nvim"
              alias nvim="${nvim}/bin/nvim"

              echo "nvim => $(which nvim)"
            '';
          };
        };
    };
}
