{
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    ./user.nix
    ./cache.nix
  ];

  # Auto upgrade nix package and the daemon service.
  nix.package = pkgs.nix;

  nix.registry.nixpkgs.flake = inputs.nixpkgs;

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  programs.zsh.enable = true;

  nixpkgs.config.allowUnfree = true;
}
