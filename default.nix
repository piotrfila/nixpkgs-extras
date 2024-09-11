{ system ? builtins.currentSystem }:

let
  pkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/master.tar.gz") { inherit system; };

  callPackage = pkgs.lib.callPackageWith (pkgs // self);

  self = {
    openocd-rp2350 = callPackage ./pkgs/openocd-rp2350/package.nix {};
  };
in
self
