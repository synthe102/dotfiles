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
  nix.gc = {
    automatic = true;
    interval = {
      Weekday = 0;
      Hour = 2;
      Minute = 0;
    }; # Weekly on Sunday
    options = "--delete-older-than 7d";
  };

  # Optional: auto optimize store
  nix.optimise = {
    automatic = true;
    interval = {
      Weekday = 0;
      Hour = 3;
      Minute = 0;
    };
  };

  nix.registry.nixpkgs.flake = inputs.nixpkgs;

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  programs.zsh.enable = true;

  nixpkgs.config.allowUnfree = true;
}
