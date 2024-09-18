set shell := ["bash", "-uc"]

[private]
default:
  @just --list

# list all generations of the system profile
[group('nix')]
history:
  nix profile history --profile /nix/var/nix/profiles/system

# remove all generations older than 7 days
[group('nix')]
clean:
  sudo nix profile wipe-history --profile /nix/var/nix/profiles/system  --older-than 7d
