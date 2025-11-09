[private]
default:
    @just --list --unsorted

alias r := run

# Run neovim flake
run:
    nix run .#

# Show neovim flake output
show:
    nix flake show

# Update flake
up:
    nix flake update

# Check flake
check:
    nix flake check

[group('jj')]
add:
  jj bookmark s main

[group('jj')]
commit:
  jj describe

[group('jj')]
push:
  jj git push
