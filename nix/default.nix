{ ... }: {
  perSystem = { self', pkgs, ... }: {
    devShells.default = pkgs.callPackage ./shell.nix { inherit self'; };

    packages.default = pkgs.callPackage ./package.nix { };
  };
}
