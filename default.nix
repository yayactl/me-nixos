{
  sources ? import ./npins,
  pkgs ? import sources.nixpkgs { },
}:

rec {
  lib = { };

  systems = {
    hpEliteBook = import ./hosts/hp-elite-book.nix;
  };

  nixosConfigurations = builtins.mapAttrs (name: config: pkgs.nixos [ config ]) systems;

  shell = pkgs.mkShell { packages = [ pkgs.nixfmt-rfc-style ]; };
}
