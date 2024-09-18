{
  sources ? import ./npins,
  pkgs ? import sources.nixpkgs { },
  home-manager ? import sources.home-manager {}
}:

rec {
  lib = { };

  systems = {
    hpEliteBook = { config, ... }: {
      imports = [
        home-manager.nixos
        (import ./hosts/hp-elite-book.nix)
      ];
    };
  };

  nixosConfigurations = builtins.mapAttrs (name: config: pkgs.nixos [ config ]) systems;

  shell = pkgs.mkShell { packages = [ pkgs.nixfmt-rfc-style ]; };
}
