{
  sources ? import ./npins,
  pkgs ? import sources.nixos-unstable { },
  home-manager ? import sources.home-manager {}
}:

rec {
  lib = { };

  systems = {
    hpEliteBook = { config, ... }: {
      _module.args = { pkgs = pkgs.lib.mkForce pkgs; };
      imports = [
        home-manager.nixos
        (import ./hosts/hp-elite-book.nix)
      ];
    };
  };

  nixosConfigurations = builtins.mapAttrs (name: config: pkgs.nixos [ config ]) systems;

  shell = pkgs.mkShell { packages = [ pkgs.nixfmt-rfc-style ]; };
}
